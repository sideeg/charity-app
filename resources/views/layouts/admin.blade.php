@include('includes.headeradmin')
    <!-- Sidebar -->
@include('includes.sidebar')
 <section class="all-dashboard">
  @include('includes.topbar')

    <!-- /.sidebar -->
@yield('content')
 </section>
@include('includes.footer')
@yield('script')