<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      
      <title>{{ env('APP_NAME', 'Laravel') }}</title>
      <link rel="dns-prefetch" href="//fonts.gstatic.com">
      <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="{{asset('css/login.css')}}">
   </head>
   <body>
      <section class="sign_section"  style="background:url({{asset('images/img-1/login_bg.png')}}); background-repeat: no-repeat !important;background-size: cover !important;">


         <div class="sign_section-1">
         <div class="container">
            <div class="">
               <div class="sign-login">
                  <div class="card py-2 px-2">
                     <div class="card-header">
                        <div class="logo-c"><img src="{{asset('images/img-1/logo.png')}}"></div>
              <!--           <span class="logo-h">Logo Design</span> -->
                     </div>

                     <div class="card-body">

                        <h4 class="hello-text">Login</h4>
                       <!--   <h5 class="hello-text">Here Sign In to Continue</h5> -->
                          <!-- Session Status -->
        <x-auth-session-status class="mb-4" :status="session('status')" />

        <!-- Validation Errors -->
        <x-auth-validation-errors class="mb-4" :errors="$errors" />
                           <form method="POST" action="{{ route('adminSubmitLogin') }}">
                                @csrf 
                           <div class="form-group row ">
                              <div class="col-12 email-1">
                                 <label for="email" class="col-form-label">E-Mail </label>

                                 <span class="mail-login"><img src="https://vipankumar.in/delivery-app/public/images/mail_login@2x.png"></span>
                                  <!-- <input id="password" type="password" class="form-control" name="password" placeholder="password"> -->
                                 <input id="email"  class="form-control" type="email" name="email" :value="old('email')" required autofocus placeholder="Email">
                              </div>
                           </div>
                           <div class="form-group row ">
                              <div class="col-12 pass-1">
                                 <label for="password" class="col-form-label">Password</label>
                                 <span class="mail-login pwd-s"><img src="https://vipankumar.in/delivery-app/public/images/password_login@2x.png"></span>
                                 <!-- <input id="password" type="password" class="form-control" name="password" placeholder="password"> -->
                                 <input  id="password" class="form-control" type="password"
                                name="password"
                                required autocomplete="current-password" placeholder="password">
                              <!--    <span class="eye-icon"><i class="fa fa-eye"></i></span> -->
                                   <div class="eye eye_icon_password">
                                      <span class="eye-icon"><i class="fa fa-eye" id="span_pass"></i></span>
                                </div>
                              </div>
                           </div>

                           <div class="form-group row  forgot-c">
                              <div class="col-md-6">
                                 <!-- <span>Forgot Password</span> -->
                              <!--    <input id="remember_me" type="checkbox" class="rounded border-gray-300 text-indigo-600 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" name="remember"> -->
                          <!--       <span class="ml-2 text-sm text-gray-600 rem">Remember me</span> -->
                              </div>
                     <!--           <div class="col-md-6"><a href="#" class="ml-2 text-sm text-gray-600 forgot-ce">Forgot Password?</a></div> -->
                           </div>
                         
                           <div class="form-group row mb-0">
                              <div class="col-12 text-center">
                                 <button type="submit" class="btn btn-primary">
                                 Log In
                                 </button>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
          </div>
      </section>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script>
     @if(Session::has('success'))
      toastr.success("{{ Session::get('success') }}");
      {{Session::forget('success')}}
    @endif
    @if(Session::has('info'))
      toastr.info("{{ Session::get('info') }}");
      {{Session::forget('info')}}
    @endif
    @if(Session::has('warning'))
      toastr.warning("{{ Session::get('warning') }}");
      {{Session::forget('warning')}}
    @endif
    @if(Session::has('error'))  
      toastr.error("{{ Session::get('error') }}");
      {{Session::forget('error')}}
    @endif

    $(document).ready(function() {

        $(".eye_icon_password").click(function(){
          var input = $(this).parent().find('input');
          var attr =    $(document).find(input).attr("type");
              var src = $(this).children('img').attr("src");
              // console.log(src);
          if(attr == "password")
          {
            // $(this).children('img').attr({src: "http://178.128.116.149/wn/public/images/blind.svg",
            //   width: "15px"
            // });;
             $('#span_pass').removeClass('fa fa-eye');
            $('#span_pass').addClass('fa fa-eye-slash');
            $(document).find(input).attr("type","text");
          }
          else
          {
            // $(this).children('img').attr("src","http://178.128.116.149/wn/public/images/eye.png");
            $('#span_pass').removeClass('fa fa-eye-slash');
            $('#span_pass').addClass('fa fa-eye');
            
              $(document).find(input).attr("type","password");
          }
        });
});
    </script>  
   </body>
</html>