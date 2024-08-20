<x-mail::message>
Congratulations {{ $exhibitor->user->first_name }}! <br>
<p class="text-gray-1012">Your application has been successfully submitted. We can't wait to see you exhibit at {{ $event_name }}!</p>
<p class="text-gray-1012">Use <a href="{{ $exhibitor->generateOneTimeLoginUrl() }}">this link</a> to edit your application and/or add new works.</p>
Best,<br>
The Natesa Team
</x-mail::message>
