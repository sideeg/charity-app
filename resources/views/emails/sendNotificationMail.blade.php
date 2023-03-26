@component('mail::message')
## Notification  Email

@component('mail::panel')
#### Title 
    {{ $data['title'] }}

#### Title Arabic
    {{ $data['title_ar'] }}    
@endcomponent

@component('mail::panel')
#### Description 
    {{ $data['description'] }}

#### Description Arabic
    {{ $data['description_ar'] }}  

@if(!empty($data['image']))

!['attachment_image']({{$data['image']}})  
@endif 

@if(!empty($data['matter_id']))
#### Case Link

 {{ $data['matter_id'] }}  
@endif 

@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
