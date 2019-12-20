<?php
include_once 'functions.php';

if (isset($_GET['type'])) {
    $type = $_GET['type']; 
} else {
   $type = ''; 
}
$type="'".$type."'";

if (!empty($_POST['search_date'])) {
	$search_date = $_POST['search_date'];	
	$sql_search_date = " AND DATE(m.m_register_date) = '".$search_date."'";
} else {
	$search_date = '';
	$sql_search_date = '';
}


if (!empty($_POST['search_value'])) {
	$search_value = $_POST['search_value'];
	$sql_search_value = " AND (m.m_username LIKE '%".$search_value."%' OR m.m_name LIKE '%".$search_value."%')";
} else {
	$search_value = '';
	$sql_search_value = '';
}

if($_SESSION['login']&& $_SESSION['admin'] != ''){
	
	$sql = "SELECT m.m_id, m.m_username, m.m_name,m.m_email,m.m_phone, DATE_FORMAT(m.m_register_date, '%d/%m/%Y') as register_date, m.m_status, m.m_referal, mm.m_username as upline_username, a.a_username FROM members m
        LEFT JOIN members mm ON mm.m_id = m.m_upline
		LEFT JOIN administrators a ON a.a_id = m.m_reseller_by
		WHERE 1=1 ".$sql_search_date.$sql_search_value.
        "ORDER BY m.m_id DESC";	
		
} 
$result = mysqli_query($conn, $sql);


?>