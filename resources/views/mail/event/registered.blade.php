<x-mail::message>
<div class="content-label text-black">Your ticket to:</div>
<div class="content-value-lg content-value-title text-gray-1012 mt-6">{{ $event_name }}</div><br>

<div class="content-label text-black">Date and Time:</div>
<div class="content-value text-gray-1012 mt-6">{{ $datetime }}</div><br>

<div class="content-label text-black">Venue:</div>
<div class="content-value text-gray-1012 mt-6">{{ $venue }}</div><br>

<div class="content-label text-black">Attendee:</div>
<div class="content-value text-gray-1012 mt-6">{{ $attendee->user->name }}</div><br>

<x-mail::section class="bg-blue">
<table style="width: 100%; border-collapse: collapse;">
<tr style="width:100%;">
<td style="width:50%; text-align: left;">
<div class="content-label text-white">Ticket id:</div>
<div class="content-value text-white mt-6">{{ $attendee->ticket_id }}</div><br>
</td>
<td style="width:50%; text-align: right;">
<div class="content-label text-white">Ticket type:</div>
<div class="content-value text-white mt-6">{{ 'Free' }}</div><br>
</td>
</tr>

</table>
</x-mail::section>
<x-mail::section class="section-bottom bg-white">
    <div class="text-center">
        <img src="{!!$message->embedData($qrcode,'QrCode.png','image/png')!!}"/>
    </div>
</x-mail::section>
{{-- <x-mail::section class="section-bottom bg-gray-1012">
    <div class="text-center">
        {!! $barcode !!}
    </div>
</x-mail::section> --}}
</x-mail::message>
