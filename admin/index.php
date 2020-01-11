<?php 
session_start();
include_once './top_header.php';
include_once 'data/database.php';


if (isset($_GET['error'])) {
    $error = $_GET['error']; 
} else {
   $error = ''; 
}

?>



<body class="header-fix fix-sidebar">
    
    <!-- Main wrapper  -->
    <div id="main-wrapper">

        <div class="unix-login">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <div class="login-content card">
                            <div class="login-form">
                                <h4>System Login</h4>
                                  <div class="col-lg-4 col-md-4">
                                      
                                   

                                    <?php if($success != '') { ?>
                                            <div class="row">
                                                <div id="success_display" align="center">
                                                <?php

                                                if($success == '1'){
                                                    echo $lang['LOGIN_SUCCESS_1'];
                                                } else if($success == '2'){
                                                        echo $lang['LOGIN_SUCCESS_2'];
                                                } else if($success == '3'){
                                                        echo $lang['LOGIN_SUCCESS_3'];
                                                }

                                                ?>
                                                </div>
                                            </div>
                                    <?php } ?>
                                    </div>  
                                     <div id="error_display" class="text-center text-danger">
                                            <?php

                                            if($error == '0'){
                                                echo "Please fill-in the Username and Password";
                                            } else if($error == '1'){
                                            echo "Invalid Username /Password/User Type or Account not Active. Please contact the Administrator"; 
                                            } else if($error == '3'){
                                                echo "Users loging restricted"; 
                                            } else if($error == '2'){
                                                echo "Incorrect Password"; 
                                            } 

                                            ?>
                                        </div>
                                <form id="fmlogin" name="frmlogin" action="data/login_data.php" method="post">
                                    
                                    
                                    
                                    <div class="form-group">
                                        <label>User Name</label>
                                        <input type="text"   id="user_name" name="user_name" class="form-control" placeholder="User Name" required >
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password"  id="user_pass" name="user_pass" class="form-control" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Select User Type</label>
                             
                                            <select class="form-control" name="user_type" id="user_type">
                                                      <?php                                                             
                                                         $database->loadAllUsersType(2);
                                                      ?>
                                           </select>

                                        
                                    </div>

                                    <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">Sign in</button>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

                <!-- footer -->
<?= include_once './footer.php'; ?>    