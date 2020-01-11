<?php
function getUserDetails($username, $conn){
    
    $sql = "SELECT * FROM members where m_id='".$username."'";
    
     $result = mysqli_query($conn, $sql);
    $res = mysqli_fetch_assoc($result);
    return $res;
    
}


function getUserDetailsbySession($username, $conn){
	$sql = "SELECT a.a_name, t.at_name, DATE_FORMAT(a.a_register_date, '%M %Y') as register_date FROM administrators a, admin_types t WHERE a.a_type = t.at_id AND a.a_username='".$username."'";
    $result = mysqli_query($conn, $sql);
	$res = mysqli_fetch_assoc($result);
	
	return $res;
}

function getOrderDetails($user_id, $conn){
    $sql = "SELECT * FROM orders WHERE user_id='".$user_id."'";
    $result = mysqli_query($conn, $sql);
    $res = mysqli_fetch_assoc($result);

    return $res;
}

function getorder_detail_by_order_id($order_id,$conn){
    
     

 $sql = "SELECT ors.order_id,ors.quantity,ors.itmspric,ors.itmcpric, DATE_FORMAT(ors.date, '%d/%m/%Y') as order_date, pp.main_img,pp.name as item_name, usr.user_name as username ,usr.user_id as user_id,ors.supplier_id,ors.status FROM orderitems ors INNER JOIN product pp ON pp.product_id = ors.itmky INNER JOIN user usr ON usr.user_id = ors.customer_id   where ors.order_id ='".$order_id."'";
 

$result = mysqli_query($conn, $sql);

 

return $result;


}

function getorder_detail_by_order_id_res($order_id,$conn){
    
     
 
 $sql2="select adr.add1, ors.ordno, ors.total,ors.payment_type,ors.status from delivery_addresses adr INNER JOIN orders ors on ors.delivery_add_id=adr.id  where ors.id ='".$order_id."'";

$addrs_res=mysqli_query($conn, $sql2);

$res_addr=mysqli_fetch_assoc($addrs_res);


 

return $res_addr;


}

function cu_detail_by_order_id($order_id,$conn){
    
     
 $sql2="select adr.add1, ors.ordno, ors.total,ors.payment_type,ors.status from delivery_addresses adr INNER JOIN orders ors on ors.delivery_add_id=adr.id  where ors.id ='".$order_id."'";
 
$addrs_res=mysqli_query($conn, $sql2);
 
$res_addr=mysqli_fetch_assoc($addrs_res);

 return $res_addr;
}

function getUseridbyUsername($username, $conn){
	
	$sql = "SELECT user_id FROM user WHERE user_name='".$username."'";
    $result = mysqli_query($conn, $sql);
	$res = mysqli_fetch_assoc($result);
	
	return $res['user_id'];
}

    function getOrderItems($orderId, $conn){

        $sql = "SELECT * FROM orderitems WHERE order_id='".$orderId."'";
        $result = mysqli_query($conn, $sql);
        $res = mysqli_fetch_assoc($result);

return $res;


}

function getUsernamebyUserid($userid, $conn){
	
	$sql = "SELECT a_username FROM administrators WHERE a_id='".$userid."'";
    $result = mysqli_query($conn, $sql);
	$res = mysqli_fetch_assoc($result);
	
	return $res['a_username'];
}

function getMemberUsernamebyUserid($userid, $conn){
    
        
	if($userid>0){
	$sql = "SELECT m_name FROM members WHERE m_id='".$userid."'";
        $result = mysqli_query($conn, $sql);
	$res = mysqli_fetch_assoc($result);
	
	return $res['m_name'];
        }
        else{
            return "noresult";
        }
}

function getMemberUplinePackage($userid, $mlevel, $conn){

	$sql = "SELECT m.m_upline FROM members m WHERE m.m_id='".$userid."'";
	$result = mysqli_query($conn, $sql);
	$res = mysqli_fetch_assoc($result);
	
	$uplineid = $res['m_upline'];
        
	$package_details = getMemberpackage($uplineid, $mlevel, $conn);
	
	$bonus['upline'] = $uplineid;
	$bonus['member_package'] = $package_details['mp_id'];
	$bonus['package_percent'] = $package_details['level_percent'];
	
	return $bonus;
}

