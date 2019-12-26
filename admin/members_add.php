<?php
include_once './header.php';
include_once './sidebar.php';
include_once 'data/members_add_data.php';
include_once 'data/functions.php';
include_once 'data/database.php';


if (!empty($_GET['error'])) {
    $error = $_GET['error']; 
} else {
    $error = '';
}


if($error==2){
   echo '<script>  swal("Sucessfully Updated", "Please Navigate to Exit", "success");</script>';
    
}

if($error==4){
   echo '<script>  swal("Nothing  Updated", "Please check", "warning");</script>';
    
}


?>

  <!-- Content Wrapper. Contains page content -->
<div class="page-wrapper">
    
    
    
     <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary" style="text-transform: uppercase;"><?=$m_type?> Details</h3> </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)"><?=$m_type?> Group</a></li>
                        <li class="breadcrumb-item active"><?=$row['m_type']?>  Detail</li>
                    </ol>
                </div>
            </div>
    
    
 <div  class="col-lg-12">
     
 

<div class="box-body">
<div class="card">
    
        <div class="card-title">
            
                                <?php if($user_id!=''){
                                    
                                    
                                    echo '<h2>Update '.$row['m_type'].'</h2>';
                                    
                                    
                                }else{
                                    
                                     echo '<h2>Add New '.$m_type.'</h2>';
                                }
                               
                                ?>

        
        </div>
	<div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-6">
            
        
            <div class="box-body">
			
			<?php if($error != '') { ?>
			<div class="row">
                <div class="col-md-12 col-md-12" id="error_display">
                    <?php
                    
                    if($error == '2'){
                        echo "Please fill-in all the required fields";
                    } else if($error == '1'){
                       echo "Username already registered "; 
                    } else if($error == '3'){
					  echo "Username can only be alphabets & numbers "; 
					} else if($error == '4'){
					  echo "Please upload only image file";	
					}
                    
                    ?>
                </div>
              </div>  
            <?php } ?>
			
			<?php
 if($user_id != ''){ ?>
                <form action="data/register_members.php" class="templatemo-login-form" method="post" enctype="multipart/form-data" name="update_members">
                <input type="hidden" name="id" value="<?php echo $user_id; ?>">
                <input type="hidden" name="action" value="update">
                                
            <?php }else{  ?>
                
                
                <form action="data/register_members.php" class="templatemo-login-form" method="post" enctype="multipart/form-data" name="update_members">
                <input type="hidden" name="action" value="register">
                <input type="hidden" name="m_type" value="<?=$m_type?>">
            <?php }?>
			<div class="row form-group">						
				<div class="col-lg-6 col-md-6 form-group">
					<div class="user_image">
					<?php if($row['m_pic'] == ''){ ?>
                                            <img name="user_image" id="profile_image"  src="../uploads/profile/avt.png" class="img-circle profile_image" style="max-height:150px;width:auto">
					<?php } else { ?>
                                                <img name="user_image" id="profile_image"  src="../uploads/profile/<?= $row['m_pic']; ?>" class="img-circle profile_image" style="max-height:150px;width:auto">
					<?php } ?>
					</div>
                                    
                                   
					
				</div>
			</div>
                
                   <div class="input-group">
                                                        
                                        <input type="file" name="user_profile_image" id="user_profile_image" class="form-control"  placeholder="Username" aria-describedby="inputGroupPrepend" style="display: none;align-content: center" />
                                         <input type="button" style="width: 100px"value="Browse" id="browse_image" class="btn btn-block btn-success"/>

                                    </div> 
                    <br>
				<div class="row form-group">
                                    
                                    
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Login Name :</label>
                                                <input type="text" class="form-control" id="user_name" placeholder="Username" name="user_name" value="<?php echo $row['m_username']; ?>" required>                            
					</div>
					
                                     
                                    
                                  
                                    <?php if($user_id==''){?>
                                     <div class="col-lg-6 col-md-6 form-group">                  
						<label>Password :</label>
                                                <input type="password" class="form-control" id="password"  name="password" autocomplete="off" required>                            
				     </div>
                                    <?php } ?>
                                    
                                    <?php if($row['m_type']=='user'){ ?>
                                            <div class="col-lg-6 col-md-6 form-group">                  
                                                          <label>Refer By :</label>

                                                          <select class="form-control" name="user_member_reference" id="user_member_reference">
                                                                    <?php                                                             
                                                                       $database->loadAllUsers($row['m_upline']);
                                                                    ?>
                                                         </select>
                                          </div>
                                    <?php }?>
				</div>
                                    
                                <hr>
				
				<div class="row form-group">
                                       
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Full Name :</label>
						<input type="text" class="form-control" id="m_name" placeholder="First Name" name="m_name" value="<?php echo $row['m_name'] ; ?>" title="Enter a valid Name">                            
					</div>
                               
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Email :</label>
						<input type="text" class="form-control" id="m_email" placeholder="Email" name="m_email" value="<?php echo $row['m_email']; ?>" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Enter a valid email">                            
					</div>
                                    
                                   <div class="col-lg-6 col-md-6 form-group">                  
						<label>Date of Birth :</label>
                                                <input type="<?php if($row['m_id']==''){echo "date";}else{echo "text";} ?>" class="form-control date" id="m_dob" placeholder="YYYY-MM-DD" name="m_dob" value="<?php echo $row['m_dob']; ?>" >                            
					</div>
                                    
                                    <div class="col-lg-6 col-md-6 form-group">                  
						<label >Mobile Number :</label>
						
						<input type="text" class="form-control" id="m_phone" placeholder="Phone" name="m_phone" value="<?php echo $row['m_phone']; ?>"> 						
					</div>

				</div>
				
				<div class="row form-group">
					
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Line ID :</label>
						<input type="text" id="m_lineid" autocomplete="off" name="m_lineid" class="form-control" placeholder="Line ID"  value="<?php echo $row['m_lineid']; ?>" >                            
					</div>
                                    <div class="col-lg-6 col-md-6 form-group">
                                                 <label>WhatsApp Number :</label>
						 <input type="text" id="m_whatsapp" name="m_whatsapp"  class="form-control" placeholder="WhatsApp ID" value="<?php echo $row['m_whatsapp'] ?>">
                                     </div>
				</div>
				 
								<hr /> 
				
				<div class="row form-group">
					
				    <div class="col-lg-6 col-md-6 form-group">
                                         <label>Address :</label>
                                          <input type="text"  id="m_address" name="m_address" class="form-control " placeholder="Your Address" value="<?php echo $row['m_address'] ?>">
                                    </div><!-- End .input-group -->
                                 
				</div>
				
                                 
				<div class="row form-group">
					
					<div class="col-lg-4 col-md-4 form-group">                  
						<label>Bank Name :</label>
						<input type="text" class="form-control" id="m_bank_name" placeholder="Bank Name" name="m_bank_name" value="<?php echo $row['m_bank_name']; ?>">                            
					</div>
					
					<div class="col-lg-4 col-md-4 form-group">                  
						<label>Account No :</label>
                                                <input type="number" class="form-control" id="m_bank_account_no" placeholder="Account No" name="m_bank_account_no" 
						value="<?php echo  $row['m_bank_account_no']; ?>">                             
					</div>
					
					<div class="col-lg-4 col-md-4 form-group">                  
						<label>Bank Branch :</label>
						<input type="text" class="form-control" id="m_bank_branch" placeholder="Bank Branch" name="m_bank_branch" 
						value="<?php echo  $row['m_bank_branch']; ?>">                             
					</div>
				</div>	                               

	
				
				<hr />
                                
                       


              <div  class="row form-group">
                <div class="col-lg-3 col-md-3 form-group"> 
                <?php if($row['m_id']!=''){?>
                    
                    
                
                <button type="submit" class="btn btn-block btn-success">Update Now</button>
                <?php }else{?>
                
                
                <button type="submit" class="btn btn-block btn-danger">Add New</button>
                
                <?php }?>
                </div>
                <div class="col-lg-3 col-md-3 form-group"> 
                        <button type="reset" class="btn btn-block btn-warning">Reset</button>
                </div>
                  
             
              </div>        
			  
        </form>
    </div>
    
</div>
        
        
        
         </div>

           

     </div>
     </div>
	 </div>
  
<script>
    $('#browse_image').on('click', function(e){
        
        $('#user_profile_image').click();
    })
    $('#user_profile_image').on('change', function(e){
        var fileInput = this;
        if(fileInput.files[0]){
            var reader = new FileReader();
            reader.onload = function(e){
                $('#profile_image').attr('src', e.target.result);
            }
            reader.readAsDataURL(fileInput.files[0]);
        }
    });

</script>      
      
  
  </div>

 

 <?php

require_once 'footer.php';
 

?>
 