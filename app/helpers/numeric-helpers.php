<?php

// CONCERNING MONEY

use Illuminate\Validation\ValidationException;

/**
 * Returns an ordinal version of a number
 * 
 * @return string
 */
function ordinal(int $number): string
{
    $ends = ['th', 'st', 'nd', 'rd', 'th', 'th', 'th', 'th', 'th', 'th'];
    if(($number % 100) >= 11)
        return $number . 'th';
    else
        return $number . $ends[$number % 10];
}

/**
 * Calculate average of values in an array
 * 
 * @param array $array The array of values
 * @return int|float The average of the values as an integar of a floating point.
 */
function array_average(array $array): int|float
{
    return array_sum($array)/count($array);
}

/**
 * Returns a number as money
 * 
 * @param float $amount 
 * @param string $symbol
 * 
 * @return string 
 */
function amountToMoney(float $amount, string $symbol){
    $prefix = $symbol;
    if ($amount < 0)
    {
        $amount = abs($amount);
        $prefix = '-' . $prefix;
    }
    return $prefix . number_format($amount, 2, '.', ',');
}

/**
 * Tests a range of number for correctness
 */
function review_range_values(float|string|null $start, float|string|null $end, ?string $start_label="start", ?string $end_label="end", bool $validation=false, $validation_parameter="number_range")
{
    if((!is_numeric($start) && ! is_null($start)) || (!is_numeric($end))  && ! is_null($end))
    {
        $faulty_label = !is_numeric($start) ? $start_label : $end_label;
        $validation ? 
                throw ValidationException::withMessages(
                    [$validation_parameter => $faulty_label . " cannot be converted to number"]
                ) :
                throw new Exception($faulty_label . " cannot be converted to number");
    }
    if(! is_null($start) && ! is_null($end))
    {
        if($start > $end){
            $validation ? 
                throw ValidationException::withMessages(
                    [$validation_parameter => $start_label . " should not be greater than " . $end_label]
                ) :
                throw new Exception($start_label . " should not be greater than " . $end_label);
        }
    }else if(is_null($start) && is_null($end))
    {
        $validation ? 
            throw ValidationException::withMessages(
                [$validation_parameter => "Both " . $start_label . " and " . $end_label . " should not be empty"]
            ) :
            throw new Exception("Both " . $start_label . " and " . $end_label . " should not be empty");
    }

    return [
        "start" => is_null($start) ? null : (float)$start,
        "end" => is_null($end) ? null : (float)$end
    ];
}

function percentage_fraction(float $number, float $percentage)
{
    return ($number * $percentage)/100;
}

function percent(float $number, float $fraction)
{
    return ($fraction/$number) * 100;
}

function check_bool($var): bool
{
    $var = is_string($var) ? strtolower($var) : $var;
    return (in_array($var, array(true, false, 1, 0, "true", "false", "1", "0", "yes", "no"), true));
}

function binary($var): bool
{
    if(check_bool($var))
    {
        return (in_array($var, array(false, 0, "false", "0", "no"), true)) ? false : true;
    }
    return false;
}