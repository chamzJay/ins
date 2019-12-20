<?php
date_default_timezone_set("Asia/Manila");
error_reporting(0);
@ini_set('display_errors', 0);

define("DB_SERVER", "localhost");
define("DB_USER", "root");
define("DB_PASS", "");
define("DB_NAME", "ins");
define('APP_NAME', 'MYJIMAT');
define('WEB_NAME', 'myjimat.com');
define("CO_NAME","MYJIMAT");
define("PG_HEAD","WE-SHOPs - On-line Shopping Experience.");
define("PG_FOOT","© 2019 WeShop. All Rights Reserved || Design By Bitchips IT Division");
define('SYS_NAME', 'WE-SHOP');
define('CON_NO', '+600 0000 0000');
define('CON_EMAIL', 'info@bitchips.com');
define('CON_PERSON', 'MC');
define('ROOT', dirname(dirname(__FILE__)));
define('SITE_URL', 'http://localhost:81/mfh.tp/');


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ins";

$email_username = "info@myjimat.com";
$email_from_name = "MYJIMAT & Co";

$notification_email_1 = "test@gmail.com";
$notification_email_2 = "scgc2722@gmail.com";

$website_url = "https://www.bitchipsdirect.com/netbet/";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
    
}

?>