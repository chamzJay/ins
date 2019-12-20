<?php
/*
 * Database
 * 
 * The Database class is meant to simplify the task of accessing
 * information from the website's database.
 *
 * Written by: Sasi
 * Last Updated: 2:06 PM 6/8/2010
 */
 

include_once '../../conn.php';
include_once '../../phpmailer/PHPMailerAutoload.php';


class MySQLDB
{
   var $connection;         //The MySQL database connection
   var $num_active_users;   //Number of active users viewing site
   var $num_active_guests;  //Number of active guests viewing site
   var $num_members;        //Number of signed-up users

   /* Class constructor */

   function MySQLDB(){
      /* Make connection to database */
      $this->connection = mysqli_connect(DB_SERVER, DB_USER, DB_PASS);
      mysqli_select_db($this->connection,DB_NAME ) ;
      
   }

   /**
    * confirmUserPass - Checks whether or not the given
    * username is in the database, if so it checks if the
    * given password is the same password in the database
    * for that user. If the user doesn't exist or if the
    * passwords don't match up, it returns an error code
    * (1 or 2). On success it returns 0.
    */

   function confirmUserPass($userid, $password){
      /* Add slashes if necessary (for query) */
      if(!get_magic_quotes_gpc()) {
	      $username = addslashes($userid);
      }
		
      /* Verify that user is in database */
      $q = "SELECT Pw FROM ".TBL_USERS." WHERE UsrId = '$userid'";
	  $result = mysqli_query($this->connection,$q );
      if(!$result || (mysqli_num_rows($result) < 1)){
		return 1; //Indicates username failure
      }

      /* Retrieve password from result, strip slashes */
      $dbarray = mysqli_fetch_array($result);
      $dbarray['Pw'] = ($dbarray['Pw']);
      $password = ($password);

      /* Validate that password is correct */
      if($password == $dbarray['Pw']){
		return 0; //Success! Username and password confirmed
      }
      else{
		 return 2; //Indicates password failure
		
      }
   }
   
   /**
    * confirmUserID - Checks whether or not the given
    * username is in the database, if so it checks if the
    * given userid is the same userid in the database
    * for that user. If the user doesn't exist or if the
    * userids don't match up, it returns an error code
    * (1 or 2). On success it returns 0.
    */

   function confirmUserID($username, $userid){
      /* Add slashes if necessary (for query) */
      if(!get_magic_quotes_gpc()) {
	      $username = addslashes($username);
      }

      /* Verify that user is in database */
	
      $q = "SELECT Usrid FROM ".TBL_USERS." WHERE UsrNm = '$username'";
      $result = mysqli_query($this->connection,$q );
      if(!$result || (mysqli_num_rows($result) < 1)){
         return 1; //Indicates username failure
      }

      /* Retrieve userid from result, strip slashes */
      $dbarray = mysqli_fetch_array($result);
      $dbarray['UsrId'] = $dbarray['UsrId'];
     // $userid = stripslashes($userid);
	
      /* Validate that userid is correct */
      if($userid == $dbarray['UsrId']){
         return 0; //Success! Username and userid confirmed
      }
      else{
		return 2; //Indicates userid invalid
      }
   }
   
   /**
    * getUserInfo - Returns the result array from a mysql
    * query asking for all information stored regarding
    * the given username. If query fails, NULL is returned.
    */

   function getUserInfo($userid){
      $q = "SELECT * FROM ".TBL_USERS." WHERE UsrId = '$userid'";
      $result = mysqli_query($this->connection ,$q );
      /* Error occurred, return given name by default */
      if(!$result || (mysqli_num_rows($result) < 1)){
		 return NULL;
      }
      /* Return result array */
      $dbarray = mysqli_fetch_array($result);
      return $dbarray;
   }
   

   /**
    * query - Performs the given query on the database and
    * returns the result, which may be false, true or a
    * resource identifier.
    */

   function query($query)
   {
   		      return mysqli_query($this->connection,$query );
   }

   function sp_query($query,$para)
   {
   
			      return sqlsrv_query($query, $this->connection,$para);
   }



        
    function fetch_row($data) {
        return mysqli_fetch_assoc($data);
    }

    function fetch_set($data) {
        return mysqli_fetch_array($data,MYSQLI_ASSOC);
        
    }

    function num_rows($data) {
        return mysqli_num_rows($data);
    }
    
    // FORMAT DATE
    function format($date) {
        date_default_timezone_set("Asia/Colombo");
        return date('y-m-d', strtotime($date)) == "01/01/1970" ? "" : date('y-m-d', strtotime($date));
    }
    
     // GET RECORD ID
    function getRecID() {
        $arrrecid = $this->query("SELECT @@IDENTITY AS recid");
        $row = $this->fetch_row($arrrecid);
        return $row['recid'];
    }   
        
// all data base function below 10-feb-2012

function get_mac()
{
ob_start(); // Turn on output buffering
system('ipconfig /all'); //Execute external program to display output
$mycom=ob_get_contents(); // Capture the output into a variable
ob_clean(); // Clean (erase) the output buffer

$findme = "Physical";
$pmac = strpos($mycom, $findme); // Find the position of Physical text
$mac=substr($mycom,($pmac+36),17); // Get Physical Address

return $mac;
}
// generate password with random id;
function generaterandom($ran)
{   
    //randonly generated;
    return '436A549B53954';
}
    // CHECK IF SESSION USER KEY ID STORED OR NOT
    function chkLogin() {
        if (!$this->sesUsrKy()) {
            return false;
        }
        if (!$this->sesComKy() || $this->sesComKy()==0) {
            return false;
        }
        return true;
    }

    // GET SESSION USER KEY
    function sesUsrKy() {
        $userid = $_SESSION['usrky'];
        if (is_numeric($userid)) {
            return $userid;
        }
        return 0;
    }

    // GET SESSION USER KEY
    function sesComKy() {
        $comky = $_SESSION['comky'];
        if (is_numeric($comky)) {
            return $comky;
        }
        return 0;
    }
    // GET company
    function sesUsrNm() {
        return $_SESSION['userNm'];
    }


// SESSION LOGOUT
    function usrLogOut($back) {
        $str = "";
        if (0 < $back) {
            for ($i = 0; $i < $back; $i++) {
                $str .= "../";
            }
        }
        header("Location:" . $str . "destroyee_session");
    }

