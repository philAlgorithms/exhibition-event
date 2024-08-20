<?php

namespace App\Http\Controllers;

use App\Models\ExhibitorWork;
use App\Http\Requests\StoreExhibitorWorkRequest;
use App\Http\Requests\UpdateExhibitorWorkRequest;
use App\Http\Requests\Validators\ExhibitorWorkValidator;
use App\Http\Resources\ExhibitorWorkResource;
use App\Models\Disk;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\{Arr, Str};

class ExhibitorWorkController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $exhibitor_id = request('exhibitor_id');
        $user = auth()->user();
        $exhibitors = ExhibitorWork::query()
            ->when(
                $user->hasRole('exhibitor') && !$user->hasRole('admin') && !is_null($user->exhibitor),
                fn ($builder) => $builder->where('exhibitor_id', $user->exhibitor->id)
            )
            ->when(
                request('id'),
                fn ($builder) => $builder->wherein('id', request('id'))
            )
            ->when(
                $exhibitor_id && (is_array($exhibitor_id) || is_numeric($exhibitor_id)),
                fn ($builder) => $builder->whereIn('exhibitor_id', is_array($exhibitor_id) ? $exhibitor_id : [$exhibitor_id])
            )
            ->paginate(getPaginator(request()));

        return ExhibitorWorkResource::collection(
            $exhibitors
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        Gate::authorize('create', ExhibitorWork::class);

        $validated = (new ExhibitorWorkValidator)->validate(
            $work = new ExhibitorWork(),
            request()->all()
        );
        $disk = Disk::firstWhere('name', 'do') ?? Disk::firstWhere('name', 'public');
        $user = auth()->user();
        $exhibitor = $user->exhibitor;
        $user_path = str_replace(' ', '-', $user->name);
        
        $work = DB::transaction(function () use ($work, $validated, $disk, $exhibitor, $user_path) {
            $work_uuid = (string)Str::orderedUuid();
            $file = request()->file("photograph");
            $work->fill([
                ...Arr::except($validated, ['photograph']),
                'photograph' => $file->storeAs(
                    'exhibitor-works',
                    "work-{$user_path}-{$work_uuid}.{$file->extension()}",
                    $disk->name
                ),
                'disk_id' => $disk->id,
                'exhibitor_id' => $exhibitor->id
            ]);
            $work->save();
            return $work;
        });

        return ExhibitorWorkResource::make(
            $work
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreExhibitorWorkRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(ExhibitorWork $exhibitorWork)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ExhibitorWork $exhibitorWork)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateExhibitorWorkRequest $request, ExhibitorWork $exhibitorWork)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExhibitorWork $exhibitorWork)
    {
        //
    }
}
