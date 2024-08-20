<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Log;

use App\Models\User;
use App\Models\Admin;
use App\Models\PasswordReset;
use Carbon\Carbon;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator as FacadesValidator;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;
use Illuminate\Validation\Validator;

class PasswordController
{
	public function change(Request $request)
	{
		$validator = validator($request->all(), [
			'confirm_password' => 'required|same:new_password',
			'new_password' => [
				'required',
				'min:8',
				'regex:' . env('PASSWORD_PATTERN')
			],
			'current_password' => ['required', 'string'],
		])->validate();

		$user = User::find(auth()->user()->id);

		if (Hash::check($request->current_password, $user->password)) {
			if ($user->update(['password' => Hash::make($request->new_password)])) {
				return response([]);
			}
			throw ValidationException::withMessages(['Error querying' => "Unable to update password. Try again later."]);
		}
		return response("Wrong password", 403);
	}

	public function requestOneTimeLogin(Request $request)
	{
		$roleValidator = validator($request->all(), [
			'role' => ['required', 'in:exhibitor']
		])->validate();
		$validator = validator($request->all(), [
			'email' => Rule::exists('users', 'email')->where(fn (Builder $query) => $query->whereExists(function (Builder $query) use ($roleValidator) {
				$query->select(DB::raw(1))
					->from("{$roleValidator['role']}s")
					->whereColumn('users.id', "{$roleValidator['role']}s.user_id");
			})),
		])->validate();

		$user = User::firstWhere('email', $validator['email']);
		$token = Str::random(64);

		DB::table(config('auth.passwords.users.table'))->insert([
			'email' => $user->email,
			'token' => $token
		]);

		Mail::send([
			'to'      => $user->email,
			'subject' => 'Your One-time login Link',
			'view'    => config('auth.passwords.users.email'),
			'view_data' => [
				'token' => $token,
				'user'  => $user
			]
		]);

		return redirect()->back()->with('status', trans(Password::RESET_LINK_SENT));
	}
}