	// Converting Number to wordsinclude("../include/session");

	
// Redirect to first page 
    function usrredirect($back) {
        $str = "";
        if (0 < $back) {
            for ($i = 0; $i < $back; $i++) {
                $str .= "../";
            }
        }
        header("Location:" . $str . "firstpage");
    }	
	
	
	// GET TODAY
    function today() {
        date_default_timezone_set("Asia/Colombo");
        return date('m/d/Y');
    }

    // GET CURRENT TIME (TIMESTAMP)
    function timestamp() {
        date_default_timezone_set("Asia/Colombo");
        return date('Y-m-d H:i:s');
    }

    // FORMAT DATE
    function formatDT($date, $format = 'm/d/Y') {
        date_default_timezone_set("Asia/Colombo");
        return date($format, strtotime($date));
    }
    
function convert_number_to_words($number)
 {
     $hyphen      = '-';
     $conjunction = ' and ';
     $separator   = '  ';
     $negative    = 'negative ';
     $decimal     = ' cents ';
     $dictionary  = array(
         0                   => 'zero',
         1                   => 'one',
         2                   => 'two',
         3                   => 'three',
         4                   => 'four',
         5                   => 'five',
         6                   => 'six',
         7                   => 'seven',
         8                   => 'eight',
         9                   => 'nine',
         10                  => 'ten',
         11                  => 'eleven',
         12                  => 'twelve',
         13                  => 'thirteen',
         14                  => 'fourteen',
         15                  => 'fifteen',
         16                  => 'sixteen',
         17                  => 'seventeen',
         18                  => 'eighteen',
         19                  => 'nineteen',
         20                  => 'twenty',
         30                  => 'thirty',
         40                  => 'fourty',
         50                  => 'fifty',
         60                  => 'sixty',
         70                  => 'seventy',
         80                  => 'eighty',
         90                  => 'ninety',
         100                 => 'hundred',
         1000                => 'thousand',
         1000000             => 'million',
         1000000000          => 'billion',
         1000000000000       => 'trillion',
         1000000000000000    => 'quadrillion',
         1000000000000000000 => 'quintillion'
     );
     
     if (!is_numeric($number)) {
         return false;
     }
     
     if (($number >= 0 && (int) $number < 0) || (int) $number < 0 - PHP_INT_MAX) {
         // overflow
         trigger_error(
             'convert_number_to_words only accepts numbers between -' . PHP_INT_MAX . ' and ' . PHP_INT_MAX,
             E_USER_WARNING
         );
         return false;
     }

     if ($number < 0) {
         return $negative . $this->convert_number_to_words(abs($number));
     }
     
     $string = $fraction = null;
     
     if (strpos($number, '.') !== false) {
         list($number, $fraction) = explode('.', $number);
     }
     
     switch (true) {
         case $number < 21:
             $string = $dictionary[$number];
             break;
         case $number < 100:
             $tens   = ((int) ($number / 10)) * 10;
             $units  = $number % 10;
             $string = $dictionary[$tens];
             if ($units) {
                 $string .= $hyphen . $dictionary[$units];
             }
             break;
         case $number < 1000:
             $hundreds  = $number / 100;
             $remainder = $number % 100;
             $string = $dictionary[$hundreds] . ' ' . $dictionary[100];
             if ($remainder) {
                 $string .= $conjunction . $this->convert_number_to_words($remainder);
             }
             break;
         default:
             $baseUnit = pow(1000, floor(log($number, 1000)));
             $numBaseUnits = (int) ($number / $baseUnit);
             $remainder = $number % $baseUnit;
             $string = $this->convert_number_to_words($numBaseUnits) . ' ' . $dictionary[$baseUnit];
             if ($remainder) {
                 $string .= $remainder < 100 ? $conjunction : $separator;
                 $string .= $this->convert_number_to_words($remainder);
             }
             break;
     }
     
     if (null !== $fraction && is_numeric($fraction)) {
         $string .= $decimal;
         $words = array();
         foreach (str_split((string) $fraction) as $number) {
         	//echo  $number;
			    $words1 = $words1.$number;
         }
		 
		 //str_split((string) $fraction) as $number) ;
            // $words1 = $string;
			 
         
		 
         $string .= $words1."/100"; //implode(' ', $words);
     }
     
     return $string;
}

	
	
	//-----
	// Generating order no

	
	// generate trnsaction maximum no
	function getmaxtrnno($ptrndt)
	{
		 $q = "SELECT Max(trnno) AS TrnNo From TrnMasTb WHERE trndt='$ptrndt'";
		
    	  //$result = mysql_query($q, $this->connection);
          $result = $this->query($q);
          
      	/* Error occurred, return given name by default */
      	if(!$result || (mysqli_num_rows($result) < 1)){
			 return 0;
		  }
		  else
		  {
			  /* Return result array */
			  $dbarray = $this->fetch_set($result);
			  return $dbarray['TrnNo'];
		  }
	}

// Master Running no
	function getmaxmtrnno()
	{
		 $q = "SELECT Max(mtrnno) AS mtrnno From TrnMasTb where mtrnno <> 0 and TrnDt >='01/01/2015'";
		
    	 //$result = mysql_query($q, $this->connection);
          $result = $this->query($q);
		  
    /* Error occurred, return given name by default */
    //	if(!$result || (mysql_num_rows($result) < 1)){
	//		 return 0;
	//	  }
	//	  else
	//	  {
			  /* Return result array */
			  $dbarray = $this->fetch_set($result);
			  return $dbarray['mtrnno'];
	//	  }
	}

	
	
	
	// Function to check option permission
	function getusrmenuper($usrky,$field)
	{
		 $q = "SELECT * From userinfotb WHERE usrky=".$usrky."" ;
		
//    	  $result = mysql_query($q, $this->connection);
           $result = $this->query($q);
      	/* Error occurred, return given name by default */
      	if(!$result || (mysqli_num_rows($result) < 1)){
			 return 0;
		  }
		  else
		  {
			  /* Return result array */
			  $dbarray =  $this->fetch_set($result);
			  return $dbarray[$field];
		  }
	}

        
        // fucntion to get the company fields
        function getcomdetails($usrky,$field)
	{
            $comky = $this->getusrmenuper($this->sesUsrKy(), "comky");
            $q = "SELECT * From companytb WHERE comky=".$comky."" ;
		
//    	  $result = mysql_query($q, $this->connection);
          $result = $this->query($q);
      	/* Error occurred, return given name by default */
      	if(!$result || ($this->num_rows($result) < 1)){
			 return 0;
		  }
		  else
		  {
			  /* Return result array */
			  $dbarray =  $this->fetch_set($result);
			  return $dbarray[$field];
		  }
	}

