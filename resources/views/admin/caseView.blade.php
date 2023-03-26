@extends('layouts.admin')
@section('content')
<style type="text/css">
	table.table-type2 th, table.table-type2 td {
    padding: 0 10px;
}
</style>
<div class="dashboard-wrapper  case-view-d">
   <div class="row m-b-20">
      <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
         <div class="page-title">
            <h3 class="col-black"> Case  Details </h3>
         </div>
      </div>
        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12  back-btn text-right float-right">
                  <div class="page-title">
                     <h3 class="col-black"> 
                      <button class="btn-c" type="button" onclick="window.location.href='{{url('admin/case')}}'"> Back  </button> </h3>
         </div>
  </div>
   </div>
 
   <div class="customer-inner-profile">
      <div class="block-element">
         <div class="row">
           <!--  <div class="col-md-8 col-md-offset-2">
               <div class="profile-img-sec-d">
                  <div class="profile">
                     @if(!empty($user->national_certificate))
                     <img src="{{url('storage/app').'/'.$user->national_certificate}}">
                     @endif  
                     <span>{{"Case National Image"}}</span>
                     <a href="#" class="view-img">View Image</a>
                  </div>
               </div>
            </div> -->
         </div>
         <div class="row">
              <div class="col-md-12 col-md-offset-1 " id="case_update_form" style="display:none">
              	 @include('includes.common')
                      <form action="{{route('admin.case.update1',$user->id)}}" method="POST"  enctype="multipart/form-data" autocomplete="off" id="edit_form_case">
               @csrf
    			  @method('PATCH')

        
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Update Case</h5>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="block-element text-left  basic-info-c4">
                         <!--   <button class="btn-c"> Basic Info  </button> -->
                          <!--  <button class="btn-c  cancel  reset"> Login Credentails   </button> -->
                        </div>
                     </div>
                  </div>
                  <div class="row">
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
                              <p class="col-grey">Select  Category </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="categorie_id" id="categorie_id" required>
                                  @if(!empty($categorie))
                                    @foreach($categorie as $count)
                                       <option value="{{$count->id}}" {{($user->categorie_id == $count->id ? "selected":"")}}>{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div> 

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  Initiator </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="provider_id" id="provider_id" required>
                                  @if(!empty($initiator))
                                    @foreach($initiator as $count)
                                       <option value="{{$count->id}}" {{($user->provider_id == $count->id ? "selected":"")}}>{{$count->name}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div> 

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                            <div class="form-label">
                              <p class="col-grey"> Case  National Number </p>
                           </div>
                        <div class="preview text-left case-national">
                           @if(!empty($user->national_certificate))
                              <img class="preview-img" src="{{url('storage/app').'/'.$user->national_certificate}}" alt="Preview Image" height="200" width="200">
                           @else
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" height="200" width="200">
                           @endif 
                         <!--    <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="200" height="200"> -->
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="national_certificate" accept="image/*"  onchange="loadImg()" >
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  Title (En) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Case  Title (En) "name="title" pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}"  value="{{$user->title}}"  required >
                           </div>
                        </div>      

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  Title (Ar) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Case  Title (Ar) "name="title_ar"  value="{{$user->title_ar}}"  required >
                           </div>
                        </div>  

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  description (En) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <textarea   placeholder=" Case  description (En) "name="description" pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}"    required  rows="5" cols="10">{{$user->description}}</textarea>
                           </div>
                        </div>  

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  description (Ar) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <textarea   placeholder=" Case  description (Ar) "name="description_ar"  value="{{old('description_ar')}}"  required  rows="5" cols="10">{{$user->description_ar}}</textarea>
                           </div>
                        </div>  
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  Goal </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="number" class="form-control" placeholder=" Case  Goal "name="goal" pattern="[0-9]+"  oninvalid="setCustomValidity('Please enter  Numbers only. ')" onchange="try{setCustomValidity('')}catch(e){}"  value="{{$user->goal}}"  required >
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Close / Deactivate Case </p>
                           </div>
                           <div class="form-field1 m-b-20">
                            @if($user->status == "Closed")

                             <!-- <input type="checkbox" class="form-control"  name="close_case" value="1" checked  readonly > -->
                             {{"Case Closed"}}
                             @else
                              <input type="checkbox" class="form-control"  name="close_case" value="1">
                             @endif
                              
                             
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  National Number  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Case  National Number "name="national_number" pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}"  value="{{$user->national_number}}"  required >
                           </div>
                        </div>   
                        
                           <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  End Date   </p>
                           </div>
                           <div class="form-field1 m-b-20">
                               <input  class="form-control" type="text" name="end_date" placeholder="click to enter date"  id="end_date" autocomplete="off" value="{{$user->end_date}}" required>

                                <input  class="form-control" type="hidden" name="created_date" placeholder="click to enter date"  id="created_date" autocomplete="off" value="{{ \Carbon\Carbon::parse($user->created_at)->format('Y-m-d')}}">
                           </div>
                        </div> 

                        
<div class="five-images">

<div class="row">


                       <div class="col-md-2">
                        <div class="preview text-left">
                        	@if(!empty($user->attachments[0]->attachment))
                            <img class="preview-img" src="{{url('storage/app').'/'.$user->attachments[0]->attachment}}" alt="Preview Image" width="100" height="100" id="frame">
                            @else
                              <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100" id="frame">

                            @endif
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="attachment[]" accept=".pdf,image/*"  onchange="loadImg()" id="frame">
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="preview text-left">
                        	@if(!empty($user->attachments[1]->attachment))
                            <img class="preview-img" src="{{url('storage/app').'/'.$user->attachments[1]->attachment}}" alt="Preview Image" width="100" height="100" id="frame1">
                            @else
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100"id="frame1" >
                            @endif
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="attachment[]" accept=".pdf,image/*"  onchange="loadImg1()">
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="preview text-left">
                        	@if(!empty($user->attachments[2]->attachment))
                            <img class="preview-img" src="{{url('storage/app').'/'.$user->attachments[2]->attachment}}" alt="Preview Image" width="100" height="100" id="frame2">
                            @else
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100" id="frame2">
                            @endif
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="attachment[]" accept=".pdf,image/*"  onchange="loadImg2()" >
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="preview text-left">
                        	@if(!empty($user->attachments[3]->attachment))
                            <img class="preview-img" src="{{url('storage/app').'/'.$user->attachments[3]->attachment}}" alt="Preview Image" width="100" height="100" id="frame3">
                            @else         
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100" id="frame3">
                            @endif
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="attachment[]" accept=".pdf,image/*"  onchange="loadImg3()">
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="preview text-left">
                        	@if(!empty($user->attachments[4]->attachment))
                            <img class="preview-img" src="{{url('storage/app').'/'.$user->attachments[4]->attachment}}" alt="Preview Image" width="100" height="100" id="frame4">
                            @else
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100" id="frame4">
                            @endif 
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="attachment[]" accept=".pdf,image/*"  onchange="loadImg4()">
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                   </div>
</div>


                   <div class="block-element text-right">
                       
                        
                         <button class="btn-c  cancel  reset" type="button" id="submit_form_cancel">  Cancel </button>
                         <button class="btn-c" type="submit">  Save  </button>
                     </div>

   </div>
                     
               
               </div>
            </div>
                </form>  
             </div>
             <div class="col-md-2"></div>
            <div class="col-md-8 " id="case_basic_details">
               <div class="customer-inner-left-profile">
                  <!--  <div class="profile">
                     @if(!empty($user->national_certificate))
                       <img src="{{url('storage/app').'/'.$user->national_certificate}}">
                     
                     @endif  
                       <span>{{"Case National Image"}}</span>
                     </div> -->
                  <div class="customer-table">
                      <h3>Case Details</h3>
                      <div class=" actions-btn-c modify"><button class="view-img" id="view_case_update_form" target="blank">Edit</button> </div>
                     <table class="table-type2">
                        <thead>
                          <tr>
                              <th>Case Serial No</th>
                              <td>{{($user->serial_no ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case Title</th>
                              <td>{{($user->title ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case Title Arabic</th>
                              <td>{{($user->title_ar ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case Description </th>
                              <td>{{($user->description ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case Description Arabic</th>
                              <td>{{($user->description_ar ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case City</th>
                              <td>{{($user->city ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case Country</th>
                              <td>{{($user->country ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case Goal</th>
                              <td>{{($user->goal ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case National Number</th>
                              <td>{{($user->national_number ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case Status</th>
                              <td>{{($user->status ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case Contributed Amount</th>
                              <td>{{($user->contributed ?: "N/A")}}</td>
                           </tr>
                           </tr>
                           <tr>
                              <th>Case Sector</th>
                              <td>{{($user->category->title ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Registered At</th>
                              <td>@php
                                 echo date('d-m-Y', strtotime($user->created_at) );
                                 @endphp
                              </td>
                           </tr>
                          <!--  <h3>Initiator Details</h3> -->

                            <tr>
                              <th>Initiator Name</th>
                              @if($user->initiator->name != '')

                              <!--class="btn view-img"-->
                              <td> <a style="display: inline-block;margin-bottom: 10px;" href="{{route('initiator.show',$user->initiator->id)}}"   target="blank">{{$user->initiator->name}}</a>
                              @else
                              <td>{{ "N/A"}}</td>
                              @endif
                              
                           </tr>
                        </thead>
                     </table>
              <div class="case_nation" style="margin-top: 20px;">
              	<div class="row">
              		<div class="col-md-12" style="padding: 0px;">
              			<div class="profile-img-sec-d singlepro">
	                        <div class="profile" style=" padding: 10px;background: #f3f3f3;border-radius: 6px;">
	                           @if(!empty($user->national_certificate))
	                           <span>Case National Number</span>
	                           <img src="{{url('storage/app').'/'.$user->national_certificate}}">
	                           @endif  
	                         
	                           <a href="{{url('storage/app').'/'.$user->national_certificate}}" target="blank" class="view-img">View Image</a>
	                         </div>
               			</div>
              		</div>
              	</div>
              	<div class="row">
              		
              			@if(!empty($user->attachments))
                @foreach($user->attachments as $value)
                <div class="col-md-3">
                      <div class="profile-img-sec-d view-img-second not-top">
                        <div class="profile">
                          
                           <img src="{{url('storage/app').'/'.$value->attachment}}">
                           <a href="{{url('storage/app').'/'.$value->attachment}}" class="view-img" target="blank">View Image</a>
                        </div>
                     </div>
                     </div>
                @endforeach  
              @endif
              		
              	</div> 
                     
           
              
              </div>
            </div>      
           
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="block-element customer-form-c1 dashboard-wrapper">
      <div class="box-type1">
         <div class="entries-sec">
            <div class="dataTables_length" id="listofbooking_length">
               <label>
                  <h3 class="case-upadtes-title"> Case Updates </h3>
               </label>
            </div>
            <div class="serach-bar">
            </div>
         </div>
         <div class="row">
            <div class="table-overlay">
               @if(!empty($user->updates))
               <table class="table-type2">
                  <thead>
                     <tr>
                        <th> Id </th>
                        <th>Description</th>
                        <th>Description Arabic</th>
                     </tr>
                  </thead>
             
                  <tbody>
                     @foreach($user->updates as $value)
                     <tr>
                        <td class="d-1"> {{($value->id ?: "N/A")}} </td>
                        <td class="d-2"> {{($value->description ?: "N/A")}} </td>

                        <td class="description-l">
                           <div class="descrp-w1">  {{($value->description_ar ?: "N/A")}} </div>
                          
                                
                              
                         
                       
                           @if((App\Models\matterUpdateAttachment::where('matter_update_id',$value->id)->count() > 0))
                             
                               @php
                                 $attachment =  App\Models\matterUpdateAttachment::where('matter_update_id',$value->id)->get();
                               @endphp
                             
                              <div class="images-h images-row">
                                    @foreach($attachment as $value)
                                       <div>
                                 <img src="{{url('storage/app').'/'.$value->attachment}}">
                                 <a href="{{url('storage/app').'/'.$value->attachment}}" class="view-img" target="blank">View Img</a>
                              </div>
                                    @endforeach

                              </div>      
                           @endif
                        </td>
                     </tr>
                     @endforeach
                  </tbody>
               </table>
               @endif
            </div>
         </div>
      </div>
   </div>
   <div class="block-element customer-form-c1 dashboard-wrapper">
      <div class="box-type1">
         <div class="entries-sec case-contributo">
            <div class="dataTables_length case-contributo" id="listofbooking_length">
               <label>
              <h3 class="case-upadtes-title">  Case Contributors </h3>
               </label>
                <label>
           <a href="{{route('admin.case.contributor',$user->id)}}" class="btn btn-primary btn-sm  " role="button" aria-disabled="true">View Contributors</a>
               </label>
            </div>
            <div class="serach-bar">
        
            </div>
         </div>
<!--          <div class="row">
            <div class="table-overlay">
   <table class="table-type2" id="transaction_case">
                           <thead>
                              <tr>
                                 
                                 <th>  ID</th>
                                 <th> Case Title </th>
                         
                                 <th>Payment Mode</th>
                                 <th>Transaction Id</th>
                                 <th>Transaction Amount</th>
                                 <th>Transaction Date</th>
                                 <th>Transaction Time</th>
                                   <th> Status</th>
                                 <th> Aprrove Transaction </th>
                                 <th> Action</th>
                              </tr>
                           </thead>
                           <tbody>
                           </tbody>
                        </table>
            </div>
         </div> -->
      </div>
   </div>
   <div class="block-element">
   </div>
</div>

@stop

@section('script')
<script>

$('#end_date').datepicker({
                format: "yyyy-mm-dd",
                 autoclose: true,
                 todayHighlight: true,
                  // minDate: new Date({{ \Carbon\Carbon::parse($user->created_at)->format('yyyy-mm-dd')}}),
                 

            }); 


$("#end_date").change(function () {
                var startDate = document.getElementById("end_date").value;
                var endDate = document.getElementById("created_date").value;
                // console.log(startDate,endDate);
                if ((Date.parse(startDate) <= Date.parse(endDate))) {
                    toastr.info('End date  must be greater then {{ \Carbon\Carbon::parse($user->created_at)->format('Y-m-d')}}');
                    document.getElementById("end_date").value = "";
                }
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





