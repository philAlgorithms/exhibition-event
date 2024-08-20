<?php

namespace App\Http\Controllers;

use App\Models\Disk;
use App\Http\Requests\StoreDiskRequest;
use App\Http\Requests\UpdateDiskRequest;

class DiskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
    public function store(StoreDiskRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Disk $disk)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Disk $disk)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateDiskRequest $request, Disk $disk)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Disk $disk)
    {
        //
    }
}
