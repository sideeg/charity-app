<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <meta name="csrf-token" content="{{ csrf_token() }}">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>{{ config('app.name', 'Laravel') }}</title>
      <!-- Animate With CSS -->
      <link rel="stylesheet" type="text/css" href="{{asset('css/animate.css')}}">
      <!-- Bootstrap Grids -->
      <link href="{{asset('css/bootstrap.min.css')}}" rel="stylesheet">

       <link  rel="stylesheet" defer href="//cdn.datatables.net/1.10.25/css/dataTables.bootstrap.min.css">
    
      <!-- Custom Stylings -->
      <link href="{{asset('css/custom.css')}}" rel="stylesheet">
      <!-- Font Awesome Icons -->
      <link href="web-fonts-with-css/css/fontawesome-all.min.css" rel="stylesheet">
      <!-- Jquery Library -->
      <!-- <script type="text/javascript" src="{{asset('js/jquery-3.2.1.min.js')}}"></script> -->
       <link  rel="stylesheet" defer href="//stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

       <link rel="stylesheet" href="{{asset('css/intlTelInput.css')}}">
   </head>