function getMemberpackage($userid, $level, $conn){
	$main_account = totalMainAccount($userid, false, $conn);
	//echo $main_account;
        $member_level = "mp_referal_".$level;
	
	$sql = "SELECT mp_id, ROUND(".$member_level.", 2) as level_percent FROM member_package mp WHERE mp_price_dollar <= '".$main_account."' ORDER BY mp_price_dollar DESC LIMIT 1";
	$result = mysqli_query($conn, $sql);
	$current_package = mysqli_fetch_assoc($result);
	
        
	return $current_package;
}

function totalMainAccount($userid, $with_expiry, $conn){
	$today = date('Y-m-d');
	// gp deposit
        $sql = "SELECT ROUND(SUM(md.md_actual_amount),2) as total_deposit FROM member_deposit md WHERE md.md_depost_type= '1' and md.md_status = '0' AND md.md_member = '".$userid."'";
	if($with_expiry){
		$sql .= " AND md.md_expiry > '".$today."'";
	}
    //    echo $sql;
	$result = mysqli_query($conn, $sql);
	$res = mysqli_fetch_assoc($result);
	$total_deposit_gp = $res['total_deposit'];
        
        // normal deposit
	$sql = "SELECT ROUND(SUM(md.md_actual_amount),2) as total_deposit FROM member_deposit md WHERE md.md_status = '1' AND md.md_member = '".$userid."'";
	if($with_expiry){
		$sql .= " AND md.md_expiry > '".$today."'";
	}
      
	$result = mysqli_query($conn, $sql);
	$res = mysqli_fetch_assoc($result);
	$total_deposit = $res['total_deposit'];
	
	$sqlr = "SELECT ROUND(SUM(md.md_rewards_amount),2) as total_rewards FROM member_deposit md WHERE md.md_status = '1' AND md.md_member = '".$userid."'";
	if($with_expiry){
		$sqlr .= " AND md.md_expiry > '".$today."'";
	}
	$resultr = mysqli_query($conn, $sqlr);
	$resr = mysqli_fetch_assoc($resultr);
	$total_rewards = $resr['total_rewards'];
	
	$main_account = $total_deposit_gp+$total_deposit + $total_rewards;
	
	return $main_account;
}

function wallet_1($userid, $conn){
        
         $sql_get_raws="select * from lottomaster";
         $result_raws = mysqli_query($conn, $sql_get_raws);
	$res_raws = mysqli_fetch_assoc($result_raws);
	$raws = $res_raws ['total_deposit'];
         
        // normal deposit
	$sql = "SELECT ROUND(SUM(md.md_actual_amount),2) as total_deposit FROM member_deposit md WHERE md.md_status = '1' AND md.md_member = '".$userid."'";
	
	$result = mysqli_query($conn, $sql);
	$res = mysqli_fetch_assoc($result);
	$total_deposit = $res['total_deposit'];
	
        
        //lotto withdraw
        $sql_lotto="select sum(amt) as amt from lottoqry group by master_id and usrid='".$userid."'";
	$result_lotto = mysqli_query($conn, $sql_lotto);
        $lotto_tot= mysqli_fetch_assoc($result_lotto);
        $total_lotto=$lotto_tot['amt'];
        
                
        $sql_transfer="select sum(member_transfer.mt_amount) as tr_amount from member_transfer where mt_type=1 and mt_member_id='".$userid."'";
        $result_transfer = mysqli_query($conn, $sql_transfer);
	$row_transfer = mysqli_fetch_assoc($result_transfer);
        
        
	$bonus_transfer = $row_transfer['tr_amount'];
        
        
	$main_account =($bonus_transfer+ $total_deposit)-$total_lotto;
	
	return $main_account;
}

