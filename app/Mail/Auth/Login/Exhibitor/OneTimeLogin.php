<?php

namespace App\Mail\Auth\Login\Exhibitor;

use App\Models\Exhibitor;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class OneTimeLogin extends Mailable
{
    use Queueable, SerializesModels;

    public $exhibitor;
    public $url;
    /**
     * Create a new message instance.
     */
    public function __construct(Exhibitor $exhibitor, string $url)
    {
        $this->exhibitor = $exhibitor;
        $this->url = $url;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'One Time Login',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            markdown: 'mail.auth/login.exhibitor.one-time-login',
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
