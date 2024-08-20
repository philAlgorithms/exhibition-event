<?php

namespace App\Http\Controllers;

use App\Models\Exhibitor;
use App\Http\Requests\StoreExhibitorRequest;
use App\Http\Requests\UpdateExhibitorRequest;
use App\Http\Requests\Validators\ExhibitorValidator;
use App\Http\Resources\ExhibitorResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;

class ExhibitorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $exhibitors = Exhibitor::query()
            ->when(
                request('id'),
                fn ($builder) => $builder->wherein('id', request('id'))
            )
            // ->when(request('names'),
            //     fn($builder) => $builder->wherein('name', request('names'))
            // )
            ->paginate(getPaginator(request()));

        return ExhibitorResource::collection(
            $exhibitors
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
    public function store(StoreExhibitorRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Exhibitor $exhibitor)
    {
        Gate::authorize('view', $exhibitor);
        return ExhibitorResource::make(
            $exhibitor
        );
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Exhibitor $exhibitor)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Exhibitor $exhibitor): JsonResource
    {
        Gate::authorize('update', $exhibitor);

        $validated = (new ExhibitorValidator)->validateUpdate($exhibitor, request()->all());

        if (array_key_exists('works_used_by_external', $validated))
            $validated['works_used_by_external'] = binary($validated['works_used_by_external']);
        if (array_key_exists('use_for_promotions', $validated))
            $validated['use_for_promotions'] = binary($validated['use_for_promotions']);

        $exhibitor->fill(
            Arr::except($validated, ['external_exhibitions'])
        );

        $exhibitor = DB::transaction(function () use (
            $exhibitor,
            $validated
        ) {
            $exhibitor->save();

            if (array_key_exists('works_used_by_external', $validated) && array_key_exists('external_exhibitions', $validated) && $validated['works_used_by_external']) {
                $externalExhibitions = $exhibitor->externalExhibitions();
                $externalExhibitions->delete();
                foreach ($validated['external_exhibitions'] as $value) {
                    // if ($externalExhibitions->where('title', $value)->count() === 0) {
                        $externalExhibitions->create([
                            'title' => $value
                        ]);
                    // }
                }
            }

            return $exhibitor;
        });

        return ExhibitorResource::make(
            $exhibitor
        );
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Exhibitor $exhibitor)
    {
        //
    }
}
