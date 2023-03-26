@extends('layouts.admin')
@section('content')

  

 <div class="dashboard-wrapper">
            <div class="row m-b-20">
               <div class="col-md-2 col-lg-2 col-sm-12 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black"> Contributors </h3>
                  </div>
               </div>
               <div class="col-md-10 col-lg-10 col-sm-12 col-xs-12 ">
                  <div class="right-side-c country-d  states-d city-list-sec">
                     <div class="date-sec  custom-c34">
                        <span>
                        <div class="address-h">
                        <span>
                           <label>Country</label> 
                              <select class="form-control" id="country" name="country">
                                 <option  value="">Please select</option>
                                 @foreach($country as $key => $value)
                                   <option  value="{{$value->country}}" data-id="{{$value->country}}">{{$value->country}}</option>
                                 @endforeach
                              </select>                     
                        </span>
                        <span>
                           <label>City</label> 
                              <select class="form-control" id="city" name="city">
                                 <option  value="">Please select</option>
                                 @foreach($city as $key => $value)
                                 <option  value="{{$value->city}}" data-id="{{$value->country}}" data-country="{{$value->country}}">{{$value->city}}</option>
                                 @endforeach
                              </select>                     
                        </span>
                    

                        <span>
                           <label>From</label>
                          <input  class="form-control" type="text" placeholder="click to enter date"  id="from" autocomplete="off">
                        </span>
                        <span>
                           <label>To</label>  
                          <input  class="form-control" type="text" placeholder="click to enter date"  id="to" autocomplete="off">
                        </span>
                        <span class="cal-icon icon-d custom-c2">
                           <img src="{{asset('images/img-1/regresh-icon-1.png')}}" id="customer_filter"></i>
                        </i>
                        </span>
                         <span class="cal-icon icon-d custom-c2  gh">
                           <img src="{{asset('images/img-1/refresh-icon.png')}}" id="reset"></i>
                        </i>
                        </span>
                         <a href="{{url('admin/contributor/create')}}" class="btn btn-primary btn-sm add-nh" role="button"> Add New</a>
                     </div>
                      </div>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1">
                  <!-- <div class="entries-sec">
                     <div class="dataTables_length" id="listofbooking_length">
                        <label>
                           Sr.No 
                           <select name="listofbooking_length" aria-controls="listofbooking" class="">
                              <option value="10">10</option>
                              <option value="25">25</option>
                              <option value="50">50</option>
                              <option value="100">100</option>
                           </select>
                           Entries
                        </label>
                     </div>
                     <div class="serach-bar">
                        <input type="text" class="form-control">
                        <span><i class="fa fa-search"></i></span>
                     </div>
                  </div> -->
                  <div class="row">
                     <div class="table-overlay">

                    <div class="table-responsive">

                        <table class="table-type2" id="customers" style="width:100%">
                           <thead>
                              <tr>
                                
                                 <th> ID</th>
                                 <th>Name</th>
                                 <th> Email </th>
                                 <th> Contact No. </th>
                                 <th> Total Views </th>
                                  <th> Total Contributions </th>
                                 <th> Registered At  </th>
                                 <th> Status </th>
                                 <th class='notexport'> Action</th>
                              </tr>
                           </thead>
                           <tbody>
                              
                                 <!-- <td> 1 </td>
                                 <td>5677</td>
                                 <td class="photo-c"> <img src="images/user-pic.png"> John</td>
                                 <td> John@gmail.com</td>
                                 <td> 7878787878</td>
                                 <td>12-02-21 </td>
                                 <td class="dd"> 
                                    New Street Aus
                                 </td> -->
                                 
                           </tbody>
                        </table>
                     </div>
                      </div>
                  </div>
               </div>
            </div>
            <!-- <div class="block-element">
               <div class="breadcrumb-custom">
                  <span> <a href="">  <i class="fa fa-caret-left"> </i> </a> </span>
                  <ul>
                     <li> <a href="" class="active"> 1 </a> </li>
                     <li> <a href=""> 2 </a> </li>
                     <li> <a href=""> 3 </a> </li>
                     <li> <a href=""> 4 </a> </li>
                     <li> <a href=""> 5 </a> </li>
                  </ul>
                  <span> <a href="">  <i class="fa fa-caret-right"> </i> </a> </span>
               </div>
            </div> -->
         </div>

@stop
@section('script')
<script>


$('#country').change(function() {
  $('#city option').hide();
  $('#city option[data-id="' + $(this).val() + '"]').show();
  // add this code to select 1'st of streets automaticaly 
  // when city changed
  if ($('#city option[data-id="' + $(this).val() + '"]').length) {
    $('#city option[data-id="' + $(this).val() + '"]').first().prop('selected', true);
  }
  else {
   
    $('#city').val('');
  }
  
});
$('#city').change(function() {
  // $('#country option').hide();
  console.log($(this).find(':selected').data("id"));
  $('#country option[data-id="' +  $(this).find(':selected').data("id") + '"]').show();
 
  if ($('#country option[data-id="' + $(this).find(':selected').data("id") + '"]').length) {
    $('#country option[data-id="' + $(this).find(':selected').data("id") + '"]').first().prop('selected', true);
  }
  else {
    $('#country').val('');
  };
});

   
</script>
@stop