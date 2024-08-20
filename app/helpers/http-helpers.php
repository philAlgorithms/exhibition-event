<?php

use Illuminate\Http\Request;

/**
 * Makes a post request using curl
 */
function post_curl(string $uri, array $request)
{
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, $uri);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(
        $request
    ));
        
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    return curl_exec($ch);
}

/**
 * Makes a put request using curl
 */
function put_curl(string $uri, array $request)
{
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, $uri);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(
        $request
    ));
        
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    return curl_exec($ch);
}

function api(string $url): string
{
    return env('MONOLITH_APP', true) ? "/api/{$url}" : $url;
}

function admin_url(string $url): string
{
    $url = ltrim($url, '/');
    return url("/account/admin/{$url}");
}

function getPaginator(Request $request, int $default=100)
{
    return $request->has('paginate') && is_numeric($request->paginate) ? $request->paginate : env('PAGINATION_LENGTH', $default);
}