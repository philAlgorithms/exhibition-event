<?php

namespace App\Http\Controllers;

use App\Models\SanityDocument;
use App\Http\Requests\StoreSanityDocumentRequest;
use App\Http\Requests\UpdateSanityDocumentRequest;
use App\Http\Resources\SanityDocumentResource;

class SanityDocumentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $documents = SanityDocument::query()
            ->when(
                request('id'),
                fn ($builder) => $builder->wherein('id', request('id'))
            )
            ->when(
                request('names'),
                fn ($builder) => $builder->wherein('name', request('names'))
            )
            ->paginate(getPaginator(request()));

        return SanityDocumentResource::collection(
            $documents
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
    public function store(StoreSanityDocumentRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(SanityDocument $sanityDocument)
    {
        return SanityDocumentResource::make(
            $sanityDocument
        );
    }

    /**
     * Display the resource specified by sanity params.
     */
    public function showBySanityParams(string $sanityId, string $sanityType)
    {
        $sanityDocument = SanityDocument::where('sanity_id', $sanityId)
            ->where('sanity_type', $sanityType)->first();

        if (is_null($sanityDocument))
            abort(404);
        else
            return SanityDocumentResource::make(
                $sanityDocument
            );
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(SanityDocument $sanityDocument)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateSanityDocumentRequest $request, SanityDocument $sanityDocument)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(SanityDocument $sanityDocument)
    {
        //
    }
}
