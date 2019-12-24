<?php
    include_once '../../conn.php';
	include_once 'functions.php';

	//Fetching Values from URL
        $user_id                    = $_POST['id'];
	$m_username                 = $_POST['user_name'];
        $m_password                 = $_POST['password'];
        $user_member_reference      = $_POST['user_member_reference'];
        $m_email                    = $_POST['m_email'];
        $m_name                     = $_POST['m_name'];
        $m_dob                      = $_POST['m_dob'];
        $m_phone                    = $_POST['m_phone'];
        $m_lineid                   = $_POST['m_line_id'];
        
        
        
	
	$m_phone_country = $_POST['phone_country'];
	 
	
	$m_admin_by = $_POST['admin_by'];
	$m_master_by = $_POST['master_by'];
	$m_reseller_by = $_POST['reseller'] == '' ? 0 : $_POST['reseller'];
	$m_upline = $_POST['upline'] == '' ? 0 : $_POST['upline'];
	$m_referal = md5($_POST['user_name']);
        $m_status = $_POST['status'];
	$m_otp = $_POST['otp'];
	$m_bank_name = $_POST['bank_name'];
	$m_bank_account_no = $_POST['bank_account'];
	$m_bank_branch = $_POST['bank_branch'];
	$m_bitcoin = $_POST['bitcoin'];
	$m_litecoin = $_POST['litecoin'];
	
	$m_wechatid = $_POST['wechat_id'];
	$m_whatsapp = $_POST['whatsapp'];
        $m_address = $_POST['address'];
        $m_type=$_POST['user_type'];
        
	$user_email         = $_POST['user_email'];
	$user_phone         = $_POST['user_phone'];
	$user_dob           = $_POST['user_dob'];
	$user_otp               = $_POST['otp'];
	$user_bank_name          = $_POST['bank_name'];
	$user_bank_account_no   = $_POST['bank_account'];
	$user_bank_branch           = $_POST['bank_branch'];
	$user_bitcoin           = $_POST['bitcoin'];
	$user_litecoin          = $_POST['litecoin'];
	$user_lineId              = $_POST['user_lineId'];
	$user_wechatid            = $_POST['wechat_id'];
	$user_whatsapp           = $_POST['user_whatsapp'];
       
        $user_pass               =$_POST['user_pass'];
        
        $user_lname              =$_POST['user_lname'];
        $user_pic                =$_POST['user_pic'];
       
        $user_gpay_balance      =$_POST['gpay_balance'];
        $user_country            =$_POST['user_country'];
        $user_state              =$_POST['user_state'];
        $user_city               =$_POST['user_city'];
        $user_postal_code          =$_POST['user_postal_code'];
        $user_register_date      =$_POST['user_register_date'];
        $user_end_date           =$_POST['user_end_date'];
        $user_register_by        =$_POST['user_register_by'];
        $user_updated_by         =$_POST['user_updated_by'];
        $user_updated_date       =$_POST['user_updated_date'];
        $user_type               =$_POST['user_type'];
        $user_level              =$_POST['user_level'];
        $user_address            = $_POST['user_address'];
        $new_ref                =$_POST['new_ref'];
        $user_currency          =$_POST['currency'];
        $action                 = $_POST['action'];               
    
        if($_SESSION['master'] != ''){
		$register_by = $_SESSION['master'];
	} else if($_SESSION['supermaster'] != '') {
		$register_by = $_SESSION['supermaster'];
	} else if($_SESSION['admin'] != '') {
		$register_by = $_SESSION['admin'];
	} else {
		$register_by = $_SESSION['reseller'];
	}
        

	$register_by_id = getUseridbyUsername($register_by, $conn);
	$hash_password = password_hash($m_password, PASSWORD_DEFAULT);
	$hash_otp = password_hash($m_otp, PASSWORD_DEFAULT);
	
	
        
        
        $target_dir = "../../uploads/profile/";
        
        
        
    if ($action=='register') {
           
        
        $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
        $uploadFileType = pathinfo($target_file,PATHINFO_EXTENSION);
        if(basename($_FILES["fileToUpload"]["name"]) != ''){
            $newfilename = round(microtime(true)) . '.' . $uploadFileType;
            if($uploadFileType != "jpg" && $uploadFileType != "png" && $uploadFileType != "jpeg" && $uploadFileType != "gif" && $uploadFileType != "JPG" && $uploadFileType != "PNG" && $uploadFileType != "JPEG" && $uploadFileType != "GIF") {
                $fail = "1";
            } else {
                $fail = "0"; 
            }
        }
	
        
	if($m_username != '' && $m_password != ''){
            
          	
			if(preg_match('/[^a-z_\-0-9]/i',$m_username)){
				header('Location: ../members_add.php?error=3');
			} else {
		   
			   $sqlcheck="SELECT * FROM members WHERE m_username='".$m_username."'";
			   $result = mysqli_query($conn, $sqlcheck);
			   
			   if (mysqli_num_rows($result) > 0) {
					header('Location: ../members_add.php?error=1');
			   } else {
					$sql = "INSERT INTO members (m_address,m_username, m_password, m_name, m_email, m_dob, m_phone,m_type,m_pic) VALUES ('".$m_address."','".$m_username."', '".$hash_password."', '".$m_fullname."', '".$m_email."', '".$m_dob."', '".$m_phone."', '".$m_type."', '". $newfilename."')";
                                        //echo $sql;
                                       // exit();
                                       
					mysqli_query($conn, $sql);
					
                                        $arrrecid = mysqli_query("SELECT @@IDENTITY AS recid");
                                        $row = mysqli_fetch_assoc($arrrecid);
                                        $recid = mysqli_insert_id($conn);
                                        
					move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_dir. $newfilename);
					 
					header('Location: ../members_list.php?type='.$m_type);
					
			   }

                           //insert g-poin as a reward point
                           $admin_setting = adminSettings($conn);
                           $reward_amount = $admin_setting['as_reward_amount'];

                 
                           
                           
                           
			}
				
		} else {
			header('Location: ../members_add.php?error=2');
		}
	 

                
    }elseif ($action=='update') {
        
        
               
//=================================================================================================
       
       
       
        if(($_FILES["user_profile_image"]["name"])!='')
        {
      
       
             $target_user_image = $target_dir . basename($_FILES["user_profile_image"]["name"]);
              $uploadFileType_user_image = pathinfo($target_user_image,PATHINFO_EXTENSION);
                $newfilename_user_image = round(microtime(true)) . UniqueRandomNumbersWithinRange(0, 100, 1)[0] . '.' . $uploadFileType_user_image;

                if(basename($_FILES["user_profile_image"]["name"]) != ''){
                    if($uploadFileType_user_image != "jpg" && $uploadFileType_user_image != "png" && $uploadFileType_user_image != "jpeg" && $uploadFileType_user_image != "gif" && $uploadFileType_user_image != "JPG" && $uploadFileType_user_image != "PNG" && $uploadFileType_user_image != "JPEG" && $uploadFileType_user_image != "GIF") {
                        $fail = "1";
                    } else {
                        $fail = "0";
                    }
                }
            move_uploaded_file($_FILES["user_profile_image"]["tmp_name"], $target_dir. $newfilename_user_image);
            
            $user_pic=$newfilename_user_image;
            
            $sql = "UPDATE members SET m_pic='".$user_pic."' WHERE m_id='".$user_id."'";
            
            
            if (mysqli_query($conn, $sql)) {
                   $error='0';
                  
                } else {
                     $error='1';
                }
            
            
        }
        
      
         
//===================================================================================================
    

      if($m_username != ''){
		 
        $sql = "update members set  m_username='".$m_username."'where m_id='".$user_id."'";
         mysqli_query($conn, $sql);
        
           
    }
    
    
      if($user_otp  != ''){
		 
        $sql = "update members set  m_otp='".$user_otp ."'where m_id='".$user_id."'";
         mysqli_query($conn, $sql);
        
           
    }
    
     if($user_member_reference != ''){
		 
        $sql = "update members set  m_upline='".$user_member_reference."'where m_id='".$user_id."'";
         mysqli_query($conn, $sql);
        
           
    } 
    
      if($new_ref != ''){
		 
        $sql = "update members set m_new_ref ='".$new_ref."'where m_id='".$user_id."'";
         
         
          if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                }
        
           
    } 
    

        
     if($user_type != ''){
		 
        $sql = "update members set m_type='".$user_type."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                }
           
    }
    
      if($user_level != ''){
		 
        $sql = "update members set m_level='".$user_level."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
    
      if($user_fname != ''){
		 
        $sql = "update members set m_name='".$user_fname."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                };
        
           
    }
  
      if($user_email != ''){
		 
        $sql = "update members set m_email='".$user_email."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
    
    
      if($user_dob != ''){
	        
        $sql = "update members set m_dob='".$user_dob."'where m_id='".$user_id."'";
          if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
      if($user_phone != ''){
		 
        $sql = "update members set m_phone='".$user_phone."'where m_id='".$user_id."'";
         mysqli_query($conn, $sql);
        
           
    }
      if($user_lineId != ''){
		 
        $sql = "update  members set  m_lineid='".$user_lineId."'where m_id='".$user_id."'";
        
        if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
      if($user_whatsapp != ''){
           
		 
        $sql = "update  members set m_whatsapp='".$user_whatsapp."'where m_id='".$user_id."'";
        
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                }
     
    }
      if($user_address != ''){
		 
        $sql = "update  members set m_address='".$user_address."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
    
    if($user_bank_name != ''){
        
        
		 
        $sql = "update  members set m_bank_name='".$user_bank_name."'where m_id='".$user_id."'";
        
          
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
    
      if($user_bank_account_no != ''){
		 
        $sql = "update  members set m_bank_account_no='".$user_bank_account_no."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
    
      if($user_bank_branch != ''){
		 
        $sql = "update  members set m_bank_branch='".$user_bank_branch."'where m_id='".$user_id."'";
          if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=0;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
   
   function UniqueRandomNumbersWithinRange($min, $max, $quantity) {
    $numbers = range($min, $max);
    shuffle($numbers);
    return array_slice($numbers, 0, $quantity);
}


    header('Location: ../members_add.php?user_id='.$user_id.'&error='.$error);

        
    
        
        
        
    
}           
                
                
                
?>