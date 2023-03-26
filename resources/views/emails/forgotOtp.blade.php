@component('mail::message')
# Otp Mail

@component('mail::panel')
    {{ $offer['otp'] }}
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
