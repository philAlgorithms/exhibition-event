<?php

use App\Http\Controllers\Auth\{LoginController, LogoutController, PasswordController, RegistrationController};
use App\Http\Controllers\{CurrencyController, EventAttendeeController, ExhibitorController, ExhibitorWorkController, PhotographyGenreController, SanityDocumentController};
use App\Http\Resources\{ExhibitorResource, UserResource};
use App\Models\{EventAttendee, Exhibitor, ExhibitorWork, User};
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\{Hash, Password, Route};
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;


// if (App::isProduction()) {
//     header("Cache-Control: no-cache, must-revalidate");
//     header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
//     header('Access-Control-Allow-Origin:  https://www.natesaconsulting.com', true);
//     header('Access-Control-Allow-Methods:  POST, GET, OPTIONS, PUT, DELETE');
//     header('Access-Control-Allow-Headers:  Content-Type, Authorization, X-XSRF-TOKEN, X-CSRF-TOKEN, Accept');
//     header('Access-Control-Allow-Credentials:   true');
// }

Route::prefix('user')->group(function () {
    Route::get('/', function (Request $request) {
        $user = $request->user();
        return is_null($user) ? $user : UserResource::make($user);
    });
    Route::get('/exhibitor', function (Request $request) {
        $user = $request->user();
        if (is_null($user))
            return null;
        else return is_null($user->exhibitor) ? null : ExhibitorResource::make($user->exhibitor);
    })->middleware('role:exhibitor');
});
// CONCERNING AUTHENTICATION
Route::prefix('auth')->group(function () {
    Route::prefix('/login')->group(function () {
        Route::post('/', [LoginController::class, 'authenticate'])->name('login');
        Route::post('/exhibitor', [LoginController::class, 'authenticateExhibitor']);
        Route::post('/exhibitor/request', [LoginController::class, 'requestExhibitorAuthentication']);
    });
    Route::prefix('/register')->group(function () {
        Route::post('/exhibitor', [RegistrationController::class, 'registerExhibitor']);
        Route::post('/event-attendee/{event}', [RegistrationController::class, 'registerEventAttendee']);
    });

    Route::post('/logout', LogoutController::class);

    Route::post('/forgot-password', function (Request $request) {
        $request->validate(['email' => 'required|email']);

        $status = Password::sendResetLink(
            $request->only('email')
        );

        return $status === Password::RESET_LINK_SENT
            ? response(['status' => __($status)])
            : throw ValidationException::withMessages(['email' => __($status)]);
    })->middleware('guest')->name('password.email');

    Route::prefix('/email')->group(function () {
        Route::get('/verify', function () {
            return view('auth.verify-email');
        })->middleware('auth')->name('verification.notice');

        Route::get('/verify/{id}/{hash}', function (EmailVerificationRequest $request) {
            $user = $request->user;
            $has_already_verified_email = $user->hasVerifiedEmail();
            $request->fulfill();

            // if(!$has_already_verified_email && $user->hasVerifiedEmail())
            // {
            //     if(! is_null($user->eventAttendee))
            //     {
            //         Mail::to($user)->send(new EventRegistered($user->eventAttendee));
            //     }
            //     if(! is_null($user->exhibitor))
            //     {
            //         Mail::to($user)->send(new RegistrationCompleted($user->exhibitor));
            //     }
            // }

            return response(['message' => 'Email Verified']);
        })->middleware(['auth', 'signed'])->name('verification.verify');

        Route::post('/verification-notification', function (Request $request) {
            $request->user()->sendEmailVerificationNotification();

            return response(['message' => 'Email Verified']);
        })->middleware(['auth', 'throttle:6,1'])->name('verification.send');
    });

    Route::post('/reset-password', function (Request $request) {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed',
        ]);

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function (User $user, string $password) {
                $user->forceFill([
                    'password' => Hash::make($password)
                ])->setRememberToken(Str::random(60));

                $user->save();

                event(new PasswordReset($user));
            }
        );

        return $status === Password::PASSWORD_RESET
            ? redirect()->route('login')->with('status', __($status))
            : throw ValidationException::withMessages(['email' => [__($status)]]);
    })->middleware('guest')->name('password.update');

    Route::prefix('password')->group(function () {
        Route::post('/change', [PasswordController::class, 'change']);
    });
});

// Concerning currencies
Route::prefix('currencies')->group(function () {
    Route::get('/', [CurrencyController::class, 'index']);
});

// Photography Genre
Route::prefix('photography-genres')->group(function () {
    Route::get('/', [PhotographyGenreController::class, 'index']);
});

// Exhibitors
Route::prefix('exhibitors')->group(function () {
    Route::get('/', [ExhibitorController::class, 'index'])->middleware('role:admin');
    Route::get('/{exhibitor}', [ExhibitorController::class, 'show'])->middleware(['role:admin|exhibitor']);
    Route::put('/{exhibitor}', [ExhibitorController::class, 'update'])->middleware(['role:exhibitor']);
});

// Exhibitor works
Route::prefix('exhibitor-works')->group(function () {
    Route::get('/', [ExhibitorWorkController::class, 'index'])->middleware('role:admin|exhibitor');
    Route::get('/{exhibitorWork}', [ExhibitorWorkController::class, 'show'])->middleware('role:admin|exhibitor');
    Route::post('/', [ExhibitorWorkController::class, 'create'])->middleware(['role:exhibitor']);
});

// EventAttendees
Route::prefix('event-attendees')->group(function () {
    Route::get('/', [EventAttendeeController::class, 'index'])->middleware('role:admin');
    Route::get('/{eventAttendee}', [EventAttendeeController::class, 'show'])->where('eventAttendee', '[0-9]+')->middleware('role:admin');
    Route::post('/{eventAttendee}/check-in', [EventAttendeeController::class, 'checkIn'])->middleware('role:admin');
    Route::get('/get-by-email/{email}', [EventAttendeeController::class, 'showByEmail'])->middleware('role:admin');
});

// Photography Genre
Route::prefix('sanity-documents')->group(function () {
    Route::get('/', [SanityDocumentController::class, 'index']);
    Route::get('/sanity-id/{sanityId}/sanity-type/{sanityType}', [SanityDocumentController::class, 'showBySanityParams']);
    Route::get('/{sanityDocument}', [SanityDocumentController::class, 'show']);
});

// Concerning stats
Route::prefix('stats')->group(function () {
    Route::get('/admin', function () {
        return new JsonResource([
            'total_attendees' => EventAttendee::count(),
            'total_exhibitors' => Exhibitor::count(),
            'total_exhibitor_works' => ExhibitorWork::count()
        ]);
    })->middleware('role:admin');
});
