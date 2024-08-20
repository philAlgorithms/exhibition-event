<?php

namespace App\Http\Controllers;

use App\Models\EventAttendee;
use App\Http\Requests\StoreEventAttendeeRequest;
use App\Http\Requests\UpdateEventAttendeeRequest;
use App\Http\Resources\EventAttendeeResource;
use Illuminate\Support\Facades\Gate;

class EventAttendeeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $eventAttendees = EventAttendee::query()
                ->when(request('id'),
                    fn($builder) => $builder->wherein('id', request('id'))
                )
                // ->when(request('names'),
                //     fn($builder) => $builder->wherein('name', request('names'))
                // )
                ->paginate(getPaginator(request()));

        return EventAttendeeResource::collection(
            $eventAttendees
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreEventAttendeeRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(EventAttendee $eventAttendee)
    {
        return EventAttendeeResource::make(
            $eventAttendee
        );
    }

    /**
     * Display the specified resource.
     */
    public function showByEmail(string $email)
    {
        $eventAttendee = EventAttendee::whereHas('user', fn($b) => $b->where('email', $email))->first();

        Gate::authorize('viewByEmail', [EventAttendee::class, $eventAttendee]);
        return EventAttendeeResource::make(
            $eventAttendee
        );
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(EventAttendee $eventAttendee)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateEventAttendeeRequest $request, EventAttendee $eventAttendee)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(EventAttendee $eventAttendee)
    {
        //
    }

    public function checkIn(EventAttendee $eventAttendee)
    {
        Gate::authorize('checkIn', [$eventAttendee]);

        $eventAttendee->checkIn();

        return EventAttendeeResource::make(
            $eventAttendee
        );
    }
}
