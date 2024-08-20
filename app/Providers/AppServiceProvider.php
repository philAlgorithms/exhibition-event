<?php

namespace App\Providers;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Support\Collection;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Model::unguard();

        // Ngrok Fix https
        // if (isset($_SERVER['HTTPS']) && ($_SERVER['HTTPS'] == 'on' || $_SERVER['HTTPS'] == 1) || isset($_SERVER['HTTP_X_FORWARDED_PROTO']) &&  $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {
        //     $this->app['request']->server->set('HTTPS', true);
        // }

        // COLLECTION MACROS

        /**
         * Combines pluck and to array methods of Eloquent Collection
         */
        Collection::macro('pluckToArray', function ($column) {
            return $this->pluck($column)->toArray();
        });
        Relation::macro('pluckToArray', function ($column) {
            return $this->pluck($column)->toArray();
        });
    }
}
