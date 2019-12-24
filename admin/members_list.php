<?php
include_once './header.php';
include_once './sidebar.php';
include_once './data/members_list_data.php';
?>


  <!-- Content Wrapper. Contains page content -->
  <div class="page-wrapper">
    <!-- Main content -->
   
    <!-- /.Tab content -->
 <section >
     <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary" style="text-transform: uppercase;"><?=$type?> LIST</h3> </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0)"><?=$type?> Group</a></li>
                        <li class="breadcrumb-item active"><?=$type?> List</li>
                    </ol>
                </div>
            </div>
      <div class="container-fluid">
      <div class="row">
        <div class="col-12">

        <div class="card">
	<div class="card-body">
	   <h4 class="card-title">PLAYER LIST</h4>
 
            <div class="table-responsive m-t-40">
                                    <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                
                                                 <th>Username/E-Mail/Mobile Number </th>
                                                
                                                <th>Register Date</th>
                                                <th>Up Line</th>
                                               
                                                <th >Action</th>
                                                 
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                 <th>#</th>
                                                
                                                 <th>Name/E-Mail</th>
                                                
                                                <th>Register Date</th>
                                                <th>Up Line</th>
                                               
                                                <th >Action</th>
                                                  
                                            </tr>
                                        </tfoot>
                                       
                                         <tbody>
				<?php 
				$i=1;
				while($row = mysqli_fetch_assoc($result)) { 
					if($row['m_status'] == '1'){
						$m_status = 'Active';
					} else{
						$m_status = 'Inactive';
					}
				?>
                <tr>
                  <td><?php echo $i++; ?></td>
                  
                  <td><a href="members_add.php?user_id=<?php echo $row['m_id'];?>"><?php  
                  if($row['m_username']!=''){
                      echo $row['m_username'];
                      
                  }else{
                  
                  if($row['m_email']!=''){
                      
                      echo $row['m_email'];
                  }else{
                      
                      
                      if($row['m_phone']){
                          
                           echo $row['m_phone'];
                      }
                      
                      
                  }
                  
                  
                  
                  }
                  
                  ?></a></td>
                 
                  <td><?php echo $row['register_date']; ?></td>
		
                  <td><?php echo $row['upline_username']; ?></td>
                  <td><?php if($row['m_status'] == '1'){ ?><button type="button" id="btnm<?php echo $row['m_id'];?>" class="btn btn-block  btn-danger" onclick="deleteUser('<?php echo $row['m_id'];?>', 'm','m_id',<?php echo $type;?>);">Deactivate</button>

                                <?php }else{?>

                                <button type="button" id="btnm<?php echo $row['m_id'];?>" class="btn btn-block btn-success" onclick="activateUser('<?php echo $row['m_id'];?>', 'm','m_id',<?php echo $type;?>);">Activate</button>

                                <?php    
                                }

                                ?>

                  </td>   
			  
                </tr>
				
				<?php } ?>
          
                </tbody>
                                        
                                    </table>
                                </div>
            

     </div>
     </div>
            
        </div>
      </div>
      </div>
     </section>
    
</div>
       
      
  <script type="text/javascript">
      
  function deleteUser(id,tbl,id_name,type){

   swal({
          title: "Are you sure?",
          text: "Do You want Deactivate  this account",
          icon: "warning",
          buttons: [
            'No, cancel it!',
            'Yes, I am sure!'
          ],
       dangerMode: true,
        }).then(function(isConfirm) {
          if (isConfirm) {
            swal({
              title: 'Deactivated',
              text: 'Account Sucessfully deactivated',
              icon: 'success'
            }).then(function() {
                  
            var data = { 
                             id:id, 
                             tbl:tbl,
                             id_name:id_name
                             
                        };
                      
            $.ajax({ 
            type: "POST", 
            url: "./data/deleterecords.php", 
            dataType: 'json',
            data: data, 
           
          
            success: function(data) { 
            console.log(data);  
        
          if(data.res==0){
               
               window.location.href = "members_list.php?type="+type;
           }else{
              
                 window.location.href = "members_list.php?error=3";
           }
           
           
 
            } 
        });    
                        
                        
                        
            });
          } else {
            swal("Cancelled", "User Not Deactivated", "error");
          }
        });
  
  }
  
  
  
   function activateUser(id,tbl,id_name,type){

   swal({
          title: "Are you sure?",
          text: "Do You want Activate  this account",
          icon: "warning",
          buttons: [
            'No, cancel it!',
            'Yes, I am sure!'
          ],
       dangerMode: true,
        }).then(function(isConfirm) {
          if (isConfirm) {
            swal({
              title: 'Activated',
              text: 'Account Sucessfully Activated',
              icon: 'success'
            }).then(function() {
                  
            var data = { 
                             id:id, 
                             tbl:tbl,
                             id_name:id_name
                             
                        };
                      
            $.ajax({ 
            type: "POST", 
            url: "./data/activaterecord.php", 
            dataType: 'json',
            data: data, 
            success: function(data) { 
            console.log(data);  
        
          if(data.res==0){
               
               window.location.href = "members_list.php?type="+type;
           }else{
              
                 window.location.href = "members_list.php?error=3";
           }
           
           
 
            } 
        });    
                        
                        
                        
            });
          } else {
            swal("Cancelled", "User Not Deactivated", "error");
          }
        });
  
  }
  
 
      
      
</script>
 
 
 
  </div>

 <?php include_once './footer.php';?>