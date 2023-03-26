<!-- Sidebar Section Starts Here -->
@php
$route = request()->segment(count(request()->segments()));

@endphp


      <section class="sidebar-left">
         <div class="sidebar-custom">
            <div class="sidebar-logo">
               <a href=""> <img src="{{asset('images/logo-3.png')}}"> </a>
               <button class="menu-hamburger"> <img src="{{asset('images/hamburger.png')}}"> </button>
            </div>
            <div class="sidebar-menu">
               <div class="menu-item">
                  <a href="{{url('admin/dashboard')}}" class="{{($route == "dashboard" ? "active" : "")}}"> <img src="{{asset('images/img-1/dashboard_dashboard@2x.png')}}"> Dashboard </a>
               </div>
               <div class="menu-item">
                  <a href="{{url('admin/country')}}" class="{{($route == "country" ? "active" : "")}}" > <img src="{{asset('images/img-1/country-icon.png')}}"> Countries </a>
               </div>
               <div class="menu-item">
                  <a href="{{url('admin/state')}}" class="{{($route == "state" ? "active" : "")}}"> <img src="{{asset('images/img-1/states-1.png')}}"> States </a>
               </div>
               <div class="menu-item">
                  <a href="{{url('admin/city')}}" class="{{($route == "city" ? "active" : "")}}"> <img src="{{asset('images/img-1/cities.png')}}"> Cities </a>
               </div>
               <div class="menu-item">
                  <a href="{{url('admin/sector')}}" class="{{($route == "sector" ? "active" : "")}}"> <img src="{{asset('images/img-1/sector-icon.png')}}"> Sectors </a>
               </div>
               <div class="menu-item">
                  <a href="{{url('admin/initiator')}}" class="{{($route == "initiator" ? "active" : "")}}"> <img src="{{asset('images/img-1/init-4.png')}}"> Initiators </a>
               </div>
                <div class="menu-item">
                  <a href="{{url('admin/contributor')}}" class="{{($route == "contributor" ? "active" : "")}}"> <img src="{{asset('images/img-1/contributors.png')}}"> Contributors </a>
               </div>
                   <div class="menu-item">
                  <a href="{{url('admin/case')}}" class="{{($route == "case" ? "active" : "")}}" > <img src="{{asset('images/img-1/cases.png')}}"> All Cases </a>
               </div>
                   <div class="menu-item">
                  <a href="{{url('admin/get-transaction')}}" class="{{($route == "get-transaction" ? "active" : "")}}" > <img src="{{asset('images/img-1/trans-w.png')}}"> All Transactions </a>
               </div>
                 <div class="menu-item">
                  <a href="{{url('admin/bulk-emails')}}" class="{{($route == "bulk-emails" ? "active" : "")}}" > <img src="{{asset('images/img-1/trans-w.png')}}"> Bulk Emails </a>
               </div>
               <div class="menu-item">
                  <a href="{{url('admin/bulk-sms-list')}}" class="{{($route == "bulk-sms-list" ? "active" : "")}}" > <img src="{{asset('images/img-1/trans-w.png')}}"> Bulk Sms </a>
               </div>
               <div class="menu-item">
                  <a href="{{url('admin/bulk-push-notifications')}}" class="{{($route == "bulk-push-notifications" ? "active" : "")}}" > <img src="{{asset('images/img-1/trans-w.png')}}"> Bulk Push Notifications </a>
               </div>
               <!--   <div class="menu-item">
                  <a href="{{url('admin/bank-details')}}" > <img src="{{asset('images/img-1/bank-dets.png')}}"> Bulk Sms </a>
               </div>
                <div class="menu-item">
                  <a href="{{url('admin/bank-details')}}" > <img src="{{asset('images/img-1/bank-dets.png')}}"> Bulk Push Notifications </a>
               </div>
                <div class="menu-item">
                  <a href="{{url('admin/bank-details')}}" > <img src="{{asset('images/img-1/bank-dets.png')}}"> Bulk Emails </a>
               </div> -->
               <div class="menu-item">
                  <a href="{{url('admin/bank-details')}}" class="{{($route == "bank-details" ? "active" : "")}}"> <img src="{{asset('images/img-1/bank-dets.png')}}"> Bank Details </a>
               </div>
              
            
               <div class="menu-item">
                 <a data-toggle="collapse" data-target="#demo" >
                 <img src="{{asset('images/img-1/content_dashboard@2x.png')}}"> 
                 <span> Content Pages </span>   <i class="fa fa-caret-right" aria-hidden="true"></i>
               </a>
                 <div id="demo" class="collapse  lower-menu {{(Request::is('admin/cms/*') !== false ? "collapse in" : "")}}">
                     <a href="{{url('admin/cms/1/edit')}}" class="{{(Request::is('admin/cms/1/edit') !== false ? "active" : "")}}">
                       <img src="{{asset('images/img-1/terms.png')}}"> 
                        Terms And Conditions </a>
                      <a href="{{url('admin/cms/2/edit')}}" class="{{(Request::is('admin/cms/2/edit') !== false ? "active" : "")}}">
                       <img src="{{asset('images/img-1/privacyyy.png')}}"> 
                        Privacy Policy </a>
                      <a href="{{url('admin/cms/3/edit')}}" class="{{(Request::is('admin/cms/3/edit') !== false ? "active" : "")}}">
                       <img src="{{asset('images/img-1/faq6.png')}}"> 
                        Faqs </a>
                      <a href="{{url('admin/cms/4/edit')}}" class="{{(Request::is('admin/cms/4/edit') !== false ? "active" : "")}}">
                       <img src="{{asset('images/img-1/about-uuu.png')}}"> 
                        About Us </a>

                 </div>
              </div>
             

               <!-- <div class="menu-item">
                  <a href="{{url('admin/customer')}}"><img src="{{asset('images/img-1/customer_dashboard@2x.png')}}"> Customers  </a>
               </div> -->
               <!-- <div class="menu-item">
                  <a href="{{url('admin/provider')}}"> <img src="{{asset('images/img-1/serviceprovider_dashboard@2x.png')}}"> Service Provider </a>
               </div> -->
               <!-- <div class="menu-item">
                  <a href="{{url('admin/shipments')}}"><img src="{{asset('images/img-1/bookings_dashboard@2x.png')}}"> Shipment  </a>
               </div> -->
              <!--  <div class="menu-item">
                  <a href=""><img src="images/img-1/transactions_dashboard@2x.png"> Transactions</a>
               </div>
               <div class="menu-item">
                  <a href=""> <img src="images/img-1/payout_dashboard@2x.png"> Payout Request </a>
               </div>
               <div class="menu-item">
                  <a href=""><img src="images/img-1/settings_dashboard@2x.png"> Setting </a>
               </div>
               <div class="menu-item">
                  <a href=""> <img src="images/img-1/staff dashboard@2x.png"> Staff </a>
               </div>
               <div class="menu-item">
                  <a href=""> <img src="images/img-1/help_support_dashboard@2x.png"> Help & Support  </a>
               </div>
               <div class="menu-item">
                  <a href=""> <img src="images/img-1/content_dashboard@2x.png"> Content Management </a>
               </div> -->
               <div class="menu-item">
                  <!-- <x-slot name="content">
                       
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf

                            <x-dropdown-link :href="route('logout')"
                                    onclick="event.preventDefault();
                                                this.closest('form').submit();">
                                {{ __('Log out') }}
                            </x-dropdown-link>
                        </form>
                    </x-slot> -->
                    <form method="POST" action="{{ route('logoutAdmin') }}">
                  @csrf
                  <a href="route('logout')"
                                    onclick="event.preventDefault();
                                                this.closest('form').submit();">
                               <img src="{{asset('images/img-1/logout_dashboard@2x.png')}}"> Logout </a>
                  </form>             
               </div>
            </div>
         </div>
      </section>
@section('script')

        <script>
        // var container = $('.sidebar-left .a');

        // $(this).closest('.a');
        // var scrollTo = $(document).find('.active');
        // console.log(container,scrollTo);
      
        // var position = scrollTo.offset().top 
        //         - container.offset().top 
        //         + container.scrollTop();
        // console.log(position);
       
        // container.scrollTop(position);
      //   $(".menu-item a").on('click', function(event){
      
      //      var html = $(this).closest('.menu-item').html();

      //       localStorage.setItem('nameOfItem', html); 
      //       $(document).find(html).remove();
      //      console.log(localStorage.getItem('nameOfItem'));
      //   })
      // $(window).on('load', function(){
         

      //       var string = '<div class="menu-item">' +localStorage.getItem('nameOfItem')+'</div>';
      //       $(document).find('.sidebar-menu').prepend(string);
      //        console.log(string);
      //   });

    </script>
@stop
