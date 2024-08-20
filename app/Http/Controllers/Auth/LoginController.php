<?php

namespace App\Http\Controllers\Auth;

use App\Http\Resources\{UserResource};
use App\Mail\Auth\Login\Exhibitor\OneTimeLogin;
use App\Models\{Exhibitor, OneTimeLoginToken, User};
use Carbon\Carbon;
use Illuminate\Auth\Events\Lockout;
use Illuminate\Database\Query\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class LoginController
{
    /**
     * Ensure the login request is not rate limited.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function ensureIsNotRateLimited(): void
    {
        if (!RateLimiter::tooManyAttempts($this->throttleKey(), env('MAX_LOGIN_ATTEMPTS', 5))) {
            return;
        }

        event(new Lockout(request()));

        $seconds = RateLimiter::availableIn($this->throttleKey());

        throw ValidationException::withMessages([
            'email' => trans('auth.throttle', [
                'seconds' => $seconds,
                'minutes' => ceil($seconds / 60),
            ]),
        ]);
    }

    /**
     * Get the rate limiting throttle key for the request.
     */
    public function throttleKey(): string
    {
        return Str::transliterate(Str::lower(request()->input('email')) . '|' . request()->ip());
    }

    /**
     * Handle an authentication attempt.
     */
    public function authenticate(Request $request)
    {
        $credentials = request()->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();

            return UserResource::make(
                User::firstWhere('email', $credentials['email'])
            );
        }

        throw ValidationException::withMessages([
            'email' => 'The provided credentials do not match our records.',
        ]);
    }

    public function authenticateExhibitor(Request $request)
    {
        $email = $request->email;
        $token = $request->token;
        $user = User::firstWhere('email', $email);

        $login_url = config('app.custom.frontend_url') . config('app.custom.frontend_login_path.exhibitor');
        if (!is_null($user)) {
            if (
                // $user instanceof User && /
                $user->matchOneTimeLoginToken($token)
            ) {
                $row = DB::table(config('auth.logins.users.table'))->where('email', $email)->first();
                if (is_null($row->created_at))
                    throw ValidationException::withMessages([
                        'email' => 'Wrong/Expired token.',
                    ]);
                else if ((new Carbon($row->created_at))->addMinutes(30) < now()) {
                    throw ValidationException::withMessages([
                        'email' => 'Expired token.',
                    ]);
                }
                // Auth::logout();
                Auth::login($user);
                // Session::regenerate(false);
                $delete = DB::table(config('auth.logins.users.table'))->where('email', $email)->delete();
                // OneTimeLoginToken::where('email', $email)->first()->delete();

                $request->session()->regenerate();

                // return redirect()->to(config('app.custom.frontend_url') . config('app.custom.frontend_dashboard_path.exhibitor'));
            } else {

                throw ValidationException::withMessages([
                    'email' => 'Wrong/Expired token.',
                ]);
            }
        } else {

            throw ValidationException::withMessages([
                'email' => 'The provided credentials do not match our records.',
            ]);
        }
        return UserResource::make(
            $user
        );
    }

    public function requestExhibitorAuthentication(Request $request)
    {
        $validated = validator(
            $request->all(),
            [
                'email' => ['required', 'email', Rule::exists('users', 'email')->where(fn (Builder $query) => $query->whereExists(function (Builder $query) {
                    $query->select(DB::raw(1))
                        ->from('exhibitors')
                        ->whereColumn('users.id', 'exhibitors.user_id');
                }))],
            ],
            [
                'email.exists' => 'User not registered as exhibitor.'
            ]
        )->validate();

        $exhibitor = User::firstWhere('email', $validated['email'])->exhibitor;

        if ($exhibitor instanceof Exhibitor) {
            $url = $exhibitor->generateOneTimeLoginUrl();

            Mail::to($exhibitor->user)
                ->send(new OneTimeLogin(
                    exhibitor: $exhibitor,
                    url: $url
                ));

            return response([], 200);
        }
        return response(['message' => 'User not found.'], 422);
    }
}
