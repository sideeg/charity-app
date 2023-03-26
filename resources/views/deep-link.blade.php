
@php
//Detect special conditions devices
$iPod    = stripos($_SERVER['HTTP_USER_AGENT'],"iPod");
$iPhone  = stripos($_SERVER['HTTP_USER_AGENT'],"iPhone");
$iPad    = stripos($_SERVER['HTTP_USER_AGENT'],"iPad");
$Android = stripos($_SERVER['HTTP_USER_AGENT'],"Android");
$webOS   = stripos($_SERVER['HTTP_USER_AGENT'],"webOS");
@endphp

@if( $Android)
	<script type="text/javascript">
     window.location = 'https://www.taawon-charity.com/taw?matter_id='+{{$id}};//here double curly bracket
    </script>
@elseif($iPod || $iPhone || $iPad)
	<script type="text/javascript">
     window.location = 'com.taawon://id?'+{{$id}};//here double curly bracket
    </script>
@else
		{{"Nothing Found Please open in mobile"}}
@endif
