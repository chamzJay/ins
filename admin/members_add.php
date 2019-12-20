<?php
include_once './header.php';
include_once './sidebar.php';
include_once 'data/user_detail_data.php';
include_once 'data/functions.php';
include_once 'data/database.php';

//include_once 'data/functions.php';
include_once 'data/members_add_data.php';

if (!empty($_GET['error'])) {
    $error = $_GET['error']; 
} else {
    $error = '';
}

?>

  <!-- Content Wrapper. Contains page content -->
<div class="page-wrapper">
    
    
    
     <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Player Details</h3> </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Player Group</a></li>
                        <li class="breadcrumb-item active">Player Detail</li>
                    </ol>
                </div>
            </div>
    
    
 <div  class="col-lg-12">
     
 

<div class="box-body">
<div class="card">
    
        <div class="card-title">
                                <h2>Add New Player</h2>

        
        </div>
			  
	<div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-6">
            
         
            <hr>
            <!-- /.box-header -->
	
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
			
	
                <form action="data/register_newmember.php" class="templatemo-login-form" method="post" enctype="multipart/form-data" name="registration_members">
        
			
			<div class="row form-group">						
				<div class="col-lg-6 col-md-6 form-group">
                                    <div class="profile_image" >
					<?php if($m_pic == ''){ ?>
                                            <img src="../images/user.png" class="img-circle profile_image" alt="User Image" style="max-height: 100px">
					<?php } else { ?>
						<img src="../uploads/profile/<?= $m_pic; ?>" class="img-circle profile_image" alt="<?php echo $m_username; ?>">
					<?php } ?>
					</div>
					<div class="upload_picture">
					<label class="control-label templatemo-block" id="upload_label">Upload Picture :</label> 
					<input type="file" name="fileToUpload" id="fileToUpload" class="filestyle" data-buttonName="btn-primary" data-buttonBefore="true" data-icon="false" accept="image/*"> 
					</div>
				</div>
			</div>
			
				<div class="row form-group">
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Username :</label>
                                                <input type="text" class="form-control" id="user_name" placeholder="Username" name="user_name" required>                            
					</div>
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Password :</label>
                                                <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>                            
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Full Name :</label>
						<input type="text" class="form-control" id="full_name" placeholder="Full Name" name="full_name"  title="Enter a valid Name">                            
					</div>
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Email :</label>
                                                <input type="email" class="form-control" id="email" placeholder="Email" name="email"  title="Enter a valid email" required>                            
					</div>
                                    
                                       <div class="col-lg-6 col-md-6 form-group">                  
						<label>User Refer By :</label>
                             
                                                <select class="form-control" name="user_member_reference" id="user_member_reference" required>
                                                          <?php                                                             
                                                             $database->loadAllUsers($row['m_upline']);
                                                          ?>
                                               </select>
					</div>
                                    
                                        <div class="col-lg-6 col-md-6 form-group">
                                        <label>User Type</label>
                                        <select class="form-control" name="user_type" id="user_type" required>
                                                   
                                                          <?php
                                                             $database-> loadAllUsersType($row['m_type']);
                                                            ?>
                                        </select>
						 
                                    </div>
				</div>
				
				<div class="row form-group">
					<div class="col-lg-6 col-md-6 form-group">                  
                                                <label>Phone :</label>
                                                <input type="number" class="form-control" id="phone" placeholder="Phone" name="phone" required> 						
					</div>
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Date of Birth :</label>
						<input type="date" class="form-control " id="dob" placeholder="Date of Birth" name="dob">                            
					</div>
				</div>
				
				<div class="row form-group">
					
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Security Password :</label>
						<input type="password" class="form-control" id="otp" placeholder="Security Password" name="otp" >                            
					</div>
				</div>
				
                                <div class="row form-group">
                                            <div class="col-lg-12 col-md-12 form-group">
                                                    <label>Address :</label>
                                                    <textarea id="address" class="form-control" rows="2" name="address"><?= $m_address; ?></textarea>

                                            </div>
                                </div>
                    
                    
                                <hr /> 
				
				<div class="row form-group">
					
					<div class="col-lg-4 col-md-4 form-group">                  
						<label>Bank Name :</label>
						<input type="text" class="form-control" id="bank_name" placeholder="Bank Name" name="bank_name" 
						value="<?php echo $m_bank_name; ?>">                            
					</div>
					
					<div class="col-lg-4 col-md-4 form-group">                  
						<label>Account No :</label>
						<input type="text" class="form-control" id="bank_account" placeholder="Account No" name="bank_account" 
						value="<?php echo $m_bank_account_no; ?>">                             
					</div>
					
					<div class="col-lg-4 col-md-4 form-group">                  
						<label>Bank Branch :</label>
						<input type="text" class="form-control" id="bank_branch" placeholder="Bank Branch" name="bank_branch" 
						value="<?php echo $m_bank_branch; ?>">                             
					</div>
				</div>
				
				<div class="row form-group">
					
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Bitcoin :</label>
						<input type="text" class="form-control" id="bitcoin" placeholder="Bitcoin" name="bitcoin" 
						value="<?php echo $m_bitcoin; ?>">                            
					</div>
					
					<div class="col-lg-6 col-md-6 form-group">                  
						<label>Litecoin :</label>
						<input type="text" class="form-control" id="litecoin" placeholder="Litecoin" name="litecoin" 
						value="<?php echo $m_litecoin; ?>">                             
					</div>
				</div>
				
				<hr />
				
				<div class="row form-group">
					
					<div class="col-lg-4 col-md-4 form-group">                  
						<label>Line ID :</label>
						<input type="text" class="form-control" id="line_id" placeholder="Line ID" name="line_id" 
						value="<?php echo $m_lineid; ?>">                            
					</div>
					
					<div class="col-lg-4 col-md-4 form-group">                  
						<label>WeChat ID :</label>
						<input type="text" class="form-control" id="wechat_id" placeholder="WeChat ID" name="wechat_id" 
						value="<?php echo $m_wechatid; ?>">                             
					</div>
					
					<div class="col-lg-4 col-md-4 form-group">                  
						<label>WhatsApp :</label>
						<input type="text" class="form-control" id="whatsapp" placeholder="WhatsApp" name="whatsapp" 
						value="<?php echo $m_whatsapp; ?>">                             
					</div>
				</div>
				


              <div class="row">
				<div class="col-lg-3 col-md-3 form-group"> 
				  <?php if($m_id != ''){ ?>
					<button type="submit" class="btn btn-block btn-success">Update Now</button>
				  <?php } else { ?>
					<button type="submit" class="btn btn-block btn-success">Add Now</button>
				  <?php } ?>
				</div>
				<div class="col-lg-3 col-md-3 form-group"> 
					<button type="reset" class="btn btn-block btn-warning">Reset</button>
				</div>
              </div>        
			  
			  </form>
            </div>
            <!-- /.box-body -->

        </div>
        
        
        
         </div>

           

     </div>
     </div>
	 </div>
 
      
      
  
 </div>