	 // fucntion to get the company fields
        function getcusaddressdetails($idky,$field)
	{
            
            $q = "SELECT * From delivery_addresses WHERE id=".$idky."" ;
		
//    	  $result = mysql_query($q, $this->connection);
          $result = $this->query($q);
      	/* Error occurred, return given name by default */
      	if(!$result || (mysqli_num_rows($result) < 1)){
			 return 0;
		  }
		  else
		  {
			  /* Return result array */
			  $dbarray =  $this->fetch_set($result);
			  return $dbarray[$field];
		  }
	}

	
	function getprestsatus($ppno,$ptrnky)
	{
		$q = "SELECT MAX(trnky) AS trnky FROM trnmastb WHERE (trnky <> '$ptrnky') AND (pno = N'$ppno')";

//    	$result = mysql_query($q, $this->connection);
        $result = $this->query($q);
      	/* Error occurred, return given name by default */
      	if(!$result || (mysqli_num_rows($result) < 1)){
			 return "a";
		  }
		  else
		  {
			  	
//				$dbarray = mysql_fetch_array($result);
                                $dbarray = $this->fetch_set($result);
	   		  	$ttrnky = $dbarray['trnky'] ;
				$q1 = "SELECT trnky,status FROM trnmastb WHERE (trnky ='$ttrnky')";
		
//	   		   	$result1 = mysqli_query($q1, $this->connection);
                                $result1 = $this->query($q1);
	
				if(!$result1 || (mysqli_num_rows($result1) < 1)){
					 return "";
				  }
				  else
				  {
//					  	$dbarray1 = mysql_fetch_array($result1);
                                                $dbarray1 = $this->fetch_set($result1);
						return $dbarray1['status'] ;
				  }		
				 
		  }
	}

   function lockuser($pusrky)
   {
        $sqlusr= "Update UserInfoTb SET flock = 1 where usrky='$pusrky' ";
        
        $resulusrt=$this->query($sqlusr);   
   }     
        
    
/* User menu option */

    
 
 // funcion loading security tab in user profile
    function loadusesectab($pusrky)
    {
       
        $access = $this->getusrmenuper($pusrky, "access");
        if($access==0 || $access==-1)
        {    
            echo'<li>
                    <a href="#notifications" data-toggle="tab"><i class="icon-bullhorn"></i> Notifications</a>
                </li>

                <li>
                        <a href="#security" data-toggle="tab"><i class="icon-lock"></i> Security</a>
                </li>    
                <li>
                        <a href="#company" data-toggle="tab"><i class="icon-group"></i> Company</a>
                </li>';
        }    
    }
   // funcion loading security tab
    function loadcompanytab($pusrky,$pmode)
    {
       
        $access = $this->getusrmenuper($pusrky, "access");
        $comky = $this->getusrmenuper($pusrky, "comky");
        
        if($access==2 || $access==-1 || $access==1)
        {    
           if($pmode!="editprofileitem")
          {    
            echo'<li class="tab-current"><a href="#section-1" class="icon-shop"><span>Company</span></a></li>';
          }  
          if($comky!=0)
          {    
            if($pmode=="editprofileitem")
            {
                echo '<li class="tab-current" ><a href="#section-2" class="icon-cup"><span>Items</span></a></li>';
            }
            else
            {    
                echo '<li><a href="#section-2" class="icon-cup"><span>Items</span></a></li>';
            }   
          }  

        }    
    } 
    
 // User profile list
 
    // User Company list
    function viewcompanylist()
    {
            $sqlstr = 'SELECT comky,comcd,comnm,tp1,email,web  
			FROM  companytb  
			 WHERE finact = 0 and comky <> -07011977  ';
            
//                $sqlstr = $sqlstr.'and (usrid LIKE("%'.$srch.'%") OR usrnm 
//                LIKE("%'.$srch.'%") ) ' ;
//                

        $viewhead = $this->query($sqlstr);
        while ($row = $this->fetch_set($viewhead)) {
            if($row['disper']==0){ $act = "Active";}else{$act = "Deactive";}
            
            
            echo "<tr>";
            echo "<td class='with-checkbox'>";
            echo "<input type='checkbox' name='check' value='1'>";
            echo "</td>";
            echo "<td>".$row['comcd']."</td>";
            echo "<td>".$row['comnm']."</td>";
            echo "<td>".$row['tp1']."</td>";
            echo "<td>".$row['email']."</td>";
            echo "<td>".$row['web']."</td>";
            echo "<td class='hidden-380'>
                            <a href='form-company?pmode=editprofile&precid=".$row['comky']."' class='btn' rel='tooltip' title='Edit' ><i class='icon-edit'></i></a>
                            <a href='#' onclick='deleteuser(".$row['comky'].")' class='btn' rel='tooltip' title='Delete'><i class='icon-remove'></i></a>
                    </td>";
           echo  "</tr>";
        }
        
    }
    // function load company list
    function loadcomlist($comky)
    {    
        $access = $this->getusrmenuper($this->sesUsrKy(), "access");
        $tcomky = $this->getusrmenuper($this->sesUsrKy(), "comky");
        if($access==-1)
        {    
            $arrtype = $this->query("SELECT comky,comcd,comnm FROM companytb WHERE (fInAct = 0) ORDER BY comnm");
        }
        else
        {
            $arrtype = $this->query("SELECT comky,comcd,comnm FROM companytb WHERE (fInAct = 0) and comky ='$tcomky' ORDER BY comnm");
        }    
        while ($typ = $this->fetch_set($arrtype)) {
            echo '<option value="' . $typ['comky'] . '" ' .
            ($comky == $typ['comky'] ? "selected" : "") . ' >' .$typ['comnm'] . '</option>';
        }

    }
    
