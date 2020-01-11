<?php




session_start();
unset($_SESSION['master']);
unset($_SESSION['supermaster']);
unset($_SESSION['admin']); 
unset($_SESSION['reseller']);
unset($_SESSION['login']);

session_destroy();

header('Location: ../../index.php?logout=1');

?>

