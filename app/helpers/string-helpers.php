<?php

use App\Models\Currency;
use App\Models\TimeUnit;
use Illuminate\Support\Str;

function replace_space($string, $character = '-')
{
    return strtolower(str_replace(" ", $character, $string));
}

function add_meta_tag($tag, $html)
{
    $init_head_pos = strpos($html, '</head>');

    if (!$init_head_pos) return $html;
    return substr($html, 0, $init_head_pos) . $tag . substr($html, $init_head_pos, strlen($html));
}

function singular($word, $count, bool $full = false)
{
    $word = $count == 1 ? Str::singular($word) : Str::plural($word);

    return $full ? $count . " " . $word : $word;
}

// REGEX HELPERS START


/**
 * Gets a regex pattern for number range
 */
function number_range_pattern(int|string $min_digits = 1, int|string $max_digits = "", string $start_pattern = "", string $end_pattern = "", bool $tolerate_space = true, string|null $comparator = null): string
{
    $space_pattern = $tolerate_space ? "\s?" : "";
    $end_pattern = $end_pattern === "" ? $end_pattern : "\s" . $end_pattern;

    $equalityPatern = "/^" . $space_pattern . "\d{"
        . $min_digits . "," . $max_digits . "}"
        . $end_pattern . $space_pattern . "$/";

    $lesserPattern = "/^" . $space_pattern . "\b(Less\sthan)\s"
        . "\d{" . $min_digits . "," . $max_digits . "}"
        . $end_pattern . $space_pattern . "$/";

    $greaterPattern = "/^" . $space_pattern . "\b(Greater\sthan|More\sthan)\s"
        . "\d{" . $min_digits . "," . $max_digits . "}"
        . $end_pattern . $space_pattern . "$/";

    $rangePattern = "/^" . $space_pattern . $start_pattern
        . "\d{" . $min_digits . "," . $max_digits
        . "}" . $space_pattern . "-{1}" . $space_pattern
        . "\d{" . $min_digits . "," . $max_digits . "}"
        . $end_pattern . $space_pattern . "$/";

    if ($comparator === "=") {
        return $equalityPatern;
    }
    if ($comparator === "<") {
        return $lesserPattern;
    } else if ($comparator === ">") {
        return $greaterPattern;
    } else if ($comparator === "<>") {
        return $rangePattern;
    } else {
        return "/" . trim($equalityPatern, "^\$/") . "|"
            . trim($lesserPattern, "^\$/") . "|"
            . trim($greaterPattern, "^\$/") . "|"
            . trim($rangePattern, "^\$/") . "/";
    }
}

/**
 * Gets regex pattern for time units
 */
// function time_unit_range_pattern(int|string $min_digits = 1, int|string $max_digits = "", string $start_pattern = "", string $end_pattern = "", bool $tolerate_space = true, string|null $comparator = null): string
// {
//     $time_unit_names = TimeUnit::get('name')->pluckToArray('name');
//     $end_pattern = "\b(" . implode("|", $time_unit_names) . ")(s)?" . $end_pattern;

//     return number_range_pattern(
//         min_digits: $min_digits,
//         max_digits: $max_digits,
//         start_pattern: $start_pattern,
//         end_pattern: $end_pattern,
//         tolerate_space: $tolerate_space,
//         comparator: $comparator
//     );
// }

/**
 * Gets regex pattern for money range using standard currency symbols
 */
function money_range_pattern(int|null $min_digits = 1, int|null $max_digits = 18, string $start_pattern = "", string $end_pattern = "", bool $tolerate_space = true, string|null $comparator = null): string
{
    $currency_acronyms = Currency::get('acronym')->pluckToArray('acronym');
    $end_pattern = "\b(" . implode("|", $currency_acronyms) . ")(s)?" . $end_pattern;

    return number_range_pattern(
        min_digits: $min_digits,
        max_digits: $max_digits,
        start_pattern: $start_pattern,
        end_pattern: $end_pattern,
        tolerate_space: $tolerate_space,
        comparator: $comparator
    );
}

