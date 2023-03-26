@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
        	     @include('includes.common')
        	 <form action="{{route('state.update',$user->id)}}" method="POST"  enctype="multipart/form-data">
        	 	   @csrf
            @method('PUT')

            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  State  </h3>
                  </div>
               </div>
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12  back-btn text-right float-right">
                  <div class="page-title">
                     <h3 class="col-black"> 
                      <button class="btn-c" type="button" onclick="window.location.href='{{url('admin/state')}}'"> Back  </button> </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Edit state</h5>
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
                              <p class="col-grey">  Name </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Name " value="{{$user->title}}" name="title" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('Please enter on alphabets only. ')" onkeypress="return /[a-zA-Z\s]+/i.test(event.key)" onkeydown="try{setCustomValidity('')}catch(e){}" required>
                           </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Arabic Name  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Name " value="{{$user->title_arabic}}" name="title_arabic" required  >
                           </div>
                        </div>

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  Country </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="countrie_id" rquired>
                                  @if(!empty($countrie))
                                    @foreach($countrie as $count)
                                       <option value="{{$count->id}}"{{($user->countrie_id  == $count->id ? 'selected' : '')}}>{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div> 
                        <div class="block-element text-right">
                         <button class="btn-c  cancel  reset" onclick="window.location.href='{{url('admin/state')}}'" type="button">  Cancel </button>
                         <button class="btn-c" type="submit">  Save  </button>
                     </div>

   </div>
                     
               
               </div>
            </div>
                </form>  
         </div>

@stop