function totalTopup($userid, $with_expiry, $conn){
	$today = date('Y-m-d');
	
	$sql = "SELECT ROUND(SUM(md.md_actual_amount),2) as total_deposit FROM member_deposit md WHERE md.md_status = '1' AND md.md_type = 'Topup' AND md.md_member = '".$userid."'";
	if($with_expiry){
		$sql .= " AND md.md_expiry > '".$today."'";
	}
	$result = mysqli_query($conn, $sql);
	$res = mysqli_fetch_assoc($result);
	$total_deposit = $res['total_deposit'];
	
	return $total_deposit;
}

function bonusPaid($member_id, $conn){
	
	$sql = "SELECT SUM(rb_bonus_amount) as bonus_today FROM member_referal_bonus WHERE rb_bonus_paid_to = '".$member_id."'";
	
        $result = mysqli_query($conn, $sql);
	$row = mysqli_fetch_assoc($result);
	$bonus_today = $row['bonus_today'];
	
        
        $sql_transfer="select sum(member_transfer.mt_amount) as tr_amount from member_transfer where mt_type=1 and mt_member_id='".$member_id."'";
        $result_transfer = mysqli_query($conn, $sql_transfer);
	$row_transfer = mysqli_fetch_assoc($result_transfer);
        
        
	$bonus_transfer = $row_transfer['tr_amount'];
        
        $final_amount=$bonus_today-$bonus_transfer;
	return   $final_amount;
}

function dividendPaid($member_id, $conn){
	
	$sql = "SELECT SUM(rb_bonus_amount) as bonus_today FROM member_referal_bonus WHERE  rb_bonus_paid_to = '".$member_id."'";
	$result = mysqli_query($conn, $sql);
	$row = mysqli_fetch_assoc($result);
	$bonus_today = $row['bonus_today'];
	
	return $bonus_today;
}

function payBonusMember($rb_deposit_by, $member_id, $rb_level, $rb_deposit_amount, $rb_deposit_id, $conn){
	
          echo  'hihihhihi';
                                exit();
	$package_level = getMemberUplinePackage($member_id, $rb_level, $conn);
	
	$rb_bonus_paid_to = $package_level['upline'];
        $rb_percent = $package_level['package_percent'];
        echo $rb_percent ;
        exit();
	
	
	$member_mainaccount = totalMainAccount($rb_bonus_paid_to, true, $conn);
	$member_topup = totalTopup($rb_bonus_paid_to, true, $conn);
	$member_total = $member_mainaccount - $member_topup; // Pay Bonus only if the member buy a package and not for top-up
	
	$today = date('Y-m-d H:i:s');
	$bonus_paid_today = bonusPaid($rb_bonus_paid_to, $today, $conn);
	
	/* // Removed based on request on 7th Aug 2018 & new code added below
	if($member_total > 0){
		if($member_mainaccount >= $bonus_paid_today){
			$current_bonus_amount = ($rb_deposit_amount * $rb_percent)/100;
			$bonus_tobe_paid_today = $bonus_paid_today + $current_bonus_amount;
			if($bonus_tobe_paid_today > $member_mainaccount){
				$rb_bonus_amount = $member_mainaccount - $bonus_paid_today;
				$rb_bonus_message = 'excess bonus today';
			} else {
				$rb_bonus_amount = $current_bonus_amount;
				$rb_bonus_message = 'exact bonus';
			}
		} else {
			$rb_bonus_amount = '0.00';
			$rb_bonus_message = 'no bonus';
		}
	} else {
		$rb_bonus_amount = '0.00';
		$rb_bonus_message = 'no package';
	}
	*/
	
	//New code added
	if($member_total > 0){
		$current_bonus_amount = ($rb_deposit_amount * $rb_percent)/100;
		$rb_bonus_amount = $current_bonus_amount;
		$rb_bonus_message = 'exact bonus';
	} else {
		$rb_bonus_amount = '0.00';
		$rb_bonus_message = 'no package';
	}
	
	
	if(($rb_bonus_paid_to > 0) && ($rb_bonus_paid_to != '') ){
		$sql_bonus = "INSERT INTO member_referal_bonus(rb_deposit_amount, rb_deposit_id, rb_deposit_by, rb_level, rb_bonus_amount, rb_bonus_message, rb_bonus_paid_to, rb_percent, rb_date, rb_status) VALUES ('".$rb_deposit_amount."', '".$rb_deposit_id."', '".$rb_deposit_by."', '".$rb_level."', '".$rb_bonus_amount."', '".$rb_bonus_message."', '".$rb_bonus_paid_to."', '".$rb_percent."', '".$today."', '1')"; 
		mysqli_query($conn, $sql_bonus);
		return $rb_bonus_paid_to;
	}	
}