    // function product category list
    function loadprodcat($catky = 0)
    {    
//            echo 'SELECT id,name FROM categories ORDER BY name';
        $arrtype = $this->query("SELECT cat_id,name FROM categories ORDER BY name");
            
        while ($typ = $this->fetch_set($arrtype)) {
            echo '<option value="' . $typ['name'] . '" ' .
            ($catky == $typ['name'] ? "selected" : "") . ' >' .$typ['name'] . '</option>';
        }

    }
    
    //function curenncy list 
    
      function loadCurrency($catky = 0)
    {    
            echo 'SELECT cu_id,cu_name FROM currency ORDER BY cu_name';
        $arrtype = $this->query("SELECT cu_id,cu_name FROM currency ORDER BY cu_name");
            
        while ($typ = $this->fetch_set($arrtype)) {
            echo '<option value="' . $typ['cu_name'] . '" ' .
            ($catky == $typ['cu_name'] ? "selected" : "") . ' >' .$typ['cu_name'] . '</option>';
        }

    }
    
    // Load Supllier 
    
    function loadSupplier($catky = 0)
     {    
        echo 'SELECT user_id,useer_name FROM user where user_type='."'manufacturer'".'ORDER BY name';
        $arrtype = $this->query("SELECT user_id,user_name FROM user where user_type='manufacturer' ORDER BY user_name");
            
        while ($typ = $this->fetch_set($arrtype)) {
            echo '<option value="' . $typ['user_name'] . '" ' .
            ($catky == $typ['user_name'] ? "selected" : "") . ' >' .$typ['user_name'] . '</option>';
        }

    }
    
    // Load collection Set 
    
        function loadCollection($catky = 0)
     {    
        echo 'SELECT id,name FROM collection ORDER BY name';
        $arrtype = $this->query("SELECT id,name FROM collection ORDER BY name");
            
        while ($typ = $this->fetch_set($arrtype)) {
            echo '<option value="' . $typ['name'] . '" ' .
            ($catky == $typ['name'] ? "selected" : "") . ' >' .$typ['name'] . '</option>';
        }

    }
    
      // function product brand list
    function loabrandList($catky = 0)
    {    
            echo 'SELECT id,name FROM brands ORDER BY name';
        $arrtype = $this->query("SELECT id,name FROM brands ORDER BY name");
            
        while ($typ = $this->fetch_set($arrtype)) {
            echo '<option value="' . $typ['name'] . '" ' .
            ($catky == $typ['name'] ? "selected" : "") . ' >' .$typ['name'] . '</option>';
        }

    }
    
    // function main Category  name
    
    function loabrandMainCat($catky = 0)
    {    
            echo 'SELECT cat_id,name FROM categories ORDER BY name';
        $cattype = $this->query("SELECT cat_id,name FROM categories ORDER BY name");
            
        while ($typ = $this->fetch_set($cattype)) {
            echo '<option value="' . $typ['name'] . '" ' .
            ($catky == $typ['id'] ? "selected" : "") . ' >' .$typ['name'] . '</option>';
        }

    }
    
    
    
    // function load product type list
    function loadprodtype($prodtype)
    {    
            echo '<option value="QUANTITY" ' .
            ($prodtype == "QUANTITY" ? "selected" : "") . ' >QUANTITY</option>';
            echo '<option value="TICKET" ' .
            ($prodtype == "TICKET" ? "selected" : "") . ' >TICKET</option>';
            
       
    }
    // function load super permission
    function loaduseraccess($pcat)
    {
        echo '          ';
    }
    // FUCNTION LOAD COUNTRY SELECT OPTION CONTROL
    function loadcounty($country)
    {
            // do the validation for country    
    }
    //function load agents
    function loadagent()
    {   
        $grp="";
        $arrtype = $this->query("SELECT adrky,adrcd,adrnm,email FROM addresstb WHERE (fobs = 0) ORDER BY adrnm");
        while ($typ = $this->fetch_set($arrtype)) 
        {
            $alf = $typ['adrnm'];
            //echo $alf[0];
        
            if($grp<>$alf[0])
            {
                $grp=$alf[0];
                echo '<tr class="alpha">
                        <td class="alpha-val">
                                <span>'.$grp[0].'</span>
                        </td>
                        <td colspan="2"></td>
                      </tr>';
            }        

            echo '<tr>
                        <td class="img"><img src="img/demo/noimage.png" alt=""></td>
                        <td class="user">'.$typ['adrnm'].'</td>
                        <td class="icon"><a href="#" class="btn"><i class="icon-search"></i></a></td>
                  </tr>';

            }
    }
    
    // function to activate the passport
    function rescanpp($ptrnno)
    {
        if($ptrnno==0 || $ptrnno=='')
        {
            echo 'Transaction No Cannot be Blank';
        }    
        else
        {    
            $access = $this->getusrmenuper($this->sesUsrKy(), "access");
            if($access==0 || $access==5  || $access==-1)
            {
                echo '<div class="span12">
                                                            <div class="form-actions">
                                                                <button type="Button" class="btn btn-red" onclick="updatepassportscanning()">Activate for Re-Scanning Passport</button>

                                                            </div>
                                                        </div>';
            }
        }
    }
    
    // get news list 
    function listNews($newsky=0,$pcatid = 0,$srch,$pnew =0)
    {
        $sql = 'SELECT * FROM latest_news where ln_status = 1';
         
      
      return $this->query($sql);
     // exit();
    }
    
    
    //Filter Product by Categeory
    
    function listByCat($cat_id) {
         
      
      
      $sql = "SELECT* from product WHERE category_id ='.$cat_id.'";
      
      
      // Get the latest news 
      
      
      
     /* if(0 < $pcatid){
        $sql.= ' and catid = '. $pcatid;
      }
      
      if($pnew==1)
      {
          $sql.= "and  itmmastbl.entdtm  >='".$start_week."' and itmmastbl.entdtm <='".$end_week."' ";
      }    
      if($srch!='')
      {    
        $sql = $sql.'and (itmnm LIKE("%'.$srch.'%") OR description 
         LIKE("%'.$srch.'%") OR shortdesc LIKE("%'.$srch.'%"))';
      }*/
     
      return $this->query($sql);
    }
    
    
    
