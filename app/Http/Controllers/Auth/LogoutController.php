<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful;

class LogoutController extends Controller
{
    public function __invoke()
    {
        Auth::logout();

        request()->session()->invalidate();

        request()->session()->regenerateToken();

        // return redirect('/login');
    }
}
