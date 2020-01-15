<?php
include_once '../../conn.php';
include_once 'functions.php';

//Fetching Values from URL
$company_id                      = $_POST['id'];
$company_name                    = $_POST['cp_name'];
$company_registered_day          = $_POST['cp_registter_day'];
$company_phone                   = $_POST['cp_phone'];
$company_address                 = $_POST['cp_address'];
$company_status                  = 1;


//Action 
$action                     = $_POST['action'];


//Other Data 
if ($_SESSION['master'] != '') {
    $register_by = $_SESSION['master'];
} else if ($_SESSION['supermaster'] != '') {
    $register_by = $_SESSION['supermaster'];
} else if ($_SESSION['admin'] != '') {
    $register_by = $_SESSION['admin'];
} else {
    $register_by = $_SESSION['reseller'];
}





// image location 
$target_dir = "../../uploads/logo/";



if ($action == 'register') {


    if (basename($_FILES["company_logo"]["name"]) != '') {

        $m_img = $target_dir . reSize($_FILES['company_logo']['tmp_name'], $_FILES['company_logo']['name'], 1);
    } else {

        $m_img = '';
    }


    if ($company_name != '') {

        
        $sqlcheck="SELECT * FROM company WHERE cp_name='".$cp_name."'";
        $result = mysqli_query($conn, $sqlcheck);

        $sql = "INSERT INTO company (cp_name,cp_logo,cp_registter_day,cp_phone,cp_address,cp_status) VALUES ('" . $company_name . "','" . $m_img . "','" . $company_registered_day . "', '" . $company_phone . "', '" . $company_address . "', '" . $company_status . "')";

        mysqli_query($conn, $sql);
        // header('Location: ../company_list.php?type=' . $m_type . '&error=5');
    } else {
        header('Location: ../company_add.php?error=2');
    }
} elseif ($action == 'update') {

    //=================================================================================================



    if (($_FILES["company_logo"]["name"]) != '') {


        $target_user_image = $target_dir . basename($_FILES["company_logo"]["name"]);
        $uploadFileType_user_image = pathinfo($target_user_image, PATHINFO_EXTENSION);
        $newfilename_user_image = round(microtime(true)) . UniqueRandomNumbersWithinRange(0, 100, 1)[0] . '.' . $uploadFileType_user_image;

        if (basename($_FILES["company_logo"]["name"]) != '') {
            if ($uploadFileType_user_image != "jpg" && $uploadFileType_user_image != "png" && $uploadFileType_user_image != "jpeg" && $uploadFileType_user_image != "gif" && $uploadFileType_user_image != "JPG" && $uploadFileType_user_image != "PNG" && $uploadFileType_user_image != "JPEG" && $uploadFileType_user_image != "GIF") {
                $fail = "1";
            } else {
                $fail = "0";
            }
        }
        move_uploaded_file($_FILES["company_logo"]["tmp_name"], $target_dir . $newfilename_user_image);

        $user_pic = $newfilename_user_image;

        $sql = "UPDATE members SET m_pic='" . $user_pic . "' WHERE m_id='" . $user_id . "'";


        if (mysqli_query($conn, $sql)) {
            $error = 2;
        } else {
            $error = 1;
        }
    }



    //===================================================================================================


    if ($company_name != '') {

        $sql = "update company set  cp_name='" . $company_name . "'where id='" . $company_id . "'";
        mysqli_query($conn, $sql);
    }

    if ($company_registered_day != '') {

        $sql = "update company set  cp_registter_day='" . $company_registered_day . "'where id='" . $company_id . "'";
        mysqli_query($conn, $sql);
    }

    if ($company_phone != '') {

        $sql = "update company set  cp_phone='" . $company_phone . "'where id='" . $company_id . "'";
        mysqli_query($conn, $sql);
    }

    if ($company_address != '') {

        $sql = "update company set  cp_address='" . $company_address . "'where id='" . $company_id . "'";
        mysqli_query($conn, $sql);
    }

    if ($company_status != '') {

        $sql = "update company set  cp_status='" . $company_status . "'where id='" . $company_id . "'";
        mysqli_query($conn, $sql);
    }

    if ($error == '') {
        $error = 4;
    }


    header('Location: ../company_add.php?user_id=' . $user_id . '&error=' . $error);
}

function UniqueRandomNumbersWithinRange($min, $max, $quantity)
{
    $numbers = range($min, $max);
    shuffle($numbers);
    return array_slice($numbers, 0, $quantity);
}



function reSize($file, $var_file, $var_name)
{

    $sourceProperties = getimagesize($file);
    $fileNewName = time() . $var_name;
    $folderPath = "../../uploads/logo/";
    $ext = pathinfo($var_file, PATHINFO_EXTENSION);

    $imageType = $sourceProperties[2];

    switch ($imageType) {


        case IMAGETYPE_PNG:
            $imageResourceId = imagecreatefrompng($file);
            $targetLayer = imageResize($imageResourceId, $sourceProperties[0], $sourceProperties[1]);
            imagepng($targetLayer, $folderPath . $fileNewName . "." . $ext);
            break;


        case IMAGETYPE_GIF:
            $imageResourceId = imagecreatefromgif($file);
            $targetLayer = imageResize($imageResourceId, $sourceProperties[0], $sourceProperties[1]);
            imagegif($targetLayer, $folderPath . $fileNewName . "." . $ext);
            break;


        case IMAGETYPE_JPEG:
            $imageResourceId = imagecreatefromjpeg($file);
            $targetLayer = imageResize($imageResourceId, $sourceProperties[0], $sourceProperties[1]);
            imagejpeg($targetLayer, $folderPath . $fileNewName . "." . $ext);
            break;


        default:
            echo "Invalid Image type.";
            exit;
            break;
    }

    $file_save_as =  $fileNewName . "." . $ext;


    move_uploaded_file($folderPath.$file_save_as);

    return $file_save_as;
}





function imageResize($imageResourceId, $width, $height)
{


    $targetWidth = 500;
    $targetHeight = 500;


    $targetLayer = imagecreatetruecolor($targetWidth, $targetHeight);
    imagecopyresampled($targetLayer, $imageResourceId, 0, 0, 0, 0, $targetWidth, $targetHeight, $width, $height);


    return $targetLayer;
}
