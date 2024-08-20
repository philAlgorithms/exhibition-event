<?php

namespace App\Handler\Google;

use App\Models\{Disk, File};
use Exception;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\{ClientException, ConnectException};
use Illuminate\Http\Client\Response;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;

class GoogleDrive
{
    protected $clientId;
    protected $clientSecret;
    protected $refreshToken;
    protected $folderId;

    /**
     * The preferred bank for creating DVA account 
     * @var string
     */
    protected $preferredBankSlug;

    public function __construct()
    {
        $this->setCredentials();
    }

    public function setCredentials()
    {

        $this->clientId = config('services.google.client_id');
        $this->clientSecret = config('services.google.client_secret');
        $this->refreshToken = config('services.google.refresh_token');
        $this->folderId = config('services.google.folder_id');
    }

    protected function getToken()
    {
        $response = Http::post('https://oauth2.googleapis.com/token', [
            'client_id' => $this->clientId,
            'client_secret' => $this->clientSecret,
            'refresh_token' => $this->refreshToken,
            'grant_type' => 'refresh_token'
        ]);

        return json_decode((string)$response->getBody(), true);
    }

    public function upload(UploadedFile $file): Response
    {
        $accessToken = $this->getToken();
        $name = Str::slug($file->getClientOriginalName());
        $mime = $file->getClientMimeType();

        $response = Http::withToken($accessToken['access_token'])
            ->attach('data', file_get_contents($file->getRealPath()), $name)
            ->post(
                'https://www.googleapis.com/upload/drive/v3/files',
                [
                    'name' => $name,
                    // 'mimeType' => $mime,
                    // 'uploadType' => 'resumable', // options: 'media', 'resumable', 'multipart'
                    // 'parents' => [$this->folderId]
                ],
                [
                    'Content-Type' => 'application/octet-stream',
                ]
            );

        return $response;
    }

    public function uploadAndSave(UploadedFile $file): File|false
    {
        $upload = $this->upload($file);
        $file = new File();
        if ($upload->successful()) {
            $data = json_decode((string)$upload->getBody(), true);

            $file->fill([
                'disk_id' => Disk::firstWhere('name', 'google')->id,
                'google_drive_kind' => $data['kind'],
                'name' => $data['name'],
                'google_drive_id' => $data['id'],
                'mime_type' => $data['mimeType'],
            ]);
            $file->save();

            return $file;
        }

        return false;
    }

    public function download(string $id)
    {
        $accessToken = $this->getToken();

        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $accessToken['access_token'],
            'Content-Type' => 'Application/json'
        ])->get("https://www.googleapis.com/drive/v3/files/{$id}?alt=media");

        $folder = config('services.google.temporaray_folder');
        Storage::drive('public')->put("{$folder}/{$id}", $response->body());

        return response()->file(Storage::drive('public')->path("{$folder}/$id"))
            ->deleteFileAfterSend(true);
    }

    public function makePublic(string $fileId)
    {
        $accessToken = $this->getToken();
        $response = Http::withToken($accessToken['access_token'])
            ->post("https://www.googleapis.com/drive/v3/files/{$fileId}", [
                'role' => 'reader',
                'type' => 'anyone',
            ]);

        return $response;
    }
}
