<footer class="footer"> © 2020 CoinDash All Right Reserved.</footer>
<script type="text/javascript">
    
 function logout(){

   
    swal({
          title: "Are You Sure ",
          text: "Loging Out",
          icon: "warning",
          buttons: [
            'No Cancel It',
            'I am Sure'
          ],
       dangerMode: true
        }).then(function(isConfirm) {
          if (isConfirm) {
            swal({
              title: 'Log Out',
              text: 'Thank You',
              icon: 'success'
            }).then(function() {
            
              window.location='data/logout.php';             
                        
                        
            });
          } else {
              
               
            swal('Cancelled', 'User Not Login Out', 'error');
          }
        });
  
   
}
    
    
    </script>
<!-- End footer -->
       
        <!-- End Page wrapper  -->
    
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
	<!-- Echart -->
    <script src="js/lib/echart/echarts.js"></script>
    <script src="js/lib/echart/dashboard1-init.js"></script>

    <script src="js/lib/datamap/d3.min.js"></script>
    <script src="js/lib/datamap/topojson.js"></script>
    <script src="js/lib/datamap/datamaps.world.min.js"></script>
    <script src="js/lib/datamap/datamap-init.js"></script>

    <script src="js/lib/weather/jquery.simpleWeather.min.js"></script>
    <script src="js/lib/weather/weather-init.js"></script>
    <script src="js/lib/owl-carousel/owl.carousel.min.js"></script>
    <script src="js/lib/owl-carousel/owl.carousel-init.js"></script>

  
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
    
    
    <script src="js/lib/datatables/datatables.min.js"></script>
    <script src="js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script src="js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
    <script src="js/lib/datatables/cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="js/lib/datatables/cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script src="js/lib/datatables/cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
    <script src="js/lib/datatables/datatables-init.js"></script>
</body>

</html>