<?php

/**
 * 
 */
function nextDate(string $additional_time, string|null $datetime = null)
{
    $datetime = is_null($datetime) ? $additional_time : $datetime . " " . $additional_time;
    return date("Y-m-d H:i:s", strtotime($datetime));
}

function time_elapsed_string($datetime, $full = false)
{
    $now = now(); //new \Datetime(gmdate("Y-m-d\TH:i:s\Z"));
    $ago = new \Datetime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) : '0 seconds';
}


// DATE HELPERS START
function showDate($datetime)
{
    $dt = new \DateTime($datetime);
    return $dt->format('d-m-Y');;
}

function showTime($datetime)
{
    $dt = new \DateTime($datetime);
    return $dt->format('h:i A');
}

function timeHasPassed(string|DateTime $datetime, string|DateTime|null $referenceDate = null): bool
{
    $datetime = $datetime instanceof DateTime ? $datetime : new DateTime($datetime);
    $referenceDate = $referenceDate instanceof DateTime ? $referenceDate : new DateTime($referenceDate);

    return $referenceDate > $datetime;
}

function durationHasPassed(string|DateTime $datetime, string $duration, string $referenceDate = null): bool
{
    return timeHasPassed($datetime, new DateTime($referenceDate . $duration));
}

function getNextDateSeconds($duration, $current = 'now')
{
    $seconds_till_now = strtotime('now');
    $seconds_till_current = strtotime($current);
    $seconds_till_duration = strtotime($duration);

    $seconds_between_duration = $seconds_till_duration - $seconds_till_now;
    return $seconds_till_current + $seconds_between_duration;
}

function getNextDate($duration, $current = 'now', $format = 'Y-m-d H:i:s')
{
    $seconds = getNextDateSeconds($duration, $current);
    $miliseconds = $seconds * 1000;
    return date($format, $seconds);
}

/**
 * Get an array of dates within a duration. Start and end date are not inclusive.
 */
function getDatesWithinDuration(string $duration, string $period, string|DateTime $datetime = 'now', bool $include_start_date = false,  $format = 'Y-m-d H:i:s')
{
    $datetime = date($format, strtotime($datetime));
    $last_date = getNextDate($duration, $datetime);
    $dates = [];

    if (timeHasPassed($last_date, $datetime)) {
        return $dates;
    } else {
        array_push($dates, $datetime);
    }

    $ref = $datetime;
    $next = getNextDate($period, $ref);

    while (
        !timeHasPassed($next, $ref) &&
        !timeHasPassed($last_date, $ref)
    ) {
        array_push($dates, $next);

        $ref = $next;
        $next = getNextDate($period, $ref);
    }

    if(!$include_start_date)
    {
        $dates = array_splice($dates, 1, -1);
    }
    else if (count($dates) > 1) {
        array_pop($dates);
    }

    return $dates;
}

function elapsed_date_diff(DateTime|string $start, DateTime|string $end)
{
    $start = $start instanceof DateTime ? $start : new DateTime($start);
    $end = $end instanceof DateTime ? $end : new DateTime($end);

    $diff = date_diff($start, $end);

    $mappings = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );

    $time_elapsed = "+";

    foreach ($mappings as $format => $unit) {
        $value = (int)($diff->format("%{$format}"));

        $time_elapsed .= $value > 0 ? $value . " " . singular($unit, $value) . ", " : "";
    }

    return rtrim($time_elapsed, ", ");
}

function getDatesBetweenInterval(string $start, string $end, string $period, bool $include_start_date = false, string $format = 'Y-m-d H:i:s')
{
    $duration = elapsed_date_diff($start, $end);

    return getDatesWithinDuration($duration, $period, $start, $include_start_date, $format);
}
