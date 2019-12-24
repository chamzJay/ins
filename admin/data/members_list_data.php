<?php
include_once 'functions.php';

if (isset($_GET['type'])) {
    $type = $_GET['type']; 
} else {
   $type = ''; 
}
 


if($_SESSION['login']&& $_SESSION['admin'] != ''){

    if ($type!=''){
        
        $sql = "select * from members where m_type="."'".$type."'";	
        $result = mysqli_query($conn, $sql);
    }
	

		
}else{
    
    
} 



?>