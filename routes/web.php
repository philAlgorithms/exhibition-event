<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\FileController;
use App\Mail\Event\EventRegistered;
use App\Mail\Exhibition\TheForgottenCountry\{RegistrationCompleted};
use App\Models\EventAttendee;
use App\Models\Exhibitor;
use Illuminate\Support\Facades\Route;

// if (App::isProduction()) {
//     header("Cache-Control: no-cache, must-revalidate");
//     header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
//     header('Access-Control-Allow-Origin:  https://www.natesaconsulting.com');
//     header('Access-Control-Allow-Methods:  POST, GET, OPTIONS, PUT, DELETE');
//     header('Access-Control-Allow-Headers:  Content-Type, Authorization, X-XSRF-TOKEN, X-CSRF-TOKEN, Accept');
//     header('Access-Control-Allow-Credentials:   true');
// } else {
//     header('Access-Control-Allow-Origin:  https://www.natesaconsulting.test');
// }

Route::get('/', function () {
    return view('welcome');
});
Route::prefix('auth')->group(function () {
    Route::prefix('/login')->group(function () {
        // Route::get('/exhibitor', [LoginController::class, 'authenticateExhibitor']);
    });
});
Route::get('/phpinfo', function () {
    return phpinfo();
});

Route::get('/gdrive', function () {
    return view('gdrive');
});

Route::prefix('/mails')->group(function () {
    Route::prefix('/exhibitions')->group(function () {
        Route::prefix('/the-forgotten-country')->group(function () {
            Route::get('/registration-completed', function () {
                return new RegistrationCompleted(
                    Exhibitor::first(),
                    'The Forgotten Country, 2024.',
                    '16 Feb, 2024; 12:00PM',
                    'International Convention Center, Awka, Anambra State.'
                );
            });
        });
    });
    Route::prefix('/events')->group(function () {
        Route::get('/registered/{attendee}', function (EventAttendee $attendee) {
            return new EventRegistered(
                $attendee,
                'The Forgotten Country, 2024.',
                '16 Feb, 2024; 12:00PM',
                'International Convention Center, Awka, Anambra State.'
            );
        });
    });
});

Route::resource('/files', FileController::class);
