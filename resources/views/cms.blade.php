<!DOCTYPE html>
<html lang="en">
<head>
  <title>  {{$data[0]['title']}}</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style type="text/css">
.mobile_pages{background:#eee;}
.mobile_pages .header_main{background:#f7f7f7; text-align: center;margin-bottom: 20px;}
.mobile_pages .header_main img{max-width:125px; margin:0 auto;}
.mobile_pages h1{font-size:18px!important;}    
.mobile_pages h5{font-size: 14px!important; padding-top: 15px;}    
.mobile_pages  p, .mobile_pages  li{font-size:13px!important;}
.mobile_pages ul { padding: 0 20px;}

  </style>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
         <script src="//cdn.ckeditor.com/4.5.6/standard/ckeditor.js"></script>
</head>
<body class="mobile_pages">
 
	<main >
   	    <header>
	   	  	<div class="header_main">
	   			<nav class="navbar navbar-expand-md navbar-dark">
		   			<div class="container">
					   <img src="{{asset('images/tawoon.png')}}">
	                </div>
				</nav>
			</div>
   	    </header>
    

	    <section>
	    	<div class="text_wrapper">
		    	<div class="container">
		    	    <div class="heading_inner">
				      <center><h1> {{$data[0]['title']}}</h1></center>
				    <p id="text">{!!$data[0]['longText']!!}</p>
				    </div>
				    <script>
        ckeditor.replace( 'text' );
    </script>
<!-- 
                     <h5> 1. Lorem ipsum dolor sit amet</h5>
				     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mollis tincidunt ligula, sed elementum dui ultrices id. Nulla ornare massa ut nunc ullamcorper scelerisque. Phasellus diam orci, semper a vestibulum non, dapibus quis augue. Maecenas metus lectus, fringilla non ullamcorper eu, fringilla sed velit. Curabitur sed orci in orci lobortis mollis ut a urna. </p>
                     
				     <h5>2. Elementum dui ultrices id</h5>
				     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mollis tincidunt ligula, sed elementum dui ultrices id. Nulla ornare massa ut nunc ullamcorper scelerisque. Phasellus diam orci, semper a vestibulum non, dapibus quis augue. Maecenas metus lectus, fringilla non ullamcorper eu, fringilla sed velit. Curabitur sed orci in orci lobortis mollis ut a urna. </p>

				     <h5>3. Information Collected Through Your Use of iBring Service</h5>
				     <p>Vivamus mi arcu, aliquet eget viverra sit amet, venenatis at enim. Proin in nulla lorem. Vestibulum in risus dictum, sollicitudin lacus nec, auctor mi. Ut efficitur commodo nisl, et hendrerit purus venenatis a. Aliquam convallis, tellus vel dapibus vestibulum, eros diam porttitor felis, id tempor mi augue at dolor. Phasellus fermentum purus vitae orci semper tempor.</p>

				     <h5>4. Lorem ipsum dolor sit amet</h5>
				     <p> Nam iaculis libero sed enim gravida, in blandit lacus consequat:.</p>
				     <ul>
				     	<li>
				     	  Sed eget justo augue. Aliquam erat volutpat. Praesent in nisl eget eros malesuada condimentum.
				     	</li>
				     	<li>
				     	   Etiam sit amet interdum metus, in ullamcorper lorem. Sed eros neque, euismod ac facilisis at, aliquam vel nisl. 
				     	</li>
				     	<li>
				     	    Mauris at odio elit. Sed est diam, mattis vel metus sed, vulputate consectetur nulla. Vestibulum mattis diam eget nunc ultricies vestibulum. 
				     	</li>
				     	<li>
				     	    Fusce in convallis sem. Integer vitae libero gravida, aliquet mauris et, ornare ante. Quisque gravida tortor eros, vel hendrerit dolor lacinia sed. 
				     	</li>
				     	<li>
				     	    Ut cursus lacus dolor, eget vestibulum lorem pharetra eu. Nullam lacinia erat id ex suscipit, ac elementum sem cursus. Fusce in convallis sem.  
				     	</li>
				     	
				     </ul>


				     <h5>5. Fringilla non ullamcorper eu</h5>
				     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mollis tincidunt ligula, sed elementum dui ultrices id. Nulla ornare massa ut nunc ullamcorper scelerisque. Phasellus diam orci, semper a vestibulum non, dapibus quis augue. Maecenas metus lectus, fringilla non ullamcorper eu, fringilla sed velit. Curabitur sed orci in orci lobortis mollis ut a urna. </p>


				     <h5>6. Lorem ipsum dolor sit amet</h5>
				     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mollis tincidunt ligula, sed elementum dui ultrices id. Nulla ornare massa ut nunc ullamcorper scelerisque. Phasellus diam orci, semper a vestibulum non, dapibus quis augue. Maecenas metus lectus, fringilla non ullamcorper eu, fringilla sed velit. Curabitur sed orci in orci lobortis mollis ut a urna. </p>
                     
				     <h5>7. Elementum dui ultrices id</h5>
				     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mollis tincidunt ligula, sed elementum dui ultrices id. Nulla ornare massa ut nunc ullamcorper scelerisque. Phasellus diam orci, semper a vestibulum non, dapibus quis augue. Maecenas metus lectus, fringilla non ullamcorper eu, fringilla sed velit. Curabitur sed orci in orci lobortis mollis ut a urna. </p>
				    
				     <h5>8. Lorem ipsum dolor sit amet</h5>
				     <p> Nam iaculis libero sed enim gravida, in blandit lacus consequat:.</p>
				     <ul>
				     	<li>
				     	  Sed eget justo augue. Aliquam erat volutpat. Praesent in nisl eget eros malesuada condimentum.
				     	</li>
				     	<li>
				     	   Etiam sit amet interdum metus, in ullamcorper lorem. Sed eros neque, euismod ac facilisis at, aliquam vel nisl. 
				     	</li>
				     	<li>
				     	    Mauris at odio elit. Sed est diam, mattis vel metus sed, vulputate consectetur nulla. Vestibulum mattis diam eget nunc ultricies vestibulum. 
				     	</li>
				     	<li>
				     	    Fusce in convallis sem. Integer vitae libero gravida, aliquet mauris et, ornare ante. Quisque gravida tortor eros, vel hendrerit dolor lacinia sed. 
				     	</li>
				     	<li>
				     	    Ut cursus lacus dolor, eget vestibulum lorem pharetra eu. Nullam lacinia erat id ex suscipit, ac elementum sem cursus. Fusce in convallis sem.  
				     	</li>
				     	
				     </ul>
 -->

			
				</div>
		    </div>
	    </section>
	</main>
</body>
</html>
