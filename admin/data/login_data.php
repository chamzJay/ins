<?php
session_start();	
include_once '../../conn.php';
include_once 'functions.php';
     
	//Fetching Values from URL
	$login_pass = $_POST['user_pass'];
	$login_user = $_POST['user_name'];

	
if($login_pass != '' && $login_user != '' ){
    
    
       $sqlcheck="SELECT * FROM administrators WHERE  a_username='".$login_user."' AND a_status = 1 ";
       $result = mysqli_query($conn, $sqlcheck);
 
       
        if(mysqli_num_rows($result) > 0){
            $res = mysqli_fetch_assoc($result);
            $pw = $res['a_password'];
               
       
            if(password_verify($login_pass,$pw))
            {
               
                $_SESSION['login'] = $res['a_id'];
                $_SESSION['admin'] = $res['a_id'];
              
            header('Location: ../home.php?error=0');
 
            }       
            else{
                  header('Location: ../index.php?error=2');
                
            }

            
        } else{
            
              header('Location: ../index.php?error=1');
            
        } 
        
        } 

       
?>