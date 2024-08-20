<?php

namespace App\Policies;

use App\Models\EventAttendee;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class EventAttendeePolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, EventAttendee $eventAttendee): bool
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     */
    public function viewByEmail(User $user, EventAttendee|null $eventAttendee): bool|Response
    {
        if(is_null($eventAttendee))
        {
            return Response::denyAsNotFound();
        }
        else {
            return true;
        }
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        //
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, EventAttendee $eventAttendee): bool
    {
        //
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, EventAttendee $eventAttendee): bool
    {
        //
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, EventAttendee $eventAttendee): bool
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, EventAttendee $eventAttendee): bool
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     */
    public function checkIn(User $user, EventAttendee $eventAttendee): bool|Response
    {
        if($eventAttendee->checked_in)
        {
            return Response::deny('User already checked in');
        }
        else {
            return true;
        }
    }
}
