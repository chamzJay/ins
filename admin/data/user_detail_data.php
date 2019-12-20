<?php

/* @var $_POST type */
$user_id=$_GET['user_id']; 

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once 'functions.php';


$sql="select * from members where m_id='".$user_id."'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result); 





