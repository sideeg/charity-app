@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
        	     @include('includes.common')
        	 <form action="{{route('initiator.store')}}" method="POST"  enctype="multipart/form-data">
        	 	   @csrf
           

            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  Initiator  </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Add Initiator</h5>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="block-element text-left  basic-info-c4">
                          <!--  <button class="btn-c"> Basic Info  </button> -->
                          <!--  <button class="btn-c  cancel  reset"> Login Credentails   </button> -->
                        </div>
                     </div>
                     <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12  back-btn text-right float-right">
                        <div class="page-title">
                           <h3 class="col-black"> 
                            <button class="btn-c" type="button" onclick="window.location.href='{{url('admin/initiator')}}'"> Back  </button> </h3>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                  	  
         
                     <div class="col-md-12">
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Name </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control"   name="name" placeholder=" Name " value="{{old('name')}}" name="name" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('Please enter on alphabets only. ')" onkeydown="try{setCustomValidity('')}catch(e){}" onkeypress="return /[a-zA-Z\s]+/i.test(event.key)" required>
                           </div>
                        </div>
                         <div class="col-md-12">
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Name AR</p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control"   name="name_ar" placeholder=" Name AR" value="{{old('name_ar')}}" name="name_ar"  oninvalid="setCustomValidity('Please enter on alphabets only. ')" required>
                           </div>
                        </div>
                     
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Registration Number </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control"    name="registration_number"pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}"  value="{{old('registration_number')}}" required>
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
                              <p class="col-grey"> Location  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text"  name="location" pattern="[a-zA-Z0-9,',','#','.',\s]+" oninvalid="setCustomValidity('Please enter on alphabets,Numbers or , or # or . only. ')" onchange="try{setCustomValidity('')}catch(e){}"   value="{{old('location')}}">
                           </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Contact Person Name  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text"   name="contact_name" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('Please enter on alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}"   value="{{old('contact_name')}}" required>
                           </div>
                        </div>
                        <!-- <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Contact Person Name Arabic </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text"   name="contact_name_ar" value="{{old('contact_name_ar')}}">
                           </div>
                        </div> -->
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Contact Person Number  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                             <!--  <input type="tel"  name="contact_number" pattern="[0-9,'+'\s]+" oninvalid="setCustomValidity('Please enter Numbers only. ')" onchange="try{setCustomValidity('')}catch(e){}"  onkeypress="return /[0-9,'+'\s]+/i.test(event.key)"required  value="{{old('contact_number')}}" onkeydown="try{setCustomValidity('')}catch(e){}" > -->
                              <input    id="contactPhoneField" name="contactPhoneField" class="phone-field" type="tel" pattern="[0-9]{6,15}" required="" maxlength="15" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"  required  value="{{old('phone_number')}}" oninvalid="setCustomValidity('Please enter  minimum 6 and max 15 numbers.')" onkeydown="try{setCustomValidity('')}catch(e){}" >
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6" style="display:none">
                           <div class="form-label">
                              <p class="col-grey">  Contact Person Number  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                            <input    name="contact_number" style="display:none" id="contact_number">
                           </div>
                        </div> 
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6" style="display:none">
                           <div class="form-label">
                              <p class="col-grey">  Office Phone Number  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                            <input    name="phone_number" style="display:none" id="phone_number">
                           </div>
                        </div>   
                      
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Office Phone Number  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                             <!--  <input   name="country_code"  id="country_code" type="text"   value="{{old('country_code')}}" class="country_code" required> -->
 <input   name="country_code" id="phoneField" name="phoneField" class="phone-field" type="tel" pattern="[0-9]{6,15}" required="" maxlength="15" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"  required  value="{{old('phone_number')}}" oninvalid="setCustomValidity('Please enter  minimum 6 and max 15 numbers.')" onkeydown="try{setCustomValidity('')}catch(e){}" >
                           </div>
                        </div> 
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Password  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text"   name="password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
                              title="Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters" oninvalid="setCustomValidity('Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters')" onchange="try{setCustomValidity('')}catch(e){}"   value="{{old('password')}}">
                           </div>
                        </div>                 
                       
                       <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Confirm Password  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text"   name="password_confirmation"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
                              title="Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters" oninvalid="setCustomValidity('Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters')" onchange="try{setCustomValidity('')}catch(e){}"   value="{{old('password_confirmation')}}">
                           </div>
                        </div>  
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> User Email  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="email" class="form-control"  name='email' value="{{old('email')}}" required>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Business Name  </p>
                           </div>
                        <div class="form-field1 m-b-20">
                              <input type="text"   name="business_name"     value="{{old('business_name')}}">
                           </div>
                           <div>
                           <div class="form-label">
                              <p class="col-grey">  Location Ar  </p>
                           </div>
                        <div class="form-field1 m-b-20">
                              <input type="text"   name="location_ar"     value="{{old('location_ar')}}">
                           </div>
</div>
                     </div>
             </div>
                  <div class="row">
                     <!-- <div class="col-md-6">
                        <label>Please Upload User Image</label>
                        <div class="preview text-left">
                           
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="200" height="200">
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="image" accept="image/*" require>
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div> -->
                      <div class="col-md-6">
                         <label>Please Upload Registration Certificate</label>
                        <div class="preview text-left">

                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100" id="frame">
                            
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="register_image" accept="image/*"  onchange="loadImg()" required>
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                  </div>


                   <div class="block-element text-right">
                       
                        
                         <button class="btn-c  cancel  reset" onclick="window.location.href='{{url('admin/initiator')}}'">  Cancel </button>
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
$("#contactPhoneField").intlTelInput({
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
                var phoneNumberContact = $('#contactPhoneField').val();
                var nameContact = $("#contactPhoneField").intlTelInput("getSelectedCountryData").dialCode;
                $(document).find("#phone_number").val(phoneNumber);
                $(document).find("#phoneField").val(code);
                var contactCountryCode =  "+"+nameContact+phoneNumberContact;
                $(document).find("#contact_number").val(contactCountryCode);
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