    //Get the product list
     function listAllItems($itmky = 0,$pcatid = 0,$srch,$pnew =0) {
         
      //$previous_week = strtotime("-1 week +1 day");
      //$start_week = strtotime("last sunday midnight",$previous_week);
     // $start_week = date("Y-m-d",$start_week);
      //$end_week = date("Y-m-d");
      
      
      $sql = 'SELECT * FROM product where status = 1';
      if(0 < $itmky){
        $sql.= ' and product_id = '. $itmky;
      }
     
      return $this->query($sql);
    }
    
    //======================================================================
    
    // get product collections 
    
      function listCollections($collection) {
         
      $sql = 'SELECT * FROM product where status = 1';
      
      if($collection!=''){
        $sql.= " and collection  ='".$collection."'";
      }
         
      return $this->query($sql);
    }
    
    
    
    
    
    
    
    
    
    
    //======================================================================
         
    function listTop10Items() {
         
      
      
      $sql = "SELECT* from product WHERE collection ='CORSSBODY'";
    
      return $this->query($sql);
    }
    
    //Get Item By Category  
        function listItemByCat($cat_id) {
         
         
      $sql = "SELECT* from product WHERE category_id ='$cat_id'";
         
      return $this->query($sql);
    }
    
    

    // top bar
    function menutopbr()
    {
        	echo '<div class="top_bg">
							
								<div class="header_top">
									<div class="top_right">
										<ul>
											<li><a href="help">help</a></li>|
											<li><a href="contact">Contact</a></li>|
											<li><a href="javascript:;" onclick="checkoutcart();">Delivery information</a></li>
										</ul>
									</div>
									<div class="top_left">
    <h2><span></span> Call us : '.CON_NO.'     | '.$_SESSION["usernm"].' ';
                
                if($this->sesUsrKy()!=0){ echo '<img hieght="17" width="17" id="imgprofilepic" src="controllers/usercontrol?pimgmode=img&imgrecid='.trim($_SESSION["usrky"]).'" alt="">';}else{echo 'Not Logged in';};
                                                                                echo '</a></h2><input type="hidden" name="txtsesusrky" id="txtsesusrky" value="'.$this->sesUsrKy().'">
									</div>
										<div class="clearfix"> </div>
								</div>
							
						</div>
					<div class="clearfix"></div>';
    }
    
// fucntion header with the cart function
   function funhearder()
   {
       echo '<div class="head-t">
									<div class="logo">
										<a href="index"><img src="images/logo.png" class="img-responsive" alt=""> </a>
									</div>
										<!-- start header_right -->
									<div class="header_right">
										<div class="rgt-bottom">
                                                                                
											<div class="log">
                                                                                                <div class="login">
													<div id="loginContainer"><a id="loginButton" class=""><span>Login</span></a>
														<div id="loginBox" style="display: none;">
                                                                                                                 	<form action="controllers\validatelogin.php" method="POST" class="form-validate" id="loginForm" name="Login1" >
																	<fieldset id="body">
																		<fieldset>
																			  <label for="email">Email Address</label>
																			  <input type="text" name="txtuser" id="txtuser" >
																		</fieldset>
																		<fieldset>
																				<label for="password">Password</label>
																				<input type="password" name="txtpassword" id="txtpassword">
																		 </fieldset>
																		<input type="submit"  name="submit" id="login" value="Sign in">
																		<label for="checkbox"><input type="checkbox" id="remember" name="remember"> <i>Remember me</i></label>
																	</fieldset>
																<span><a href="#">Forgot your password?</a></span>
															</form>
														</div>
													</div>
												</div>
											</div>
											<div class="reg">'?>
												<!--<a href="register?pacctyp='.base64_encode(2).'">REGISTER</a>-->
											<?php echo'</div>
										<div class="cart box_1">
											<div id="cartdiv" >
												
											</div
											<p><a href="javascript:;" onclick="emptyCart();" class="simpleCart_empty">(empty card)</a></p>
											<div class="clearfix"> </div>
										</div>
                                                                               
										<div class="create_btn">
											
                                                                                        <a href="javascript:;"  onclick="checkoutcart();">CHECKOUT</a>
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="search">
										<form action="products" method="GET" >
											<input type="text" name="srchtxt" value="" placeholder="search...">
											<input type="submit" value="">
										</form>
									</div>
									<div class="clearfix"> </div>
                                                                        <div id="errordiv" >'.$_GET['msg'].'</div>
								</div>
								<div class="clearfix"> </div>
							</div>';
   } 
// function top footer
   function topfooter()
   {
       echo '<div class="col-md-6 s-c">
						<li>
							<div class="fooll">
								<h1>follow us on</h1>
							</div>
						</li>
						<li>
							<div class="social-ic">
								<ul>
									<li><a href="#"><i class="facebok"> </i></a></li>
									<li><a href="#"><i class="twiter"> </i></a></li>
									<li><a href="#"><i class="goog"> </i></a></li>
									<li><a href="#"><i class="be"> </i></a></li>
										<div class="clearfix"></div>	
								</ul>
							</div>
						</li>
							<div class="clearfix"> </div>
					</div>
					<div class="col-md-6 s-c">
						<div class="stay">
									<div class="stay-left">
										<form>
											<input type="text" placeholder="Enter your email" required="">
										</form>
									</div>
									<div class="btn-1">
										<form>
											<input type="submit" value="join">
										</form>
									</div>
										<div class="clearfix"> </div>
						</div>
					</div>
					<div class="clearfix"> </div>';
   }
//   calling the footer funciton
   function funfooter()
   {
       $nor = base64_encode(0);
       $sup = base64_encode(2);
       $agnt = base64_encode(1);
       
       echo '<div class="col-md-3 cust">
					<h4>CUSTOMER CARE</h4>
							<li><a href="help">Help Center</a></li>
							<li><a href="contact">Contact Us</a></li>
							<li><a href="javascript:;" onclick="checkoutcart();">Delivery</a></li>
                                                        <li><hr></li>
                                                        
                                                        <li>Payment Methods</li>
                                                       <li><img src= "images/visa.png" alt="visa">
                                                       <img src= "images/mastercard.png" alt="mastercard">
<img src= "images/amex.png" alt="amex"> <img src= "images/directd.png" alt="amex">                                                        
</li>
                                                        
					</div>
					<div class="col-md-2 abt">
						<h4>ABOUT US</h4>
							<li><a href="products">Our Stories</a></li>
							<li><a href="register?pacctyp='.$agnt.'">Affiliate Agent</a></li>
                                                        <li><a href="register?pacctyp='.$sup.'">Property Owners</a></li>
                                                            
                                                        
					</div>
					<div class="col-md-2 myac">
						<h4>MY ACCOUNT</h4>
							<li><a href="register?pacctyp='.$nor.'">Register</a></li>
							<li><a href="javascript:;" onclick="checkoutcart();">My Cart</a></li>
							<li><a href="history">Order History</a></li>
							
					</div>
					<div class="col-md-5 our-st">
						<div class="our-left">
							<h4>OUR STORES</h4>
						</div>
						
							<li><i class="add"> </i>'.CON_PERSON.'</li>
							<li><i class="phone"> </i>'.CON_NO.'</li>
							<li><a href="mailto:'.CON_EMAIL.'"><i class="mail"> </i>'.CON_EMAIL.' </a></li>
					</div>
					<div class="clearfix"> </div>
						<p >'.PG_FOOT.'</p><a href="#" class="cd-top">Top</a>';
       
       echo'  
    
<script type="text/javascript">$(document).bind("contextmenu",function(e) {
            e.preventDefault();
        });
        
        $(function(){
            //Yes! use keydown cus some keys is fired only in this trigger,
            //such arrows keys
            $("body").keydown(function(e){
                 //well you need keep on mind that your browser use some keys 
                 //to call some function, so we will prevent this
                 //e.preventDefault();

                 //now we caught the key code, yabadabadoo!!
                 var keyCode = e.keyCode || e.which;

                 //your keyCode contains the key code, F1 to F12 
                 //is among 112 and 123. Just it.
                // console.log(keyCode);    
                if (keyCode == 112) {
                    return false;
                } 
                if (keyCode == 123) {
                    return false;
                }
            });
        });</script>
        
<script src="js/jquery.email-autocomplete.js"></script>
   
   <script>
            (function($){
              $(function() {
                $(".email").emailautocomplete({
                  domains: ["example.com"] //add your own domains
                });
              });
            }(jQuery));
    </script>

        
';
       
                ;
   }
   
// Side menu bar
   function sidemenu()
   {
      $access = $this->getusrmenuper($this->sesUsrKy(), "access");
      $previous_week = strtotime("-1 week +1 day");
      
      $start_week = strtotime("last sunday midnight",$previous_week);
      $start_week = date("Y-m-d",$start_week);
      $end_week = date("Y-m-d");
      $usrky = $this->sesUsrKy();
      $comky = $this->getusrmenuper($this->sesUsrKy(), "comky");
      
      $sqlstr = "Select  categories.id,categories.name 
            FROM categories INNER JOIN itmmastbl ON categories.id = itmmastbl.catid WHERE itmmastbl.entdtm  >='".$start_week."' and itmmastbl.entdtm <='".$end_week."'  "; 
      $sqlstr=$sqlstr."  Group by categories.id";
      
     
      $arrtype = $this->query($sqlstr);
      $arrtypedet = $this->query("SELECT id,name FROM categories ORDER BY name");
       
       echo '<header class="logo1">
                                            <a href="index"><img src="images/logo.png" hieght="90" width ="130" class="img-responsive" alt=""> </a>
                                            
						<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> 
					</header>
						<div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
                           <div class="menu">
									<ul id="menu" >
										<li><a href="index"><i class="fa fa-tachometer"></i> <span>Home</span></a></li>
										 <li id="menu-academico" ><a href="#"><i class="lnr lnr-bullhorn"></i> <span> New Arrivals</span> <span class="fa fa-angle-right" style="float: right"></span></a>
										   <ul id="menu-academico-sub" >';
                                                                                        
                                                                                        while ($typ = $this->fetch_set($arrtype)) 
                                                                                        {
                                                                                               $strmenu =  "products?pcatid=".base64_encode($typ['id'])."&pnew=1";
                                                                                            
                                                                                            echo "<li id='menu-academico-avaliacoes' ><a href='".$strmenu."'>".$typ['name']."</a></li>";
                                                                                        }
											
										  echo '</ul> ';
                                                                                        while ($typ = $this->fetch_set($arrtypedet)) 
                                                                                        {
                                                                                               $strmenu =  "products?pcatid=".base64_encode($typ['id']);
                                                                                            
                                                                                            echo "<li id='menu-academico-avaliacoes'><a href='".$strmenu."'><i class='lnr lnr-store'></i><span>".$typ['name']."</span></a></li>";
                                                                                        }			 
                                                                        
                                                        if($access==-1 || $access==2 || $access==1 )
                                                        {
                                                            if($access==-1)
                                                            {
                                                                $mnutit = "System Admin";
                                                                
                                                            }
                                                            if($access==1)
                                                            {
                                                                $mnutit = "Agent";
                                                                
                                                            }
                                                            else if($access==2)
                                                            {
                                                                $mnutit = "Supplier";
                                                            }        
                                                                echo ' 		<li><a href="#"><i class="lnr lnr-chart-bars"></i> <span>'.$mnutit.'</span> <span class="fa fa-angle-right" style="float: right"></span></a>
									  <ul>
                                                                                <li><a href="form-company?precid='.base64_encode($comky).'"> '.$mnutit.'</a></li>										
                                                                                <li><a href="itemlist"> Item Details</a></li>
										<li><a href="orderlist">Order Placed</a></li>
									</ul>
									</li>';
                                                        }        
                                                        echo '<li><a href="destroyee_session"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li></ul>
								</div>
							  ';
   }
   // category name
   function getcatnm($pcat = 0)
   {
      $sql = 'SELECT name FROM categories ';
      if(0 < $pcat){
        $sql.= ' WHERE id = '. $pcat;
        
        $cat = $this->fetch_set($this->query($sql));
        $catstr = $cat['name'];
      }
      else
      {
          $catstr = "All Products";
      }    
      return $catstr;
   }        
   // no of items in the category
   function getcatrec($pcat = 0)
   {
      $sql = 'SELECT catid FROM itmmastbl where finact = 0';
      if(0 < $pcat)
      {
        $sql.= ' and catid = '. $pcat;
        
      }
      else
      {
      //    $catstr = "0";
      } 
      
      $catstr = $this->num_rows($this->query($sql));

      
      return $catstr;
   } 
   
   
   function getreccount($ptable =0)
   {
       $tblresult = $this->query("SELECT itmnm,img1 FROM itmmastbl  ORDER BY itmnm");
       echo $this->num_rows($tblresult);
   }
   
