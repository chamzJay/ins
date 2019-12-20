<?php 

include_once './top_header.php';


if (isset($_GET['error'])) {
    $error = $_GET['error']; 
} else {
   $error = ''; 
}

if(isset($_GET['act'])){
    $act= $_GET['act'];
    
}else{
    $act='';
}

if($act=='ok'){
   echo '<script>  swal("Sucessfully Activated", "Please Update your account info", "success");</script>';
    // echo '<script> alert("ok");</script>';
}

if($error=='1'){
 // echo '<script>  swal("Please Proceed to Login", "View Your Account", "warning");</script>';
echo '<script> alert("User Id not register");</script>';
}


if($error=='2'){
  echo '<script>  swal("Please Contact Admin", "activate your account", "warning");</script>';

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
                                <form id="fmlogin" name="frmlogin" action="data/login_data.php" method="post">
                                    
                                    
                                    
                                    <div class="form-group">
                                        <label>User Name</label>
                                        <input type="text"   id="user_name" name="user_name" class="form-control" placeholder="User Name">
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password"  id="user_pass" name="user_pass" class="form-control" >
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
    <!-- End Wrapper -->

    <!-- All Jquery -->
    <script src="js/lib/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="js/lib/bootstrap/js/popper.min.js"></script>
    <script src="js/lib/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>

</body>

</html>