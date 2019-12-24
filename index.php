<?php 

include_once './top_header.php';
include_once './header.php';
include_once './slider.php';
include_once './get_ins.php';

?>

         
          

		<!-- content 
			================================================== -->
		<div id="content">

			<!-- welcome-box -->
			<?php include_once './welcome_box.php';?>
			<!-- services-box -->
			
                        <?php// include_once './services_box.php';?>        
			<!-- recent-works-box -->
			<?php //include_once './recent_works.php';?>

			<!-- partners box -->
			
                        <?php //include_once './partners.php';?>    
			<!-- Latest Post -->
			 <?php //include_once './latest_post.php';?>    

			<!-- WHY convertible box -->
			
                         <?php //include_once './why_convertible_box.php';?>   
			<!-- client-testimonials -->
			
                         <?php //include_once './testimonials_box.php';?>  
			<!-- staff-box -->
		        <?php //include_once './staff_box.php';?>  

		         <?php //include_once './infographic_box.php';?>  


			<!-- Product Box -->
		
                         <?php //include_once './product_box.php';?>  
			<!-- Convertible-banner -->
<!--			<div class="convertible-banner">
				<div class="container">
					<a href="#">Learn More</a>
					<p><span>Convertible</span> The most complete PSD Template with pixel perfect design available only on themeforest</p>
				</div>
			</div>

			 accord-tabs box 
			<div class="accord-tab-box">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<h3>Content With Accordion</h3>
							<div class="accordion-box">

								<div class="accord-elem active">
									<div class="accord-title">
										<h5><i class="fa fa-question"></i>Marketplace Basics</h5>
										<a class="accord-link" href="#"></a>
									</div>
									<div class="accord-content">
										<span class="image-content"><i class="fa fa-suitcase"></i></span>
										<p>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio</p>
									</div>
								</div>

								<div class="accord-elem">
									<div class="accord-title">
										<h5><i class="fa fa-question"></i>Marketplace Basics</h5>
										<a class="accord-link" href="#"></a>
									</div>
									<div class="accord-content">
										<span class="image-content"><i class="fa fa-suitcase"></i></span>
										<p>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio</p>
									</div>
								</div>

								<div class="accord-elem">
									<div class="accord-title">
										<h5><i class="fa fa-question"></i>Marketplace Basics</h5>
										<a class="accord-link" href="#"></a>
									</div>
									<div class="accord-content">
										<span class="image-content"><i class="fa fa-suitcase"></i></span>
										<p>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio</p>
									</div>
								</div>

								<div class="accord-elem">
									<div class="accord-title">
										<h5><i class="fa fa-question"></i>Marketplace Basics</h5>
										<a class="accord-link" href="#"></a>
									</div>
									<div class="accord-content">
										<span class="image-content"><i class="fa fa-suitcase"></i></span>
										<p>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio</p>
									</div>
								</div>

								<div class="accord-elem">
									<div class="accord-title">
										<h5><i class="fa fa-question"></i>Marketplace Basics</h5>
										<a class="accord-link" href="#"></a>
									</div>
									<div class="accord-content">
										<span class="image-content"><i class="fa fa-suitcase"></i></span>
										<p>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio</p>
									</div>
								</div>
								
							</div>
						</div>

						<div class="col-md-6">
							<h3>Awesome Tabs</h3>

							<div class="tab-box">
								<div class="tab-content active">
									<img alt="" src="images/icon7.png">
								</div>
								<div class="tab-content">
									<img alt="" src="images/icon7.png">
								</div>
								<div class="tab-content">
									<img alt="" src="images/icon7.png">
								</div>
							</div>
							<ul class="tab-links">
								<li><a class="tab-link1 active" href="#"><i class="fa fa-cog"></i> Powerful Admin</a></li>
								<li><a class="tab-link2" href="#"><i class="fa fa-picture-o"></i> Retina Ready</a></li>
								<li><a class="tab-link3" href="#"><i class="fa fa-leaf"></i> Pixel Perfect</a></li>
							</ul>
						</div>

					</div>
				</div>
			</div>-->

		</div>
		<!-- End content -->


		<!-- footer 
			================================================== -->
	       <?php include_once './footer.php';?>  
		<!-- End footer -->
	</div>
	<!-- End Container -->

	<!--
	##############################
	 - ACTIVATE THE BANNER HERE -
	##############################
	-->
