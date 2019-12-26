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
        $m_lineid                   = $_POST['m_lineid'];
        $m_whatsapp                 = $_POST['m_whatsapp'];
        $m_address                  = $_POST['m_address'];
        $m_bank_name                = $_POST['m_bank_name'];
        $m_bank_account_no          = $_POST['m_bank_account_no'];
        $m_bank_branch              = $_POST['m_bank_branch'];
        $m_phone_country            = $_POST['m_phone_country'];
        $m_admin_by                 = $_POST['m_admin_by'];
	$m_master_by                = $_POST['m_master_by'];
	$m_reseller_by              = $_POST['m_reseller'];
	$m_upline                   = $_POST['m_upline'];
	$m_referal                  = md5($_POST['m_name']);
        $m_status                   = $_POST['m_status'];
	$m_otp                      = $_POST['m_otp'];
	$m_bitcoin                  = $_POST['m_bitcoin'];
	$m_litecoin                 = $_POST['litecoin'];
        $m_wechatid                 = $_POST['m_wechat_id'];
        $m_type                     = $_POST['m_type'];
	$m_currency                 = $_POST['m_currency'];
       
        //Action 
        $action                     = $_POST['action'];               
    
        
        //Other Data 
        if($_SESSION['master'] != ''){
		$register_by = $_SESSION['master'];
	} else if($_SESSION['supermaster'] != '') {
		$register_by = $_SESSION['supermaster'];
	} else if($_SESSION['admin'] != '') {
		$register_by = $_SESSION['admin'];
	} else {
		$register_by = $_SESSION['reseller'];
	}
        
        // pass 
        
	$register_by_id = getUseridbyUsername($register_by, $conn);
	$hash_password = password_hash($m_password, PASSWORD_DEFAULT);
	$hash_otp = password_hash($m_otp, PASSWORD_DEFAULT);
	
	
        
        // image location 
        $target_dir = "../../uploads/profile/";
        
        
        
    if ($action=='register') {
           
        
        if(basename($_FILES["user_profile_image"]["name"]) != ''){

            $m_img=$target_dir.reSize($_FILES['user_profile_image']['tmp_name'],$_FILES['user_profile_image']['name'],1);  

         }else{
             
             $m_img='';
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
					$sql = "INSERT INTO members (m_address,m_username, m_password, m_name, m_email, m_dob, m_phone,m_type,m_pic,m_upline) VALUES ('".$m_address."','".$m_username."', '".$hash_password."', '".$m_fullname."', '".$m_email."', '".$m_dob."', '".$m_phone."', '".$m_type."', '". $m_img."', '". $user_member_reference."')";
                                        //echo $sql;
                                       // exit();
                                       
					mysqli_query($conn, $sql);
					
					header('Location: ../members_list.php?type='.$m_type.'&error=5');
					
			   }

                          
                           
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
                   $error=2;
                  
                } else {
                     $error=1;
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
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=1;
                }
        
           
    } 
    

        
     if($user_type != ''){
		 
        $sql = "update members set m_type='".$user_type."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=1;
                }
           
    }
    
      if($user_level != ''){
		 
        $sql = "update members set m_level='".$user_level."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
    
      if($m_name != ''){
		 
        $sql = "update members set m_name='".$m_name."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=1;
                };
        
           
    }
  
      if($user_email != ''){
		 
        $sql = "update members set m_email='".$user_email."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
    
    
      if($user_dob != ''){
	        
        $sql = "update members set m_dob='".$user_dob."'where m_id='".$user_id."'";
          if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
      if($user_phone != ''){
		 
        $sql = "update members set m_phone='".$user_phone."'where m_id='".$user_id."'";
         mysqli_query($conn, $sql);
        
           
    }
      if($m_lineid != ''){
		 
        $sql = "update  members set  m_lineid='".$m_lineid."'where m_id='".$user_id."'";
        
        if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
      if($m_whatsapp != ''){
           
		 
        $sql = "update  members set m_whatsapp='".$m_whatsapp."'where m_id='".$user_id."'";
        
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=1;
                }
     
    }
      if($user_address != ''){
		 
        $sql = "update  members set m_address='".$user_address."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
    
    if($m_bank_name != ''){
        
        
		 
        $sql = "update  members set m_bank_name='".$m_bank_name."'where m_id='".$user_id."'";
        
          
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
    
      if($m_bank_account_no != ''){
		 
        $sql = "update  members set m_bank_account_no='".$m_bank_account_no."'where m_id='".$user_id."'";
         if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=1;
                }
        
           
    }
    
      if($m_bank_branch != ''){
		 
        $sql = "update  members set m_bank_branch='".$m_bank_branch."'where m_id='".$user_id."'";
          if (mysqli_query($conn, $sql)) {
                        
                   
                    $error=2;
                    
                } else {
                    
                    $error=0;
                }
        
           
    }
   
     if($error==''){
         $error=4;
     }

    
    header('Location: ../members_add.php?user_id='.$user_id.'&error='.$error);

        
    
        
        
        
}  

   function UniqueRandomNumbersWithinRange($min, $max, $quantity) {
    $numbers = range($min, $max);
    shuffle($numbers);
    return array_slice($numbers, 0, $quantity);
}
                
                
                
function reSize($file,$var_file,$var_name){
    
        $sourceProperties = getimagesize($file);
        $fileNewName = time().$var_name;
        $folderPath = "../../uploads/profile/";
        $ext = pathinfo($var_file, PATHINFO_EXTENSION);

        $imageType = $sourceProperties[2];

        switch ($imageType) {


            case IMAGETYPE_PNG:
                $imageResourceId = imagecreatefrompng($file); 
                $targetLayer = imageResize($imageResourceId,$sourceProperties[0],$sourceProperties[1]);
                imagepng($targetLayer,$folderPath. $fileNewName.".". $ext);
                break;


            case IMAGETYPE_GIF:
                $imageResourceId = imagecreatefromgif($file); 
                $targetLayer = imageResize($imageResourceId,$sourceProperties[0],$sourceProperties[1]);
                imagegif($targetLayer,$folderPath. $fileNewName.".". $ext);
                break;


            case IMAGETYPE_JPEG:
                $imageResourceId = imagecreatefromjpeg($file); 
                $targetLayer = imageResize($imageResourceId,$sourceProperties[0],$sourceProperties[1]);
                imagejpeg($targetLayer,$folderPath. $fileNewName.".". $ext);
                break;


            default:
                echo "Invalid Image type.";
                exit;
                break;
        }

        $file_save_as=  $fileNewName. ".". $ext;   
        
        
        move_uploaded_file( $folderPath.$file_save_as);
       
        return $file_save_as;     
    
    
} 
    
    
 function imageResize($imageResourceId,$width,$height) {


    $targetWidth =500;
    $targetHeight =500;


    $targetLayer=imagecreatetruecolor($targetWidth,$targetHeight);
    imagecopyresampled($targetLayer,$imageResourceId,0,0,0,0,$targetWidth,$targetHeight, $width,$height);


    return $targetLayer;
}  