<?php
	if($_SESSION['supermaster'] != ''){
		if($m_id != '') { 
			if($m_master_by != '') {
		?>
			<script type="text/javascript">
			window.onload = function() {
				var m_master_id =  '<?= $m_master_by; ?>';
				var m_admin_id = '<?= $m_admin_by; ?>';
				getAdmin(m_master_id,m_admin_id);
				
				var m_reseller_by = '<?= $m_reseller_by; ?>';
				getReseller(m_admin_id,m_reseller_by);
				
				var m_upline = '<?= $m_upline; ?>';
				getUpline(m_reseller_by,m_upline);
			}
			</script>
		<?php
			}
		}
	} else if($_SESSION['master'] != ''){
		if($m_id != '') { 
			if($m_admin_by != '') {
		?>
			<script type="text/javascript">
			window.onload = function() {
				var m_admin_id =  '<?= $m_admin_by; ?>';
				var m_reseller_by = '<?= $m_reseller_by; ?>';
				getReseller(m_admin_id,m_reseller_by);
				
				var m_upline = '<?= $m_upline; ?>';
				getUpline(m_reseller_by,m_upline);
			}
			</script>
		<?php
			}
		}
	} else if($_SESSION['admin'] != '') { 

		if($m_id != '') { 
				if($m_reseller_by != '') {
			?>
				<script type="text/javascript">
				window.onload = function() {
					var m_res_by = '<?= $m_reseller_by; ?>';
					var m_upline = '<?= $m_upline; ?>';
					getUpline(m_res_by,m_upline);
				}
				</script>
			<?php
			}
		} 
	}
?> 

<div>
 <?php

require_once 'footer.php';

?>