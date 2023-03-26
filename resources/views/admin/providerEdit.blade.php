@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
        	     @include('includes.common')
        	 <form action="{{route('initiator.update',$user->id)}}" method="POST"  enctype="multipart/form-data">
        	 	   @csrf
            @method('PUT')

            <div class="row m-b-20" style="    display: flex;
    align-items: center;
    flex-wrap: wrap;">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title mb-0" style="margin-bottom: 0px;">
                     <h3 class="col-black">  Initiator  </h3>
                  </div>
               </div>
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title mb-0" style="margin-bottom: 0px;">
                      <h3 class="col-black" style="text-align: right;"> 
                            <button class="btn-c" type="button" onclick="window.location.href='{{url('admin/initiator')}}'"> Back  </button> </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Edit Initiator</h5>
                  <!-- <div class="row">
                     <div class="col-md-12">
                        <div class="block-element text-left  basic-info-c4">
                           <button class="btn-c"> Basic Info  </button> 
                    <button class="btn-c  cancel  reset"> Login Credentails   </button> 
                        </div>
                     </div>
                     <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12  back-btn text-right float-right">
                        <div class="page-title">
                           <h3 class="col-black"> 
                            <button class="btn-c" type="button" onclick="window.location.href='{{url('admin/initiator')}}'"> Back  </button> </h3>
                        </div>
                     </div>
                  </div> -->
                  <div class="row">
                  	  
         
                     <div class="col-md-12">
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Name </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Name " value="{{$user->name}}" name="name" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('Please enter on alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}" onkeypress="return /[a-zA-Z\s]+/i.test(event.key)">
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Registration Number </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder="Enter  Registration Number"  value="{{$user->registration_number}}" name="registration_number"pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}">
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  Country </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="country" id="country" required>
                                  @if(!empty($countrie))
                                    @foreach($countrie as $count)
                                       <option value="{{$count->id}}" {{($user->country == $count->title ? "selected":"")}}>{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div>   

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  State </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="state" id="state" required>
                                  @if(!empty($state))
                                    @foreach($state as $count)
                                       <option value="{{$count->id}}" data-id="{{$count->countrie_id}}" {{($user->state == $count->title ? "selected":"")}}>{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div>   
                         <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  city </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="city" id="city" required>
                                  @if(!empty($city))
                                    @foreach($city as $count)
                                       <option value="{{$count->id}}" data-id="{{$count->state_id}}" {{($user->city == $count->title ? "selected":"")}}>{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div>  
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Location  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text"  value="{{$user->location}}" name="location" pattern="[a-zA-Z0-9,',',\s]+" oninvalid="setCustomValidity('Please enter on alphabets,Numbers or , only. ')" onchange="try{setCustomValidity('')}catch(e){}" required>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Contact Person Name  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text"  value="{{$user->contact_name}}" name="contact_name" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('Please enter on alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}" onkeypress="return /[0-9,'+'\s]+/i.test(event.key)" required>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Contact Person Number  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="tel"  value="{{$user->contact_number}}" name="contact_number" pattern="[0-9,'+'\s]+" oninvalid="setCustomValidity('Please enter Numbers only. ')" onchange="try{setCustomValidity('')}catch(e){}" required>
                           </div>
                        </div>
                                 
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Office Phone Number  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder="User Number"value="{{$user->country_code.$user->phone_number}}" readonly>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> User Email  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="email" class="form-control" placeholder="User Number"value="{{$user->email}}" name='email' readonly required>
                           </div>
                        </div>

                     </div>
             </div>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="preview text-left">
                        	@if(!empty($user->image))
                      <!--         <img src="{{url('storage/app').'/'.$user->image}}"> -->
                              <img class="preview-img" src="{{url('storage/app').'/'.$user->image}}" alt="Preview Image" width="100" height="100" id="frame">
                            @else
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image"width="100" height="100" id="frame">
                            @endif 
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="image" accept="image/*" onchange="loadImg()" >
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                  </div>


                   <div class="block-element text-right">
                       
                        
                         <button class="btn-c  cancel  reset"  type="button" onclick="window.location.href='{{url('admin/initiator')}}'">  Cancel </button>
                         <button class="btn-c" type="submit">  Save  </button>
                     </div>

                           </div>
               
               </div>
            </div>
                </form>  
         </div>

@stop
@section('script')
<script>


$('#country').change(function() {
  $('#state option').hide();
  $('#state option[data-id="' + $(this).val() + '"]').show();
  // add this code to select 1'st of streets automaticaly 
  // when city changed
  if ($('#state option[data-id="' + $(this).val() + '"]').length) {
    $('#state option[data-id="' + $(this).val() + '"]').first().prop('selected', true);
  }
  else {
   
    $('#state').val('');
  }

  $('#city option').hide();
  $('#city option[data-id="' + $('#state').val() + '"]').show();
  // add this code to select 1'st of streets automaticaly 
  // when city changed
  if ($('#city option[data-id="' + $('#state').val() + '"]').length) {
    $('#city option[data-id="' + $('#state').val() + '"]').first().prop('selected', true);
  }
  else {
 
      $('#city').val('');
  };
  
});
$('#state').change(function() {
  $('#city option').hide();
  $('#city option[data-id="' + $(this).val() + '"]').show();
 
  if ($('#city option[data-id="' + $(this).val() + '"]').length) {
    $('#city option[data-id="' + $(this).val() + '"]').first().prop('selected', true);
  }
  else {
    $('#city').val('');
  };
});

    $("#view_case_update_form").click(function () {
      $("#case_update_form").fadeIn(1000);
      $("#case_basic_details").fadeOut(1000);       
    });
    
    $("#submit_form_cancel").click(function () {
       event.preventDefault();
      $("#case_update_form").fadeOut(1000);
      $("#case_basic_details").fadeIn(1000);       
    });

</script>
@stop