   // order no generation
   function getOrdNo(){
      $sql = 'SELECT MAX(id) AS ORDNO FROM orders';
      $arr = $this->query($sql);
      $rs = $this->fetch_row($arr);
      $ordno = $rs['ORDNO'];
      ++$ordno;
      return "ORD".$ordno;
   }
  
  //purchase history 
  function viewhistory($srch) {
            
            $sqlstr = 'SELECT id,ordno,date,total  
			FROM  orders  
			 WHERE id <> -07011977  ';
            
             $sqlstr = $sqlstr.'and customer_id ='.$srch ; 
          
        $viewhead = $this->query($sqlstr);
        while ($row = $this->fetch_set($viewhead)) {
            $act = "Confirmed";   
            echo "<tr>";
            echo "<td class='with-checkbox'>";
            echo "<input type='checkbox' name='check' value='1'>";
            echo "</td>";
            echo "<td>".$row['id']."</td>";
            echo "<td>".$row['ordno']."</td>";
            echo "<td>".$this->format($row['date'])."</td>";
            echo "<td>".$row['total']."</td>";
            echo "<td ><span class=''>$act</span></td>";
            
           echo  "</tr>";
        }
   
    }  
//  Viewitem list accourding to the company key  
  function viewitemlist($srch) {
            //echo $this->sesUsrKy();
            
            $access = $this->getusrmenuper($this->sesUsrKy(), "access");
//            if($srch !=0)
//            {
//                $sqlstr = 'SELECT itmky,itmcd,itmnm,itmpric,shortdesc,itmky,balqty,unit  
//			FROM  itmmastbl  
//			 WHERE itmky <> -07011977 and comky ='.$srch;
//                
//            }
            if ($access==-1)
            {        
            
            $sqlstr = 'SELECT itmky,itmcd,itmnm,itmpric,shortdesc,itmky,balqty,unit  
			FROM  itmmastbl  
			 WHERE itmky <> -07011977 ';
            }
            else
            {
                $sqlstr = 'SELECT itmky,itmcd,itmnm,itmpric,shortdesc,itmky,balqty,unit  
			FROM  itmmastbl  
			 WHERE itmky = -07011977 and comky ='.$srch;;
            }
            
            $sqlstr = $sqlstr.' order by itmnm' ; 
          
        $viewhead = $this->query($sqlstr);
        
        //echo $access. $sqlstr;
        while ($row = $this->fetch_set($viewhead)) {
            $act = "Confirmed";   
            echo "<tr>";
            echo "<td class='with-checkbox'>";
            echo "<input type='checkbox' name='check' value='1'>";
            echo "</td>";
            echo "<td>".$row['itmcd']."</td>";
            echo "<td>".$row['itmnm']."</td>";
            echo "<td>".$row['shortdesc']."</td>";
            echo "<td>".$row['balqty']."</td>";
            echo "<td>".$row['itmpric']."</td>";
            echo "<td>".$row['unit']."</td>";
             echo "<td class='hidden-380'>
                            <a href='form-item?pmode=editprofileitem&precid=".base64_encode($row['itmky'])."' class='btn' rel='tooltip' title='Edit' ><i class='lnr lnr-pencil'></i></a>
                            <a href='#' onclick='deleteuser(".$row['comky'].")' class='btn' rel='tooltip' title='Delete'><i class='lnr lnr-trash'></i></a>
                    </td>";
            
            
           echo  "</tr>";
        }
   
    }  
    // Order List
     function vieworderlist($srch) {
            
            $sqlstr = 'SELECT id,ordno,date,total,payment_type,status  
			FROM  orders  
			 WHERE id <> -07011977 and customer_id ='.$srch;
            
             $sqlstr = $sqlstr.' order by ordno' ; 
          
        $viewhead = $this->query($sqlstr);
        while ($row = $this->fetch_set($viewhead)) {
            $act = "Confirmed";   
            echo "<tr>";
            echo "<td class='with-checkbox'>";
            echo "<input type='checkbox' name='check' value='1'>";
            echo "</td>";
            echo "<td><a href='orderinfo?pmode=list&precid=".base64_encode($row['id'])."' class='btn' rel='tooltip' title='Display Order' ><i class='lnr lnr-cart'>".$row['ordno']."</i></a></td>";
            echo "<td>".$this->format($row['date'])."</td>";
            echo "<td>".$row['total']."</td>";
            echo "<td>".$row['payment_type']."</td>";
            echo "<td>".$act."</td>";
            echo "<td><a href='invoice?pmode=editprofile&precid=".base64_encode($row['id'])."' class='btn' rel='tooltip' title='Edit' ><i class='lnr lnr-printer'></i></a></td>";
             echo "<td class='hidden-380'>
                            <a href='#' onclick='deleteuseraa(".$row['comky'].")' class='btn' rel='tooltip' title='Delete'><i class='lnr lnr-trash'></i></a>
                    </td>";
            
            
           echo  "</tr>";
        }
   
    }  