<script type="text/javascript">

		var tpj=jQuery;
		tpj.noConflict();

		tpj(document).ready(function() {

		if (tpj.fn.cssOriginal!=undefined)
			tpj.fn.css = tpj.fn.cssOriginal;

			var api = tpj('.fullwidthbanner').revolution(
				{
					delay:8000,
					startwidth:1170,
					startheight:580,

					onHoverStop:"off",						// Stop Banner Timet at Hover on Slide on/off

					thumbWidth:100,							// Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
					thumbHeight:50,
					thumbAmount:3,

					hideThumbs:0,
					navigationType:"bullet",				// bullet, thumb, none
					navigationArrows:"solo",				// nexttobullets, solo (old name verticalcentered), none

					navigationStyle:"round",				// round,square,navbar,round-old,square-old,navbar-old, or any from the list in the docu (choose between 50+ different item), custom


					navigationHAlign:"center",				// Vertical Align top,center,bottom
					navigationVAlign:"bottom",					// Horizontal Align left,center,right
					navigationHOffset:30,
					navigationVOffset: 40,

					soloArrowLeftHalign:"left",
					soloArrowLeftValign:"center",
					soloArrowLeftHOffset:20,
					soloArrowLeftVOffset:0,

					soloArrowRightHalign:"right",
					soloArrowRightValign:"center",
					soloArrowRightHOffset:20,
					soloArrowRightVOffset:0,

					touchenabled:"on",						// Enable Swipe Function : on/off


					stopAtSlide:-1,							// Stop Timer if Slide "x" has been Reached. If stopAfterLoops set to 0, then it stops already in the first Loop at slide X which defined. -1 means do not stop at any slide. stopAfterLoops has no sinn in this case.
					stopAfterLoops:-1,						// Stop Timer if All slides has been played "x" times. IT will stop at THe slide which is defined via stopAtSlide:x, if set to -1 slide never stop automatic

					hideCaptionAtLimit:0,					// It Defines if a caption should be shown under a Screen Resolution ( Basod on The Width of Browser)
					hideAllCaptionAtLilmit:0,				// Hide all The Captions if Width of Browser is less then this value
					hideSliderAtLimit:0,					// Hide the whole slider, and stop also functions if Width of Browser is less than this value


					fullWidth:"on",

					shadow:1								//0 = no Shadow, 1,2,3 = 3 Different Art of Shadows -  (No Shadow in Fullwidth Version !)

				});


				// TO HIDE THE ARROWS SEPERATLY FROM THE BULLETS, SOME TRICK HERE:
				// YOU CAN REMOVE IT FROM HERE TILL THE END OF THIS SECTION IF YOU DONT NEED THIS !
					api.bind("revolution.slide.onloaded",function (e) {


						jQuery('.tparrows').each(function() {
							var arrows=jQuery(this);

							var timer = setInterval(function() {

								if (arrows.css('opacity') == 1 && !jQuery('.tp-simpleresponsive').hasClass("mouseisover"))
								  arrows.fadeOut(300);
							},3000);
						})

						jQuery('.tp-simpleresponsive, .tparrows').hover(function() {
							jQuery('.tp-simpleresponsive').addClass("mouseisover");
							jQuery('body').find('.tparrows').each(function() {
								jQuery(this).fadeIn(300);
							});
						}, function() {
							if (!jQuery(this).hasClass("tparrows"))
								jQuery('.tp-simpleresponsive').removeClass("mouseisover");
						})
					});
				// END OF THE SECTION, HIDE MY ARROWS SEPERATLY FROM THE BULLETS
			});
	</script>
	<script>
		jQuery(function(){ 
			DevSolutionSkill.init('circle'); 
			DevSolutionSkill.init('circle2'); 
			DevSolutionSkill.init('circle3'); 
			DevSolutionSkill.init('circle4'); 
			DevSolutionSkill.init('circle5'); 
			DevSolutionSkill.init('circle6');
		});
	</script>
</body>
</html>