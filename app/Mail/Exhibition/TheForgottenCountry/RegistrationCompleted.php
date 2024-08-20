<?php

namespace App\Mail\Exhibition\TheForgottenCountry;

use App\Models\Exhibitor;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class RegistrationCompleted extends Mailable
{
    use Queueable, SerializesModels;

    public $exhibitor;
    public $event_name;
    public $datetime;
    public $venue;
    /**
     * Create a new message instance.
     */
    public function __construct(Exhibitor $exhibitor, string $event_name, string $datetime, string $venue)
    {
        $this->exhibitor = $exhibitor;
        $this->event_name = $event_name;
        $this->venue = $venue;
        $this->datetime = $datetime;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Your application was successful.',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            markdown: 'mail.exhibition.the-forgotten-country.registration-completed',
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
