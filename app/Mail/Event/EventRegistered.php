<?php

namespace App\Mail\Event;

use App\Models\EventAttendee;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use Picqer\Barcode\BarcodeGeneratorHTML;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class EventRegistered extends Mailable
{
    use Queueable, SerializesModels;

    public $attendee;
    public $qrcode;
    public $event_name;
    public $datetime;
    public $venue;
    public $barcode;
    /**
     * Create a new message instance.
     */
    public function __construct(EventAttendee $attendee, string $event_name, string $datetime, string $venue)
    {
        $this->attendee = $attendee;
        $this->event_name = $event_name;
        $this->venue = $venue;
        $this->datetime = $datetime;
        $this->qrcode = QrCode::format('png')->size(200)->generate("Name: {$this->attendee->user->name}\nEmail: {$this->attendee->user->email}\nGender: {$this->attendee->gender}")->toHtml();
        
        // $generator = new BarcodeGeneratorHTML();
        // $this->barcode = $generator->getBarcode("Name: {$this->attendee->user->name}\nEmail: {$this->attendee->user->email}\nGender: {$this->attendee->gender}", $generator::TYPE_EAN_8);
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Your registration was successful.',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            markdown: 'mail.event.registered',
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
