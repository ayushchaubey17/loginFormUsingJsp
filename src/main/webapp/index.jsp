<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style >
.m1{
margin-top: 10px;
}

</style>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
      
<meta charset="UTF-8">
<title>Insert title here</title>
</head >
<body  style="background:url(https://images.pexels.com/photos/3586966/pexels-photo-3586966.jpeg?auto=compress&cs=tinysrgb&w=800);background-size:cover;background-attachment:fixed;">
<div class="container">
  <div class="row">
  		<div class="col s10 offset-s1 m6 offset-m3 ">
  		
  				<div class="card" style="background:none;z-index:5000;">
  				 <div class="card-content">
  				 
  				   <h3 class="white-text text-darken-2 center-align" style="margin-top:10px">Register here</h3>
  				   <h5 class="center-align" id ="msg"></h5>
  				    <div class="form center-align">
  				   
  				   		<form action="Register" class="" method="post" id="myForm">
  				   		
  				   		<input type= "text" placeholder="enter your name"  name="user_name"/>
  				   		<input type= "password" placeholder="enter your password"  name="user_password"/>
  				   		<input type= "email" placeholder="enter your email"  name="user_email"/>
  				   		
  				   		
  				   		
  				   		 <div class="file-field input-field">
      <div class="btn blue">
        <span>Upload Image</span>
        <input type="file">
      </div>
      <div class="file-path-wrapper">
        <input name="image" class="file-path validate" type="text">
      </div>
    </div>
  				   		
  				   		<button type="submit" class="btn light-blue accent-3">Submit</button>
  				   		</form>
  				   
  				   </div>
  				   
  				   <div class="loader center-align m1"  style="display:none">
  				   
  				     <div class="preloader-wrapper small active">
    <div class="spinner-layer spinner-green-only">
      <div class="circle-clipper left">
        <div class="circle"></div>
      </div><div class="gap-patch">
        <div class="circle"></div>
      </div><div class="circle-clipper right">
        <div class="circle"></div>
      </div>
    </div>
  </div>
   <p class="center-align white-text">please wait.....</p>
  				
  				   </div>
  				   
  				 </div>
  				</div>
  		
  				
  		
  		
  		</div>
  
  </div>



</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script >
 $(document).ready(
function (){
	console.log("ready");
	
	$('#myForm').on('submit',function (event){
		event.preventDefault();
		let f = new FormData(this);
		console.log(f);
		
		
		$(".loader").show();
		$(".form").hide();
		
		//request bhej rha h
		$.ajax(
				{
					url:"Register",
					data :f,
					type:"post",
					success: function(data,textStatus,jqXHR){
						console.log(data);
						console.log("success");
						$(".loader").hide();
						
						
						console.log(data +" yeh data hai")
						if(data.trim() === 'done'){
							console.log("well done");
							
							$('#msg').html("successfully registered");
							$('#msg').addClass("green-text");
							
						}
						else{
							$('#msg').html("something went wrong.. please login again");
							$('#msg').addClass("red-text")
						
						}
						
						
						
				
					},
					error: function(jqXHR,textStatus,errorThrown){console.log(errorThrown);
					$(".loader").hide();
					$(".form").show();
					$('#msg').html("something went wrong.. please login again");
					$('#msg').addClass("red-text")
					
					}
					,
					processData:false,
					contentType:false
				}
				)
				
		
		
		
		
		
	})
	
	
}		 

 
 );
 

</script>

</body>
</html>