function totalBonusMember($member_id, $conn){
	
	$sql = "SELECT ROUND(SUM(rb_bonus_amount), 2) as bonus_amount FROM member_referal_bonus WHERE rb_bonus_paid_to = '".$member_id."'";
	$result = mysqli_query($conn, $sql);
	$row = mysqli_fetch_assoc($result);
	$bonus_amount = $row['bonus_amount'];
	var_dump($sql);
	return $bonus_amount;
}

function totalBonusAdmin($adminid, $admintype, $conn){
	if($admintype == 'supermaster'){
		$where_condition = "1=1";
	} else if($admintype == 'master'){
		$where_condition = "m.m_master_by = '".$adminid."'";
	} else if($admintype == 'admin'){
		$where_condition = "m.m_admin_by = '".$adminid."'";
	} else if($admintype == 'reseller'){
		$where_condition = "m.m_reseller_by = '".$adminid."'";
	}
	$sql = "SELECT ROUND(SUM(rb.rb_bonus_amount), 2) as bonus_total FROM members m
			INNER JOIN member_referal_bonus rb ON m.m_id = rb.rb_bonus_paid_to
			WHERE ".$where_condition;
	$result = mysqli_query($conn, $sql);
	$row = mysqli_fetch_assoc($result);
			
	$bonus_total = $row['bonus_total'];
	
	return $bonus_total;
}

function totalMainAccountReseller($adminid, $conn){
	
	$sql_fund = "SELECT ROUND(SUM(rf_amount), 2) as rf_amount FROM reseller_fund WHERE rf_reseller_id = '".$adminid."'";
	$result_fund = mysqli_query($conn, $sql_fund);
	$row_fund = mysqli_fetch_assoc($result_fund);
	
	$sql_deposit = "SELECT ROUND(SUM(md.md_actual_amount), 2) as  md_actual_amount FROM members m
					INNER JOIN member_deposit md ON md.md_member = m.m_id
					WHERE m.m_reseller_by = '".$adminid."'";
	$result_deposit = mysqli_query($conn, $sql_deposit);
	$row_deposit = mysqli_fetch_assoc($result_deposit);
	
	$reseller_main_account = $row_fund['rf_amount'] - $row_deposit['md_actual_amount'];
	return $reseller_main_account;
}

function dateDifference($fromDt, $toDt){
	
	$fromdate = new DateTime($fromDt);
	$todate = new DateTime($toDt);
	$date1=date_create($fromdate->format('Y-m-d'));
	$date2=date_create($todate->format('Y-m-d'));
	$diff=date_diff($date1,$date2);
	$timeDiff = $diff->format("%R%a");

	return $timeDiff;
}

function countPendingDeposit($conn){
	
	$sql_deposit = "SELECT COUNT(md_id) as pending_deposit FROM member_deposit WHERE md_status = '0'";
	$result_deposit = mysqli_query($conn, $sql_deposit);
	$row_deposit = mysqli_fetch_assoc($result_deposit);
	
	return $row_deposit['pending_deposit'];
}

