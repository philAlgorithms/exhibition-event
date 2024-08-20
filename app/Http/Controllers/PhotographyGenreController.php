<?php

namespace App\Http\Controllers;

use App\Models\PhotographyGenre;
use App\Http\Requests\StorePhotographyGenreRequest;
use App\Http\Requests\UpdatePhotographyGenreRequest;
use App\Http\Resources\PhotographyGenreResource;
use Illuminate\Http\Resources\Json\JsonResource;

class PhotographyGenreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Resources\Json\JsonResource
     */
    public function index(): JsonResource
    {
        $photographyGenres = PhotographyGenre::query()
                ->when(request('id'),
                    fn($builder) => $builder->wherein('id', request('id'))
                )
                ->when(request('names'),
                    fn($builder) => $builder->wherein('name', request('names'))
                )
                ->paginate(getPaginator(request()));

        return PhotographyGenreResource::collection(
            $photographyGenres
        );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StorePhotographyGenreRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePhotographyGenreRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PhotographyGenre  $photographyGenre
     * @return \Illuminate\Http\Response
     */
    public function show(PhotographyGenre $photographyGenre)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\PhotographyGenre  $photographyGenre
     * @return \Illuminate\Http\Response
     */
    public function edit(PhotographyGenre $photographyGenre)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdatePhotographyGenreRequest  $request
     * @param  \App\Models\PhotographyGenre  $photographyGenre
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePhotographyGenreRequest $request, PhotographyGenre $photographyGenre)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PhotographyGenre  $photographyGenre
     * @return \Illuminate\Http\Response
     */
    public function destroy(PhotographyGenre $photographyGenre)
    {
        //
    }
}
