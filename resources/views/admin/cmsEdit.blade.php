@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
               @include('includes.common')
             <form action="{{route('cms.update',$data[0]->id)}}" method="POST" id="add_category" enctype="multipart/form-data">
               @csrf
            @method('PUT')

            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  Cms Page  </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Edit Page</h5>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="block-element text-left  basic-info-c4">
                           <!-- <button class="btn-c"> Basic Info  </button> -->
                          <!--  <button class="btn-c  cancel  reset"> Login Credentails   </button> -->
                        </div>
                     </div>
                  </div>
                  <div class="row">
                      
         
                     <div class="col-md-12">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                           <div class="form-label">
                              <p class="col-grey"> Page Title </p>
                           </div>
                           <div class="form-field1 m-b-20">
                               <input type="text" class="form-control required" id="title" placeholder="Enter Page Name" name="title" value="{{$data[0]->title}}">
                           </div>
                        </div>
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                           <div class="form-label">
                              <p class="col-grey"> Page Description </p>
                           </div>
                           <div class="form-field1 m-b-20">
                            <textarea name="longText" id="messageArea"  class="form-control ckeditor" required>{{$data[0]->longText}}</textarea>
    
                           </div>
                        </div>
                        
                        
                    
                        
                     </div>
             </div>


                   <div class="block-element text-right">
                       
                        
                         <button class="btn-c  cancel  reset" href="{{url('admin/dashboard')}}">  Cancel </button>
                         <button class="btn-c" type="submit">  Save  </button>
                     </div>

                           </div>
               
               </div>
            </div>
                </form>  
         </div>

  <script src="//cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>

         <script type="text/javascript">
            CKEDITOR.replace( 'messageArea',
      {
          customConfig : 'config.js',
          toolbar : 'simple'
      })
         </script>
@stop
  