function countPendingWithdraw($conn){
	
	$sql_withdraw = "SELECT COUNT(mw_id) as pending_withdraw FROM member_withdraw WHERE mw_status = '0'";
	$result_withdraw = mysqli_query($conn, $sql_withdraw);
	$row_withdraw = mysqli_fetch_assoc($result_withdraw);
	
	return $row_withdraw['pending_withdraw'];
}

function getMasterbyAdminid($conn, $adminid){
	
	$sqlmaster = "SELECT a_master_by FROM administrators WHERE a_id = '".$adminid."'";
	$resultmaster = mysqli_query($conn, $sqlmaster);
	$rowmaster = mysqli_fetch_assoc($resultmaster);
	
	return $rowmaster['a_master_by'];
}

function getProductImage1($conn,$itemID)
{
    $sqlItemList="SELECT img1 FROM itmmastbl where itmnm = '".$itemID."'";
    $resultImage1 = mysqli_query($conn,$sqlItemList);
    $rowmaster = mysqli_fetch_assoc($resultImage1);
	
    return $rowmaster['img1'];
}

function post_referal($ordid)
{
     if(1==1)
                                            {
                                                $sql_lstrec = "SELECT @@IDENTITY AS recid";
                                                $resultlst = mysqli_query($conn, $sql_lstrec);
                                                $rowlr = mysqli_fetch_assoc($resultlst);
                                                $md_id = $rowlr['recid'];


                                                if($md_id!=0){

                                                        $sql_deposit = "SELECT md_id, md_member, md_actual_amount, md_rewards_amount, md_type FROM member_deposit WHERE  md_id ='".$md_id."'";
                                                        $result = mysqli_query($conn, $sql_deposit);
                                                        $row = mysqli_fetch_assoc($result);

    //                                                    var_dump($sql_deposit);
                                                        if($row['md_member'] != ''){
                                                                $member_1 = $row['md_member'];
                                                                $deposit_amount = $row['md_actual_amount'];
                                                                $deposit_id = $row['md_id'];
                                                                $deposit_type = $row['md_type'];
                                                                $rewards_amount = $row['md_rewards_amount'];
                                                                $total_amount = $deposit_amount + $rewards_amount;

                                                                if($deposit_type == 'Renew'){
                                                                        $sqlthawed = "INSERT INTO member_deposit_renew(mdr_desposit_id, mdr_member_id, mdr_amount) VALUES('".$md_id."', '".$member_1."', '".$total_amount."')";
                                                                        mysqli_query($conn, $sqlthawed);
                                                                }


                                                             //$member_level_2 = payBonusMember($m member_1, $member_1, '1', $deposit_amount, $deposit_id, $conn);


                                                                if($member_level_2 != ''){
                                                                        $member_level_3 = payBonusMember($member_1, $member_level_2, '2', $deposit_amount, $deposit_id, $conn);

                                                                        if($member_level_3 != ''){
                                                                                $member_level_4 = payBonusMember($member_1, $member_level_3, '3', $deposit_amount, $deposit_id, $conn);

                                                                                if($member_level_4 != ''){
                                                                                        $member_level_5 = payBonusMember($member_1, $member_level_4, '4', $deposit_amount, $deposit_id, $conn);

                                                                                        if($member_level_5 != ''){
                                                                                                $member_level_6 = payBonusMember($member_1, $member_level_5, '5', $deposit_amount, $deposit_id, $conn);

                                                                                                if($member_level_6 != ''){
                                                                                                        $member_level_7 = payBonusMember($member_1, $member_level_6, '6', $deposit_amount, $deposit_id, $conn);

                                                                                                        if($member_level_7 != ''){
                                                                                                                $member_level_8 = payBonusMember($member_1, $member_level_7, '7', $deposit_amount, $deposit_id, $conn);

                                                                                                                if($member_level_8 != ''){
                                                                                                                        $member_level_9 = payBonusMember($member_1, $member_level_8, '8', $deposit_amount, $deposit_id, $conn);

                                                                                                                        if($member_level_9 != ''){
                                                                                                                                $member_level_10 = payBonusMember($member_1, $member_level_9, '9', $deposit_amount, $deposit_id, $conn);

                                                                                                                                if($member_level_10 != ''){
                                                                                                                                        $member_level_11 = payBonusMember($member_1, $member_level_10, '10', $deposit_amount, $deposit_id, $conn);

                                                                                                                                        if($member_level_11 != ''){
                                                                                                                                                $member_level_12 = payBonusMember($member_1, $member_level_11, '11', $deposit_amount, $deposit_id, $conn);

                                                                                                                                                if($member_level_12 != ''){
                                                                                                                                                        $member_level_13 = payBonusMember($member_1, $member_level_12, '12', $deposit_amount, $deposit_id, $conn);

                                                                                                                                                        if($member_level_13 != ''){
                                                                                                                                                                $member_level_14 = payBonusMember($member_1, $member_level_13, '13', $deposit_amount, $deposit_id, $conn);

                                                                                                                                                                if($member_level_14 != ''){
                                                                                                                                                                        $member_level_15 = payBonusMember($member_1, $member_level_14, '14', $deposit_amount, $deposit_id, $conn);

                                                                                                                                                                        if($member_level_15 != ''){
                                                                                                                                                                                $member_level_16 = payBonusMember($member_1, $member_level_15, '15', $deposit_amount, $deposit_id, $conn);

                                                                                                                                                                                if($member_level_16 != ''){
                                                                                                                                                                                        $member_level_17 = payBonusMember($member_1, $member_level_16, '16', $deposit_amount, $deposit_id, $conn);

                                                                                                                                                                                        if($member_level_17 != ''){
                                                                                                                                                                                                $member_level_18 = payBonusMember($member_1, $member_level_17, '17', $deposit_amount, $deposit_id, $conn);

                                                                                                                                                                                                if($member_level_18 != ''){
                                                                                                                                                                                                        $member_level_19 = payBonusMember($member_1, $member_level_18, '18', $deposit_amount, $deposit_id, $conn);

                                                                                                                                                                                                        if($member_level_19 != ''){
                                                                                                                                                                                                                $member_level_20 = payBonusMember($member_1, $member_level_19, '19', $deposit_amount, $deposit_id, $conn);

                                                                                                                                                                                                                if($member_level_20 != ''){
                                                                                                                                                                                                                        $member_level_21 = payBonusMember($member_1, $member_level_20, '20', $deposit_amount, $deposit_id, $conn);

                                                                                                                                                                                                                        if($member_level_21 != ''){
                                                                                                                                                                                                                                payBonusMember($member_1, $member_level_21, '21', $deposit_amount, $deposit_id, $conn);
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                }
                                                                                                                                                                                                        }
                                                                                                                                                                                                }
                                                                                                                                                                                        }
                                                                                                                                                                                }
                                                                                                                                                                        }
                                                                                                                                                                }
                                                                                                                                                        }
                                                                                                                                                }
                                                                                                                                        }
                                                                                                                                }
                                                                                                                        }
                                                                                                                }
                                                                                                        }
                                                                                                }
                                                                                        }
                                                                                }
                                                                        }
                                                                }

                                                        }

                                                }
                                                //end referal bonus
                                            }        

}



function totalGPMainAccount($userid, $with_expiry, $conn, $trading = true){
	$today = date('Y-m-d');
	
        $sql = "SELECT ROUND(SUM(md.md_actual_amount),2) as total_deposit FROM member_deposit md WHERE md_depost_type='1' and md.md_status = '1' AND md.md_member = '".$userid."'";
	if($with_expiry){
	//	$sql .= " AND md.md_expiry > '".$today."'";
	}
        
      //  var_dump($sql);
	$result = mysqli_query($conn, $sql);
	$res = mysqli_fetch_assoc($result);
	$total_gp = $res['total_deposit'];
        
        
//        $sql1 = "SELECT ROUND(SUM(md.md_actual_amount),2) as total_deposit FROM member_deposit md WHERE md_depost_type='2' and md.md_status = '1' AND md.md_member = '".$userid."'";
//	
//	$result1 = mysqli_query($conn, $sql1);
//	$res1 = mysqli_fetch_assoc($result1);
//	$total_gp_dp = $res1['total_deposit'];
        
        
//	$sql = "SELECT ROUND(SUM(md.md_actual_amount),2) as total_deposit FROM member_deposit md WHERE md.md_status = '1' AND md.md_member = '".$userid."'";
//	if($with_expiry){
//		$sql .= " AND md.md_expiry > '".$today."'";
//	}
//	$result = mysqli_query($conn, $sql);
//	$res = mysqli_fetch_assoc($result);
//	$total_deposit = $res['total_deposit'];
//	
//	$sqlr = "SELECT ROUND(SUM(md.md_rewards_amount),2) as total_rewards FROM member_deposit md WHERE md.md_status = '1' AND md.md_member = '".$userid."'";
//	if($with_expiry){
//		$sqlr .= " AND md.md_expiry > '".$today."'";
//	}
//	$resultr = mysqli_query($conn, $sqlr);
//	$resr = mysqli_fetch_assoc($resultr);
//	$total_rewards = $resr['total_rewards'];
//	
//	if($with_expiry){
//		$total_renew = 0;
//	} else {
//		$sqlrenew = "SELECT ROUND(SUM(md.md_actual_amount),2) as total_renew FROM member_deposit md WHERE md.md_type = 'Renew' AND md.md_status IN(0,2) AND md.md_member = '".$userid."'";
//		$resultrenew = mysqli_query($conn, $sqlrenew);
//		$resrenew = mysqli_fetch_assoc($resultrenew);
//		$total_renew = $resrenew['total_renew'];
//	}
//	
//	$sqltransfer = "SELECT ROUND(SUM(mt_amount), 2) as transfer_amount FROM member_transfer WHERE mt_member_id = '".$userid."' AND mt_status = '1'";
//	$resulttransfer = mysqli_query($conn, $sqltransfer);
//	$rowtransfer = mysqli_fetch_assoc($resulttransfer);
//	$transfer_amount = $rowtransfer['transfer_amount'];
//	
//	//Subtract
//	if($trading){
//		$sqltr = "SELECT ROUND(SUM(mt_amount), 2) as trading_amount FROM member_trading WHERE mt_member = '".$userid."' AND mt_status IN (0,1) AND mt_delete = '0'";
//		$resulttr = mysqli_query($conn, $sqltr);
//		$rowtr = mysqli_fetch_assoc($resulttr);
//		$trading_amount = $rowtr['trading_amount'];
//	} else {
//		$trading_amount = 0;
//	}
//	 $sqlgfundbonus = "SELECT (SUM(mgft_amount)) as mgft_amount FROM member_gf_transfer WHERE mgft_member_id = '".$userid."' AND mgft_status = '1'";
//	$resultgfb = mysqli_query($conn, $sqlgfundbonus);
//	$rowgfb = mysqli_fetch_assoc($resultgfb);
//	$gfb_amount = $rowgfb['mgft_amount'];
        
        
	$gp_main_account = ($total_gp)-(0);
	
	return number_format((float)$gp_main_account, 2, '.', '');
}



function validateOTP($memberid, $otp, $conn){
	 
	$sql = "SELECT m_otp FROM members WHERE m_id = '".$memberid."'"; 
	$result = mysqli_query($conn, $sql);
	$row = mysqli_fetch_assoc($result);
	$m_otp = $row['m_otp'];
	$num_a=(int)$otp;
        $num_b=(int)$m_otp;
        
	if ($num_a==$num_b) {
          
		return true;
	} else {
		return false;
	}
}

function get_lotto_info($lotto_draw_no){
    
    $sql="select * from lottoconfig where drawno='".$lotto_draw_no."'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    return $row;
}

?>