 function sendEmail($to,$user_name, $subject, $body, $html = null) {
        
        date_default_timezone_set('Asia/Kuala_Lumpur');
        
        $user_email=$to;
        $email_username="info@vcs2u.com";
        $email_from_name="BITCHIPS & Co";        
        $mail = new PHPMailer();
  //$mail->IsSMTP(); // telling the class to use SMTP
   
  // $mail->SMTPDebug = 0;                     // enables SMTP debug information (for testing)
   // 1 = errors and messages
  // 2 = messages only
   // $mail->SMTPAuth = true;                  // enable SMTP authentication
   //$mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
  //$mail->Host = "https://vc-deluke.com/";      // sets GMAIL as the SMTP server
  // $mail->Port = 465 ;                   // set the SMTP port for the GMAIL server
//   $mail->Username = "rsasinthiran@foshwa.net";  // GMAIL username
//   $mail->Password = "sasi@123";            // GMAIL password
//         

//  $mail->SetFrom('rsasinthiran@foshwa.net', 'My Friends Holiday');
//
//  $mail->AddReplyTo("rsasinthiran@foshwa.net", "My Friends Holiday");
        
        
    //Set who the message is to be sent from
    $mail->setFrom($email_username, $email_from_name);
    //Set an alternative reply-to address
    $mail->addReplyTo($email_username, $email_from_name);
    //Set who the message is to be sent to
    $mail->addAddress($user_email, $user_name);
    //Set the subject line

//$mail->Subject = $subject;
// //$mail->AddAddress($to);
//
//  if ($body != null) {
//       $mail->AltBody = $body; // optional, comment out and test
//   }
//  $mail->MsgHTML($html);
//
//   $arrto = explode(';', $to);
//
//  for ($i = 0; $i < count($arrto) - 1; $i++) {
//       echo $i.' COM<br>';
//      $mail->AddAddress($arrto[$i]);
// }
//
// try {
//         $mail->send();
//        $msg = "An email has been sent for verfication.";
//       $msgType = "success";
//        } catch (Exception $ex) {
//       $msg = $ex->getMessage();
//         $msgType = "warning";
//      }
//echo $msg;
    
  $mail->Subject ='Performa Invoice (Estore)'.$subject;
  $mail->Body = '<body>'.$html.'</body>';
    
   
   $mail->AltBody ='Visit More info https://vc-deluke.com';
//    $mail->send();
//    //send the message, check for errors
//    if (!$mail->send()) {
//        $email_send = '0';
//    } else {
//        $email_send = '1';
//    }
   
   try {
         $mail->send();
        $msg = "An email has been sent for verfication.";
       $msgType = "success";
        } catch (Exception $ex) {
       $msg = $ex->getMessage();
         $msgType = "warning";
      }

}


// fucntion countries
function getCountries($city) {
       $query = "SELECT id,sortname, name FROM countries";
       $result = $this->query($query);
//       if(!$result) {
//         throw new exception("Country not found.");
//       }
       $res = array();
       $a=0;
       while($resultSet =$this->fetch_row($result)) {
//        $res[$resultSet['id']] = $resultSet['name'];
            echo '<option value="' . $resultSet['sortname'] . '" ' .
            ($city == $resultSet['sortname'] ? "selected" : "") . ' >' .$resultSet['name'] . '</option>';
       }
//       $data = array('status'=>'success', 'tp'=>1, 'msg'=>"Countries fetched successfully.", 'result'=>$res);
//       return $data;
//     } catch (Exception $e) {
//       $data = array('status'=>'error', 'tp'=>0, 'msg'=>$e->getMessage());
//     } finally {
//        return $data;
//     }
   }
// cities
   function getCities($stateId) {
//     try {
       $query = "SELECT id, name FROM cities WHERE state_id=".$stateId;
       $result = $this->query($query);
//       if(!$result) {
//         throw new exception("City not found.");
//       }
       $res = array();
       while($resultSet =  $this->fetch_row($result)) {
//        $res[$resultSet['id']] = $resultSet['name'];
         echo '<option value="' . $resultSet['id'] . '" ' .
            ($city == $resultSet['id'] ? "selected" : "") . ' >' .$resultSet['name'] . '</option>';
       }
//       $data/ = array('status'=>'success', 'tp'=>1, 'msg'=>"Cities fetched successfully.", 'result'=>$res);
//     } catch (Exception $e) {
//       $data = array('status'=>'error', 'tp'=>0, 'msg'=>$e->getMessage());
//     } finally {
//        return $data;
//     }
   }   

// contry data
   function getcountrydata($countcd,$field)
	{
            $comky = $this->getusrmenuper($this->sesUsrKy(), "comky");
            $q = "SELECT * From countries WHERE sortname='".$countcd."'" ;
		
//    	  $result = mysql_query($q, $this->connection);
          $result = $this->query($q);
      	/* Error occurred, return given name by default */
      	if(!$result || ($this->num_rows($result) < 1)){
			 return 0;
		  }
		  else
		  {
			  /* Return result array */
			  $dbarray =  $this->fetch_set($result);
			  return $dbarray[$field];
		  }
	}

   
   
// state

function getStates($countryId,$city = 0) {
//     try {
       $id = $this->getcountrydata($countryId,"id");
       $query1 = "SELECT id, name FROM states WHERE country_id=".$id;
       $result = $this->query($query1);
       while($resultSet = $this->fetch_row($result)) {
         echo '<option value="' . $resultSet['id'] . '" ' .
            ($city == $resultSet['id'] ? "selected" : "") . ' >' .$resultSet['name'] . '</option>';
       }
} 
   
// display category combo box
function getcatcombo($pcat = 0)
{
   $sql = 'SELECT id, name FROM categories Order By name ';
   $result = $this->query($sql);
   echo '<option value="0" ' .
         ($city == $resultSet['id'] ? "selected" : "") . ' >Any</option>';
    while($resultSet = $this->fetch_row($result)) {
      echo '<option value="' . $resultSet['id'] . '" ' .
         ($city == $resultSet['id'] ? "selected" : "") . ' >' .$resultSet['name'] . '</option>';
    }
} 


function loadAllUsers($catky)
     {    
        
        $arrtype = $this->query("SELECT m_id,m_username FROM members  ORDER BY m_name");
            
        while ($typ = $this->fetch_set($arrtype)) {
            
            echo '<option value="' . $typ['m_id'] . '" ' .
            ($catky == $typ['m_id'] ? "selected" : "") . ' >' .$typ['m_username'] . '</option>';
        }

    }
    
 function loadAllUsersType($catky)
     {    
        echo 'select  usr_cat_id,cat_name from user_cat ORDER by cat_level';
        $arrtype = $this->query("select  usr_cat_id,cat_name from user_cat ORDER by cat_level");
            
        while ($typ = $this->fetch_set($arrtype)) {
            echo '<option value="' . $typ['cat_name'] . '" ' .
            ($catky == $typ['cat_name'] ? "selected" : "") . ' >' .$typ['cat_name'] . '</option>';
        }

    }
   
   
};




/* Create database connection */
$database = new MySQLDB;


?>