/**
 * Gets values from a range string
 * 
 * @param string $str The string to be sepparated
 * @param string $range_pattern Regex pattern for the range in the string
 * @param string $validation_pattern Regex pattern that must be matched by the string before separating
 * 
 * @return false|array
 */
function separate_range_string(string $str, string $validation_pattern = "//"): false|array
{
    $str = trim($str);
    $comparator = preg_match("/\b(Less than)/", $str) ? "<"
        : (preg_match("/\b(Greater than|More than)/", $str) ? ">"
            : (preg_match("/\d{1,}\s?-{1}\s?\d{1,}/", $str) ? "<>" : "="));

    // After the last comparator, all is assumed to be "=",
    // we must check if the string actually passes as worthy
    if ($comparator === "=" and !preg_match("/^\s?\d{1,}\s/", $str)) {
        // Check if there is a leading text other than
        return false;
    }
    $range_pattern = $comparator === "=" ? "/\d{1,}\s?-{0,0}/"
        : ($comparator === "<" ? "/\b(Less than)\s\d{1,}/"
            : ($comparator === ">" ? "/\b(Greater\sthan|More\sthan)\s\d{1,}/"
                : "/\d{1,}\s?-{1}\s?\d{1,}/"));

    if (!preg_match($validation_pattern, $str)) {
        return false;
    }

    $range_matched = preg_match($range_pattern, $str, $matches); // match the string and refernce the matches to variable $matches


    if ($range_matched) {
        $range = $matches[0]; // $working range is the first item in the referenced array from $range_matched
    } else {
        return false;
    }
    $range_without_spaces = str_replace(" ", "", $range); // remove all spaces from range
    $range_values = explode("-", $range_without_spaces);

    $comparator === "=" ?  preg_match("/^\d{1,}\s?-{0,0}$/", $range, $digits) : preg_match("/\d{1,}/", $range, $digits);

    if (empty($digits)) return false;

    $digit = $digits[0];
    $unit = trim(substr($str, strpos($str, $digit) + strlen($digit)));
    // return [$range];
    if ($comparator === "=") {
        $start = $digit;
        $end = $digit;
    } else if ($comparator === "<") {
        $start = null;
        $end = $digit;
    } else if ($comparator === ">") {
        $start = $digit;
        $end = null;
    } else {
        $range_without_spaces = str_replace(" ", "", $range); // remove all spaces from range
        $range_values = explode("-", $range_without_spaces);
        $start = $range_values[0];
        $end = $range_values[1];
        $unit = trim(substr($str, strpos($str, $range) + strlen($range)));
    }
    $start = is_null($start) ? null : trim($start);
    $end = is_null($end) ? null : trim($end);
    return [
        "start" => is_numeric($start) ? (float)$start : $start,
        "end" => is_numeric($end) ? (float)$end : $end,
        "unit" => $unit
    ];
}

// REGEX HELPERS END

function stringBefore(string $string, string $character = "/", int $position = 1, bool $full = true): string|false
{
    $token = strtok($string, $character);
    $ret = $token;
    $i = 2;

    while ($i <= $position && $token != false) {
        if (!$full) {
            $token = strtok($character);
            $ret = $token;
        } else {
            $token = strtok($character);
            $ret = $ret . $character . $token;
        }
        $i++;
    }

    return $ret;
}

function randomString($length = 8)
{
    $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < $length; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass);
    //turn the array into a string
}

/**
 * Convert a file string to base64 url
 * 
 * @param string $string
 * @param string $mime The file type
 * 
 * @return string
 */
function toBase64Url(string $string, string $mime)
{
    return "data:" . $mime . ";base64," . base64_encode($string);
}

function generateSvgFromInitial(string $string): string
{
    $letter = mb_substr($string, 0, 1);
    return <<<EOD
            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100">
                <rect width="100%" height="100%" fill="#ddd" />
                <text x="50" y="80" font-size="85" font-family="sans-serif" text-anchor="middle" fill="black">{$letter}</text>
            </svg>
        EOD;
}

function generateSvgUrlFromInitial(string $string): string
{
    return toBase64Url(generateSvgFromInitial($string), 'image/svg+xml');
}

function keyValue(string $a)
{
    return [
        'title' => $a
    ];
}
