<?php
include_once './header.php';
include_once './sidebar.php';
include_once 'data/members_add_data.php';
include_once 'data/functions.php';
include_once 'data/database.php';


if (!empty($_GET['error'])) {
    $error = $_GET['error'];
} else {
    $error = '';
}


if ($error == 2) {
    echo '<script>  swal("Sucessfully Updated", "Please Navigate to Exit", "success");</script>';
}

if ($error == 4) {
    echo '<script>  swal("Nothing  Updated", "Please check", "warning");</script>';
}


?>

<!-- Content Wrapper. Contains page content -->
<div class="page-wrapper">



    <div class="row page-titles">
        <div class="col-md-5 align-self-center">
            <h3 class="text-primary" style="text-transform: uppercase;"><?= $m_type ?> Details</h3>
        </div>
        <div class="col-md-7 align-self-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)"><?= $m_type ?> Group</a></li>
                <li class="breadcrumb-item active"><?= $row['m_type'] ?> Detail</li>
            </ol>
        </div>
    </div>


    <div class="col-lg-12">



        <div class="box-body">
            <div class="card">

                <div class="card-title">

                    <?php if ($user_id != '') {


                        echo '<h2>Update ' . $row['m_type'] . '</h2>';
                    } else {

                        echo '<h2>Add New ' . $m_type . '</h2>';
                    }

                    ?>


                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">


                            <div class="box-body">

                                <?php if ($error != '') { ?>
                                    <div class="row">
                                        <div class="col-md-12 col-md-12" id="error_display">
                                            <?php

                                            if ($error == '2') {
                                                echo "Please fill-in all the required fields";
                                            } else if ($error == '1') {
                                                echo "Username already registered ";
                                            } else if ($error == '3') {
                                                echo "Username can only be alphabets & numbers ";
                                            } else if ($error == '4') {
                                                echo "Please upload only image file";
                                            }

                                            ?>
                                        </div>
                                    </div>
                                <?php } ?>

                                <?php
                                if ($user_id != '') { ?>
                                    <form action="data/register_company.php" class="templatemo-login-form" method="post" enctype="multipart/form-data" name="update_members">
                                        <input type="hidden" name="id" value="<?php echo $user_id; ?>">
                                        <input type="hidden" name="action" value="update">

                                    <?php } else {  ?>


                                        <form action="data/register_company.php" class="templatemo-login-form" method="post" enctype="multipart/form-data" name="update_members">
                                            <input type="hidden" name="action" value="register">
                                            <input type="hidden" name="m_type" value="<?= $m_type ?>">
                                        <?php } ?>
                                        <div class="row form-group">
                                            <div class="col-lg-6 col-md-6 form-group">
                                                <div class="user_image">
                                                    <?php if ($row['cp_logo'] == '') { ?>
                                                        <img name="cp_logo" id="profile_image" src="../uploads/profile/avt.png" class="img-circle profile_image" style="max-height:150px;width:auto">
                                                    <?php } else { ?>
                                                        <img name="cp_logo" id="profile_image" src="../uploads/profile/<?= $row['cp_logo']; ?>" class="img-circle profile_image" style="max-height:150px;width:auto">
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="input-group">

                                            <input type="file" name="company_logo" id="company_logo" class="form-control" placeholder="Username" aria-describedby="inputGroupPrepend" style="display: none;align-content: center" />
                                            <input type="button" style="width: 100px" value="Browse" id="browse_image" class="btn btn-block btn-success" />

                                        </div>
                                        <br>

                                        <div class="row form-group">
                                            <div class="col-lg-6 col-md-6 form-group">
                                                <label>Company Name :</label>
                                                <input type="text" class="form-control" id="cp_name" placeholder="Company Name" name="cp_name" value="<?php echo $row['cp_name']; ?>" title="Enter a valid Name">
                                            </div>

                                            <div class="col-lg-6 col-md-6 form-group">
                                                <label>Company Address :</label>
                                                <input type="text" class="form-control" id="cp_address" placeholder="Address" name="cp_address" value="<?php echo $row['cp_address']; ?>" title="Enter a valid Address">
                                            </div>

                                            <div class="col-lg-6 col-md-6 form-group">
                                                <label>Company Registered Day :</label>
                                                <input type="<?php if ($row['m_id'] == '') {
                                                                    echo "date";
                                                                } else {
                                                                    echo "text";
                                                                } ?>" class="form-control date" id="cp_registter_day" placeholder="YYYY-MM-DD" name="cp_registter_day" value="<?php echo $row['cp_registter_day']; ?>">
                                            </div>

                                            <div class="col-lg-6 col-md-6 form-group">
                                                <label>Company Phone :</label>

                                                <input type="text" class="form-control" id="cp_phone" placeholder="Phone" name="cp_phone" value="<?php echo $row['cp_phone']; ?>">
                                            </div>

   

                                        </div>


                                        <div class="row form-group">
                                            <div class="col-lg-3 col-md-3 form-group">
                                                <?php if ($row['id'] != '') { ?>
                                                    <button type="submit" class="btn btn-block btn-success">Update Now</button>
                                                <?php } else { ?>
                                                    <button type="submit" class="btn btn-block btn-danger">Add New</button>
                                                <?php } ?>
                                            </div>

                                            <div class="col-lg-3 col-md-3 form-group">
                                                <button type="reset" class="btn btn-block btn-warning">Reset</button>
                                            </div>


                                        </div>


                                        </form>
                            </div>

                        </div>



                    </div>



                </div>
            </div>
        </div>

        <script>
            $('#browse_image').on('click', function(e) {

                $('#company_logo').click();
            })
            $('#company_logo').on('change', function(e) {
                var fileInput = this;
                if (fileInput.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#profile_image').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(fileInput.files[0]);
                }
            });
        </script>


    </div>



    <?php

    require_once 'footer.php';


    ?>