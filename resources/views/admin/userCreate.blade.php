@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
        	     @include('includes.common')
        	 <form action="{{route('customer.store')}}" method="POST"  enctype="multipart/form-data">
        	 	   @csrf
         
            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  Contributor  </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Add Contributor</h5>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="block-element text-left  basic-info-c4">
                          <!--  <button class="btn-c"> Basic Info  </button> -->
                          <!--  <button class="btn-c  cancel  reset"> Login Credentails   </button> -->
                        </div>
                     </div>
                  </div>
                  <div class="row">
                  	  
         
                     
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Name </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Name " value="{{old('name')}}" name="name" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('Please enter on alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}" onkeypress="return /[a-zA-Z\s]+/i.test(event.key)" required onkeydown="try{setCustomValidity('')}catch(e){}">
                           </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Email  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="email" class="form-control" placeholder="Enter Contributor Email"value="{{old('email')}}"  name="email"  required>
                           </div>
                        </div>
                    
                     <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6" style="display:none">
                           <div class="form-label">
                              <p class="col-grey">  Phone Number  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input    name="phone_number" style="display:none" id="phone_number">
                           </div>
                        </div>    
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Phone Number  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                            
                               <input   name="country_code" id="phoneField" name="phoneField" class="phone-field" type="tel" pattern="[0-9]{6,15}" required="" maxlength="15" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"  required  value="{{old('phone_number')}}" oninvalid="setCustomValidity('Please enter  minimum 6 and max 15 numbers.')" onkeydown="try{setCustomValidity('')}catch(e){}" >
                           </div>
                        </div> 

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Select Gender  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <select class="form-control" name="gender">
                                <option value="Male" >Male</option>
                                <option value="Female" >Female</option>
                                <option value="Other" >Other</option>
                              </select>
                              
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
                                       <option value="{{$count->id}}" >{{$count->title}}</option>
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
                                       <option value="{{$count->id}}" data-id="{{$count->countrie_id}}" >{{$count->title}}</option>
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
                                       <option value="{{$count->id}}" data-id="{{$count->state_id}}" >{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div>  
                        

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Select Type  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <select class="form-control" name="type">
                                <option value="Individual" >Individual</option>
                                <option value="Organization" >Organization</option>
                               
                              </select>
                              
                           </div>
                        </div>

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Select Date Of Birth  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                               <input  class="form-control" type="text" placeholder="Birth Date" name="birth_date" id="from" value="{{old('birth_date')}}" autocomplete="off" required>  
                           </div>
                        </div>

                     </div>
               
                  <div class="row">
                     <div class="col-md-12">
                        <div class="preview text-left">
                        	@if(!empty($user->image))
                      <!--         <img src="{{url('storage/app').'/'.$user->image}}"> -->
                              <img class="preview-img" src="{{url('storage/app').'/'.$user->image}}" alt="Preview Image"width="100" height="100" id="frame">
                            @else
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image"width="100" height="100" id="frame">
                            @endif 
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="image" accept="image/*" onchange="loadImg()">
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                  </div>

                            <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Password  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text"   name="password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
                              title="Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters" oninvalid="setCustomValidity('Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters')" onkeydown="try{setCustomValidity('')}catch(e){}"   value="{{old('password')}}" required>
                           </div>
                        </div>                 
                       
                       <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Confirm Password  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text"   name="password_confirmation"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
                              title="Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters" oninvalid="setCustomValidity('Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters')" onkeydown="try{setCustomValidity('')}catch(e){}"   value="{{old('password_confirmation')}}" required>
                           </div>
                        </div>  
                   

                   <div class="block-element text-right">
                       
                        
                         <button class="btn-c  cancel  reset" type="button" onclick="window.location.href='{{url('admin/contributor')}}'">  Cancel </button>
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

$("#phoneField").intlTelInput({
     autoHideDialCode: true,
                autoPlaceholder: "ON",
                dropdownContainer: document.body,
                formatOnDisplay: true,
                hiddenInput: "full_number",
                initialCountry: "auto",
                nationalMode: true,
                placeholderNumberType: "MOBILE",
                preferredCountries: ['in'],
                separateDialCode: true
});

$("form").submit(function() {
  var code = $("#phoneField").intlTelInput("getSelectedCountryData").dialCode;
                var phoneNumber = $('#phoneField').val();
                var name = $("#phoneField").intlTelInput("getSelectedCountryData").name;
                $(document).find("#phone_number").val(phoneNumber);
                $(document).find("#phoneField").val(code);
                // alert('Country Code : ' + code + '\nPhone Number : ' + phoneNumber + '\nCountry Name : ' + name);
});
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
