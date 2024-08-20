<?php

namespace App\Policies;

use App\Models\Exhibitor;
use App\Models\ExhibitorWork;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class ExhibitorWorkPolicy
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
    public function view(User $user, ExhibitorWork $exhibitorWork): bool
    {
        return $user->hasRole('admin') || $user->id === $exhibitorWork->exhibitor->user->id;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool | Response
    {
        if(!is_null($user->exhibitor) && $user->hasRole('exhibitor') && $user->exhibitor instanceof Exhibitor)
        {
            return $user->exhibitor->works()->count() < 5 ? true : Response::deny('You can only upload a maximum of 5 works.');
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, ExhibitorWork $exhibitorWork): bool
    {
        //
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, ExhibitorWork $exhibitorWork): bool
    {
        //
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, ExhibitorWork $exhibitorWork): bool
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, ExhibitorWork $exhibitorWork): bool
    {
        //
    }
}
