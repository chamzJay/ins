<?php


include_once 'functions.php';

if (isset($_GET['type'])) {
    $m_type = $_GET['type']; 
} else {
   $m_type = ''; 
} 

if (isset($_GET['user_id'])) {
    $user_id = $_GET['user_id']; 
} else {
   $user_id = ''; 
} 



if($user_id!=''){
    
$sql="select * from members where m_id='".$user_id."'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result); 
    
}






