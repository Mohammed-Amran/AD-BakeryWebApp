<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- Below is Taglib directive -->	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	


<!-- This Scriptlet code checks the session expiration -->
<%

if(session == null || session.getAttribute("fullName") == null){
	
	response.sendRedirect("login.jsp?sessionExpiredMessage=Session+expired+please+logIn+again!");

	return;
}

%>


<!DOCTYPE html>

<html>

<head>

<title>Bakery Order System</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">



<%-- Link to the CSS file for this customer view page --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerViewStyle.css">


<%-- Link to the CSS file for this userInfo modal view page --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userInfoModalStyle.css">


<%-- Link to the CSS file for this customer view page --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/CheckoutModalStyle.css">


<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
	
	
<link rel = "shortcut icon" href="favicon.ico" type="image/x-icon">
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link href="https://fonts.googleapis.com/css2?family=Parisienne&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 
 <script src="https://kit.fontawesome.com/815d5311a8.js" crossorigin="anonymous"></script>
 
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

 

	
<style type="text/css">

	

body {
  font-family: "Pacifico", cursive;
  font-style: normal;
  margin: 0;
  color: #885539;
}

#heading-title:hover{

text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff;

}

#person{

 color: #4a403a;
}

#person:hover{

color: #DBDBDB;
}


#cartBasket{

color: #4a403a;
}

#cartBasket:hover{

color: #DBDBDB;
}


#box{

color: #4a403a;
}

#box:hover{

color: #DBDBDB;
}




/* ===== MENU CONTAINER ===== */
.menu-container {
  background-color: #A57A5A;
  padding: 30px;
  max-width: 1200px;
  margin: 0 auto;
  border-radius: 8px;
}

.menu-title {
  text-align: center;
  font-size: 46px;
  font-weight: bold;
  margin-bottom: 30px;
  text-shadow: 1px 1px 3px rgba(0,0,0,0.2);
   transition: transform 0.4s ease, box-shadow 0.4s ease;
}

.menu-title:hover {

  transform: translateY(-10px) scale(1.05);
  text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff;
}




/* ===== CATEGORY BUTTONS ===== */
.category-buttons {
  display: flex;
  justify-content: center;
  gap: 30px;
  margin-bottom: 30px;
}

.category-btn {
  background: #F5F5DD;
  color: #885539;
  border: none;
  padding: 12px 30px;
  font-size: 18px;
  font-weight: bold;
  cursor: pointer;
  border-radius: 4px;
  transition: all 0.3s ease;
}

.category-btn:hover {
  background: #885539;
  color: #F5F5DD;
  transform: translateY(-3px);
}





/* ===== MODAL STYLES ===== */


.modal-header {
  margin-bottom: 20px;
  background-color: #C9B194;
  
}


.modal-title {
  font-size: 24px;
  color: #4a403a;
  margin: 0;
   
}

.modal-body {
  margin-bottom: 20px;
}

.modal-body p{

font-size:19px; 
}



.modal-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}







.menu-items {
	
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 20px;
    padding: 20px;
    max-width: 1200px;
    margin: 0 auto;
 
}




.menu-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 20px;
}
	

/* Card Styles */
.card {
    flex: 1 1 calc(33.33% - 20px);
    background-color: #C9B194;
    border: 2px solid #A08963;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 350px; 
    padding: 10px;
}





.card-content img {
    width: 100%;
    height: 200px; 
    object-fit: cover; 
    border-radius: 5px;
    display: block; 
}

.card-content h1 {
    font-family: 'Pacifico', cursive; 
    font-style: normal;
    font-size: 30px;
    margin: 10px 0;
    color: #4a403a;
}

.card-action {
    font-family: 'Pacifico', cursive; 
    font-style: normal;
    margin-top: auto; 
    text-align: center;
}

.card-action button {
    background-color: #A08963;
    color: #DBDBDB;
    border: none;
    padding: 10px 20px;
    font-size: 22px;
    border-radius: 5px solid #344C3D;
    cursor: pointer;
}

.card-action button:hover {
    background-color: white;
    color: #A57A5A;
      
}

#itemDropdown {
    width: 250px;          
    height: 45px;        
    font-size: 16px;    
    padding: 8px 12px;   
}





/* CSS code of the cart +,-,trash buttons*/

.cart-item-header, .cart-item-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
}

.item-name, .item-quantity, .item-price, .item-actions {
    flex: 1;
    text-align: center;
}

.item-actions {
    display: flex;
    justify-content: center;
    gap: 8px;
}

.btn-quantity, .btn-delete {
    width: 30px;
    height: 30px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    
    /* Add transition for smooth animation */
    transition: all 0.2s ease-in-out;
    
    /* Add a subtle shadow for depth */
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.btn-quantity {
    font-weight: bold;
    font-size: 16px;
}

.btn-delete {
    font-size: 14px;
}

/* Hover effects */
.btn-increase:hover {
    background-color: #218838 !important; /* Slightly darker green */
    transform: translateY(-2px) scale(1.05);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

.btn-decrease:hover {
    background-color: #e0a800 !important; /* Slightly darker yellow */
    transform: translateY(-2px) scale(1.05);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

.btn-delete:hover {
    background-color: #c82333 !important; /* Slightly darker red */
    transform: translateY(-2px) scale(1.05);
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

/* Active/pressed effect */
.btn-increase:active, 
.btn-decrease:active, 
.btn-delete:active {
    transform: translateY(1px) scale(0.98);
    box-shadow: 0 1px 2px rgba(0,0,0,0.1);
}



/* Checkout modal css code for the items list */
.items-list {
    max-height: 300px;  /* Adjust height as needed */
    overflow-y: auto;   /* Adds vertical scroll */
    padding-right: 10px; /* Prevents content from hiding behind scrollbar */
}





</style>



</head>


<!--=========================-- Body of the WebPage --========================-->

<body style="font-family: ''Pacifico', cursive;

             font-style: normal;

             background: linear-gradient(rgba(255, 255, 255, 0.5)), 
             
             url('https://hicaps.com.ph/wp-content/uploads/2022/12/bakery-products.jpg') no-repeat center center fixed;
  
             background-size: cover;
     
             margin: 0;
  
             height: 100vh; ">



<!-- if adding item into the Cart failed! this message will be shown -->
<c:if test="${not empty sessionScope.addToCartErrorMessage}">

    <script type="text/javascript">
    
      alert('${sessionScope.addToCarErrorMessage}');
      
    </script>

</c:if>



	<!--  N A V I G A T I O N   B A R  -->
	<div class="topnav" id="myTopnav">


		<div class="navtop" id="mynavTop" style="background-color: #C9B194;">
		
		 

            <a href="" id="person" style="float: right;" data-toggle="modal" data-target="#userModal"> <i class="fas fa-user" ></i> </a> 
			
            <a href="" id="cartBasket" style="float: right;" data-toggle="modal" data-target="#cart"> <i class="fas fa-shopping-cart"  ></i> <span class="cart-items"> (<c:if test="${empty sessionScope.cartCounter }"> 0 </c:if> ${sessionScope.cartCounter} ) </span> </a> 

            <a href="${pageContext.request.contextPath}/accessInboxModal" id="box" style="float: right;" > <i class="fas fa-box-open" ></i> <span class="inbox-items"> ( <c:if test="${empty sessionScope.inboxCounter }"> 0 </c:if> ${sessionScope.inboxCounter} ) </span> </a>

            <a href="${pageContext.request.contextPath}/openNotificationModal" id="person" style="float: right;" > <i class="fas fa-bell" ></i> <span class="inbox-items"> ( <c:if test="${empty sessionScope.unReadNotificationsCounter }"> 0 </c:if> ${sessionScope.unReadNotificationsCounter} ) </span> </a>

		</div>


	</div>


<!-- =========================================================================================================================== -->
<!-- ==============================================MODAL'S(POP-UP WINDOWS)====================================================== -->



<!-- ================-NOTIFICATION Modal ==========================-->


     <!-- This JS Code opens the Notification Modal -->
   <c:if test="${openNotificationModal}">
     
     <script>
   
          $(document).ready(function() { $('#notificationsModal').modal('show'); });
 
     </script>
     
   </c:if>



	<!-- Notification Modal -->
	<div class="modal fade" id="notificationsModal" tabindex="-1" role="dialog" aria-hidden="true">
		
		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">
			
				<div class="modal-header" style="background-color: #C9B194;">
			
					<h3 class="modal-title" style="font-weight: bold; color: #4a403a; font-family: 'Pacifico', cursive;">Notifications</h3>
				
				</div>

				<div class="modal-body">
					
					<div class="notification-body">

						<c:choose>
							
							<c:when test="${not empty sessionScope.unReadNotificationsList}">
								
								<c:forEach var="n" items="${sessionScope.unReadNotificationsList}">

									<div class="notification-item" style="display: flex; justify-content: space-between; align-items: center; padding: 10px; border-bottom: 1px solid #ddd;">

										<div style="flex-grow: 1;">
											
											<p style="margin: 0;">
												
												<strong>Item:</strong> ${n.itemName}
											
											</p>
											
											<p style="margin: 0;">
												
												<strong>Address:</strong> ${n.deliveryAddress}
											
											</p>
											
											<p style="margin: 0;">
												
												<strong>Status:</strong> ${n.status}
											
											</p>
										
										</div>

										
										<form method="post" action="${pageContext.request.contextPath}/markNotificationAsRead">
											
											<input type="hidden" name="userId" value="${n.userId}" /> 
											
											<input type="hidden" name="orderId" value="${n.orderId}" />
											
											<button type="submit" class="btn btn-success">OK</button>
											
										</form>
										
									</div>

								</c:forEach>
								
							</c:when>

							<c:otherwise>
								
								<p style="text-align: center; padding: 20px;">No Notifications.</p>
								
							</c:otherwise>
							
						</c:choose>

					</div>
					
				</div>

				<div class="modal-footer">
				
					<button type="button" class="btn btn-secondary" data-dismiss="modal">
					    
					    Close
					
					</button>
					
				</div>
				
			</div>

		</div>
		
	</div> <!-- Closing brace of the Notifications Modal -->







	<!-- ===============================================================-->





<!-- ========- USER INFO MODAL -======= -->

	<!-- Modal(pop-up window) for the User Info -->
	<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">

		<div class="modal-dialog" role="document" >

			<div class="modal-content">

				<div class="modal-header" style="background: #C9B194;">

					<h5 class="modal-title" id="userModalLabel" style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">User Information</h5>

				</div>

				<div class="modal-body">

                   
					<c:choose>
					
					<c:when test="${not empty sessionScope.fullName && not empty sessionScope.email && not empty sessionScope.phoneNo }">
					
					<p>
						<strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Name:</strong>
					    <span style="font-weight: 600; color: #A08963;"> <c:out value="${sessionScope.fullName}" /> </span>
					</p>
					
					<p>
						<strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Email:</strong>
						<span style="font-weight: 600; color: #A08963;"> <c:out value="${sessionScope.email}" /> </span>
					</p>
					
					<p>
						<strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Phone:</strong>
						<span style="font-weight: 600; color: #A08963;"> <c:out value="${sessionScope.phoneNo}" /> </span>
					</p>
					
					</c:when>

                    <c:otherwise>
                     
					   <p>User details not available.</p>

                    </c:otherwise>
                     
                     
					</c:choose>

                     

				</div>


				<div class="modal-footer" style="display: flex; justify-content: space-between;">


                    <form method="get" action="${pageContext.request.contextPath}/openEditUserProfileModal">
                                           
                           <button type="submit" class="btn btn-primary" title="Edit Profile" style="position: relative; left: -97px;">
						
						      <i class="fas fa-pencil-alt"></i>
						
					       </button>
                                       
                    </form>

					

					<div style="margin-right: -97px; display: flex; gap: 10px;">
					
						<button type="button" class="btn btn-secondary" data-dismiss="modal">
						
						     Close
						     
						</button>

						<form name="logOutForm" method="get" action="${pageContext.request.contextPath}/logout" style="display: inline;">
						
							<button type="submit" class="btn btn-danger">
							   
							   Logout
							
							</button>
							
						</form>
						
					</div>
					
				</div>


			</div>

		</div>

	</div> <!-- Closing tag of the User-info Modal -->



   <!-- This JS Code opens the Edit User Profile Modal -->
   <c:if test="${openEditModal}">
     
     <script>
   
          $(document).ready(function() { $('#editProfileModal').modal('show'); });
 
     </script>
     
   </c:if>
   
   
   
	<!-- Modal for Editing User Info -->
	<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
		
		<div class="modal-dialog modal-lg" role="document" style="max-width: 900px;">
			
			<div class="modal-content">
				
				<div class="modal-header" style="background: #C9B194; padding: 20px;">
					
					<h5 class="modal-title" id="userModalLabel" style="color: #4a403a; font-family: 'Pacifico', cursive; font-size: 24px;">
					
					   Edit Profile
						
				    </h5>
				    
				</div>

				<div class="modal-body" style="padding: 25px;">
					
					<table class="table table-bordered" style="font-size: 16px;">
						
						<thead>
						
							<tr class="table-light">
							
								<th style="padding: 15px; font-size: 18px;">Field</th>
								
								<th style="padding: 15px; font-size: 18px;">Current Data</th>
								
								<th style="padding: 15px; font-size: 18px;">Update To</th>
								
							</tr>
							
						</thead>
						
						<tbody>
						
							<tr>
								<td style="padding: 15px;">Full Name</td>
								
								<td style="padding: 15px;">${requestScope.retrievedFullName}</td>
								
								<td style="padding: 15px;">
								
									<form action="${pageContext.request.contextPath}/updateUserFullName" method="post" style="display: flex; gap: 10px; align-items: center;">
										
										<input type="text" name="newFullName" class="form-control" value="${requestScope.newFullName}" required style="padding: 10px; font-size: 16px; height: 45px; flex: 1;" />
										
										<button type="submit" class="reload-img" style="margin-top: 0px;">
											
											<img src="${pageContext.request.contextPath}/images/primaryStaticReload.png" alt="Reload" style="width: 45px; height: 45px;">
										
										</button>
									
									</form>
								
								</td>
							
							</tr>
							
							
							<tr>
								
								<td style="padding: 15px;">Email</td>
								
								<td style="padding: 15px;">${requestScope.retrievedEmail}</td>
								
								<td style="padding: 15px;">
									
									<form action="${pageContext.request.contextPath}/updateUserEmail" method="post" style="display: flex; gap: 10px; align-items: center;">
										
										<input type="email" name="newEmail" class="form-control" value="${requestScope.newEmail}" required style="padding: 10px; font-size: 16px; height: 45px; flex: 1;" />
										
										<c:if test="${not empty emailError}">
											
											<div style="color: red; font-size: 15px; margin-top: 5px;">${emailError}</div>
										
										</c:if>
										
										<button type="submit" class="reload-img" style="margin-top: 0px;">
											
											<img src="${pageContext.request.contextPath}/images/primaryStaticReload.png" alt="Reload" style="width: 45px; height: 45px;">
										
										</button>
									
									</form>
								
								</td>
							
							</tr>
							
							
							<tr>
								
								<td style="padding: 15px;">Password</td>

								<td style="padding: 15px;">
								
								    <span id="hiddenPassword" style="letter-spacing: 2px;">
                                    
                                    <c:forEach begin="1" end="${fn:length(requestScope.retrievedPassword)}">•</c:forEach>

                                    </span>
 
								
								    <span id="realPassword" style="display: none;">${requestScope.retrievedPassword}</span>

									<button onclick="togglePassword()" style="border: none; background: none; cursor: pointer;">
										
										<i id="eyeIcon" class="fa-solid fa-eye"></i>
									
									</button>
									
							    </td>


								<td style="padding: 15px;">
									
									<form action="${pageContext.request.contextPath}/updateUserPassword" method="post" style="display: flex; gap: 10px; align-items: center;">
										
										<input type="password" name="newPassword" class="form-control" value="${requestScope.newPassword}" required  style="padding: 10px; font-size: 16px; height: 45px; flex: 1;" />
										
										<button type="submit" class="reload-img" style="margin-top: 0px;">
											
											<img src="${pageContext.request.contextPath}/images/primaryStaticReload.png" alt="Reload" style="width: 45px; height: 45px;">
										
										</button>
									
									</form>
								
								</td>
							
							</tr>
							
							
							<tr>
								
								<td style="padding: 15px;">Phone No</td>
								
								<td style="padding: 15px;">${requestScope.retrievedPhoneNo}</td>
								
								<td style="padding: 15px;">
									
									<form action="${pageContext.request.contextPath}/updateUserPhoneNo" method="post" style="display: flex; gap: 10px; align-items: center;">
										
										<input type="text" name="newPhoneNo" class="form-control" value="${requestScope.newPhoneNo}" required style="padding: 10px; font-size: 16px; height: 45px; flex: 1;" />
										
										<c:if test="${not empty phoneError}">
											
											<div style="color: red; font-size: 15px; margin-top: 5px;">${phoneError}</div>
										
										</c:if>
										
										<button type="submit" class="reload-img" style="margin-top: 0px;">
											
											<img src="${pageContext.request.contextPath}/images/primaryStaticReload.png" alt="Reload" style="width: 45px; height: 45px;">
										
										</button>
									
									</form>
								
								</td>
							
							</tr>
						
						
						</tbody>
					
					</table>
				
				</div>

				<div class="modal-footer" style="padding: 20px; display: flex; justify-content: flex-end;">
					
					<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 8px 20px; font-size: 16px;">
					
					   Cancel
					   
					</button>
				
				</div>
			
			</div>
		
		</div>
	
	</div> <!-- Closing tag of the User-info Modal -->


<!-- This JS below replaces the static reload IMG with the reload GIF onClick -->
<script>

document.querySelectorAll('.reload-img').forEach(button => {
 
	const img = button.querySelector('img');
  
	const originalSrc = img.src;
  
	const clickedSrc = '${pageContext.request.contextPath}/images/gifs/reloadGif.gif';

 
	button.addEventListener('click', function (e) {
    
		e.preventDefault(); // Stop form submission until the GIF animates

   
		// Show reload GIF on button
        img.src = clickedSrc;

   
		// Step 1: Show the reload GIF for ~500ms
        setTimeout(() => {
      
        	
        // Step 2: Display full-screen strike GIF
        const overlay = document.getElementById('strikeOverlay');
        
        overlay.style.display = 'flex';
        
        setTimeout(() => { overlay.style.opacity = '1';  overlay.style.visibility = 'visible'; }, 10); // slight delay to trigger transition


        
       // Step 3: Keep strike GIF for ~1.5s, then submit form
       setTimeout(() => {
                         
    	                overlay.style.opacity = '0';
    	                overlay.style.visibility = 'hidden';

    	                setTimeout(() => { overlay.style.display = 'none'; }, 500); // match transition time


                          const form = button.closest('form');
       
                          if (form) { form.submit(); }

                         }, 2600); // Length of strike.gif

   
           }, 500); // Delay before showing strike
  
	});

});
</script>



  
	

<!-- ------------------------------------------------------------ -->


<!-- This JS code below is used to hide & un hide the password -->
<script>
  let isVisible = false;

  function togglePassword() {
    const hiddenSpan = document.getElementById("hiddenPassword");
    const realSpan = document.getElementById("realPassword");
    const eyeIcon = document.getElementById("eyeIcon");

    if (isVisible) {
      realSpan.style.display = "none";
      hiddenSpan.style.display = "inline";
      eyeIcon.classList.remove("fa-eye-slash");
      eyeIcon.classList.add("fa-eye");
    } else {
      realSpan.style.display = "inline";
      hiddenSpan.style.display = "none";
      eyeIcon.classList.remove("fa-eye");
      eyeIcon.classList.add("fa-eye-slash");
    }

    isVisible = !isVisible;
  }
</script>






<!-- Rocket Strike GIF modal -->


<!-- Strike GIF Overlay Modal -->
<div id="strikeOverlay" style="position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; background: rgba(255, 255, 255, 0.2);
    
     backdrop-filter: blur(6px);
 
     z-index: 9999;
 
     justify-content: center;
  
     align-items: center;

     opacity: 0;
  
     visibility: hidden;
 
     transition: opacity 0.5s ease-in-out, visibility 0.5s ease-in-out; ">
 
     <img src="${pageContext.request.contextPath}/images/gifs/PrimaryRocketLauncch.gif" alt="Reloading..." style="width: 250px; height: 250px;" />
  
</div>



<!-- / / / / / / / / / / / / / /  ------------ Temporary Construction site Ends Here ------------ / / / / / / / / / / / / / / -->



	<!-- ################################################################################################################################ -->






 <!-- This JS Code opens the Inbox Modal -->
   <c:if test="${showInboxModal}">
     
     <script>
   
          $(document).ready(function() { $('#Inbox').modal('show'); });
 
     </script>
     
   </c:if>





<!-- Inbox Modal -->
	<div class="modal fade" id="Inbox" tabindex="-1" role="dialog" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header">

					<h3 class="modal-title" style="font-weight: bold;">Your Orders</h3>

				</div>

				<div class="modal-body" style="display: flex; justify-content: space-between; gap: 20px;">
 
 
					<!-- Left Section: Cart Items -->
					<div style="width: 100%;">

						<h5>Your Ordered Items</h5>

						<div class="checkout-cart-body">


							<!-- Table Header -->
							<div class="cart-item-header" style="display: flex; justify-content: space-between; padding: 12px 20px; background-color: #f8f9fa; border-bottom: 1px solid #dee2e6; font-weight: bold; margin-bottom: 10px;">


								<span style="width: 50%;">Item Name</span> 
								
								<span style="width: 20%; text-align: center;">Quantity</span>
								
								<span style="width: 30%; text-align: right;">Sum</span>
								
								<span style="width: 30%; text-align: right;">Status</span>


							</div>


							<!-- Initialize total price -->
							<c:set var="total" value="0" />



							<div class="items-list">

								<!-- Loop through ordered items -->
								<c:forEach var="o" items="${sessionScope.retrievedOrderedItems}">


									<c:set var="itemTotal" value="${o.itemPriceSum}" />

									<c:set var="total" value="${total + itemTotal}" />


									<div class="cart-item-row" style="display: flex; justify-content: space-between; align-items: center; padding: 12px 20px; border-bottom: 1px solid #eee; margin-bottom: 8px;">


										<span style="width: 50%; font-weight: 500;">${o.itemName}</span>

										<span style="width: 20%; text-align: center;">${o.selectedQuantity}</span>

										<span style="width: 30%; text-align: right; color: #D5451B;">${o.itemPriceSum} IQD</span>
										
										<span style="width: 20%; text-align: center;">${o.status}</span>

                                        <c:choose>
                                        
                                          <c:when test="${o.status eq 'pending' }">
                                          
                                              <img src="${pageContext.request.contextPath}/images/gifs/pending.gif" alt="Inbox" style="width: 40px; height: 40px;">
                                          
                                          </c:when>
                                          
                                          <c:when test="${o.status eq 'processing' }">
                                          
                                              <img src="${pageContext.request.contextPath}/images/gifs/baking.gif" alt="Inbox" style="width: 40px; height: 40px;">
                                          
                                          </c:when>
                                          
                                          
                                          <c:when test="${o.status eq 'onway' }">
                                          
                                              <img src="${pageContext.request.contextPath}/images/gifs/onway.gif" alt="Inbox" style="width: 40px; height: 40px;">
                                          
                                          </c:when>
                                          
                                          <c:when test="${o.status eq 'delivered' }">
                                          
                                              <img src="${pageContext.request.contextPath}/images/gifs/delivered.gif" alt="Inbox" style="width: 40px; height: 40px;">
                                          
                                          </c:when>
                                          
                                          <c:when test="${o.status eq 'cancelled' }">
                                          
                                              <img src="${pageContext.request.contextPath}/images/gifs/cancelled.gif" alt="Inbox" style="width: 40px; height: 40px;">
                                          
                                          </c:when>
                                        
                                        </c:choose>

									</div>


								</c:forEach>


							</div>


							<!-- Total price display -->
							<div style="margin-top: 25px; text-align: right; padding: 15px 20px; background-color: #f8f9fa; border-top: 1px solid #dee2e6; font-size: 18px;">

								<strong>Total Price: </strong> 
								
								<span id="checkoutTotalPrice" style="color: #D5451B; font-weight: bold;">${total}</span> IQD

							</div>


						</div> 





					</div>



					
				</div>


				<div class="modal-footer">

					<button type="button" class="btn btn-secondary" data-dismiss="modal"> Close </button>

				</div>


			</div>

		</div>

	</div> <!-- Closing Tag of the Inbox Modal -->



<!-- ################################################################################################################################ -->



<c:if test="${not empty sessionScope.openCartModal}">
    
    <script>
					$(document).ready(function() {
						$('#cart').modal('show');
					});
	</script>

    <c:remove var="openCartModal" scope="session" />
</c:if>




<!-- ========- CART MODAL -=========== -->

<!-- Cart Modal -->
	<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-hidden="true">
		
		<div class="modal-dialog modal-lg" role="document" >
			
			<div class="modal-content">
				
				<div class="modal-header" style="background-color: #C9B194;">
					
					<h3 class="modal-title" style="font-weight: bold; color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;"> Cart</h3>
				
				</div>


				<div class="modal-body">
				
					
					<div class="cart-body">
					
						<c:choose>
						
							<c:when test="${not empty sessionScope.retrievedCartItems}">
							
								<div class="cart-item-header" style="background-color: #C9B194;">
								
									<span class="item-name"><strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Item Name</strong></span>
									 
									<span class="item-quantity"><strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Quantity</strong></span>
									
									<span class="item-price"><strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Price</strong></span>
									
									<span class="item-actions"><strong style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">Actions</strong></span>
								
								</div>

								<!-- Looping through the items -->
								<c:forEach var="x" items="${sessionScope.retrievedCartItems}">
									
									<div class="cart-item">
										
										<div class="cart-item-row">
											
											<span class="item-name"> <strong style="color: #A08963; font-size: 22px; font-family: 'Pacifico', cursive; font-style: normal;">
													                 
													                    <c:out value="${x.itemName}" />
											        
											                         </strong>
											</span> 
											
											<span class="item-quantity" style="color: #4a403a; font-size: 22px;">
											
											     <c:out	value="${x.selectedQuantity}" />
											
											</span> 
											
											<span class="item-price" style="color: #D5451B; font-size: 22px;">
											
											     <c:out value="${x.itemPrice * x.selectedQuantity}" /> IQD
											
											</span>


											<div class="item-actions">


												<!-- Increment Button -->
												<form action="${pageContext.request.contextPath}/incrementItem" method="post" style="display: inline;">
													
													<input type="hidden" name="itemId" value="${x.itemId}">
													
													<button class="btn btn-quantity btn-increase" style="background-color: #28a745; color: white;">
														
														+
														
													</button>
												
												</form>


												<!-- Decrement Button -->
												<form action="${pageContext.request.contextPath}/decrementItem" method="post" style="display: inline;">
													
													<input type="hidden" name="itemId" value="${x.itemId}">
													
													<button class="btn btn-quantity btn-decrease" style="background-color: #ffc107; color: black;">
														
														-
														
													</button>
													
												</form>


												<!-- Remove Button -->
												<form action="${pageContext.request.contextPath}/removeItem" method="post" style="display: inline;">
													
													<input type="hidden" name="itemId" value="${x.itemId}">
													
													<button class="btn btn-delete" style="background-color: #dc3545; color: white;">
														
														<i class="fas fa-trash"></i>
													
													</button>
												
												</form>

											</div> <!-- closing tag of the item-actions div -->



										</div>
										
										
									</div>
								
									
								</c:forEach>


							</c:when>

							<c:otherwise>
							
								<div class="empty-cart">
								
									<i class="fas fa-shopping-cart"></i>
									
									<p>Your cart is empty</p>
									
								</div>
								
							</c:otherwise>
							
						</c:choose>
						
					</div>  <!-- Closing tag of the cart body -->


					<!-- Total Price -->
					<div class="total-price-container">
						
						<div class="total-line">
							
							<strong style="color: #4a403a; font-size: 24px; font-family: 'Pacifico', cursive; font-style: normal;">Total:</strong>
							
							<span id="totalPrice" style="color: #D5451B; font-size: 22px;">
								
								<c:if test="${not empty sessionScope.retrievedCartItems}">
									
									<c:set var="total" value="0" />
									
									<c:forEach var="x" items="${sessionScope.retrievedCartItems}">
										
										<c:set var="total" value="${total + (x.selectedQuantity * x.itemPrice)}" />
									
									</c:forEach>
                           
                           
                                       ${total}
               
                               </c:if>
                
                              
                               <c:if test="${empty sessionScope.retrievedCartItems}">0</c:if>
								
								   IQD
							</span>
							
						</div>
						
					</div>
					
					
					
				</div> <!-- Closing tag of the modal body -->


				<div class="modal-footer">
					
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					
					<form method="get" action="${pageContext.request.contextPath}/goToCheckout">
					
					<button type="submit" class="btn btn-primary checkout-btn">Checkout</button>
				
				    </form>
				
				</div>
				
				
			</div>
			
		</div>
		 
		
	</div> <!-- Closing Tag of the Cart Modal -->






<!-- if incrementing items in the Cart failed! this message will be shown -->
<c:if test="${not empty incrementError}">

    <script type="text/javascript">
    
      alert('${incrementError}');
      
    </script>

</c:if>



<!-- if decrementing items in the Cart failed! this message will be shown -->
<c:if test="${not empty decrementError}">

    <script type="text/javascript">
    
      alert('${decrementError}');
      
    </script>

</c:if>



<!-- if removing items in the Cart failed! this message will be shown -->
<c:if test="${not empty removingError}">

    <script type="text/javascript">
    
      alert('${removingError}');
      
    </script>

</c:if>




<!-- ################################################################################################################################ -->





<c:if test="${not empty sessionScope.showCheckoutModal}">
    <script>
        $(function() {
            $('#checkoutModal').modal('show');
        });
    </script>

    <c:remove var="showCheckoutModal" scope="session" />
</c:if>




<!-- ========- CHECKOUT MODAL -=========== -->


<!-- Checkout Modal -->
<div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-hidden="true">

  <div class="modal-dialog" role="document" style="max-width: 90vw; width: 90vw;">

        <div class="modal-content">
        
            <div class="modal-header" style="padding: 20px 30px;">
            
                <h3 class="modal-title" style="font-weight: bold;">Checkout</h3>
                
            </div>

            <div class="modal-body" style="display: flex; justify-content: space-between; gap: 50px; padding: 30px;"> 
               
                <!-- Left Section: Cart Items -->
                <div style="flex: 1.1;">
                    
                    <h5 style="margin-bottom: 20px;">Your Items</h5>
                    
                    <div class="checkout-cart-body">
                        
                        <!-- Table Header -->
                       
                        <div class="cart-item-header" style="display: flex; justify-content: space-between; 
                                                     
                             padding: 12px 20px; background-color: #f8f9fa; border-bottom: 1px solid #dee2e6;
                            
                             font-weight: bold; margin-bottom: 10px;">
                             
                             
                            <span style="width: 50%;">Item Name</span>
                            
                            <span style="width: 20%; text-align: center;">Quantity</span>
                            
                            <span style="width: 30%; text-align: right;">Price</span>
                            
                            
                        </div>
                        
                        
                         <!-- Initialize total price -->
                         <c:set var="total" value="0" />
                        
                        
                        
                        <div class="items-list">

								<!-- Loop through cart items -->
								<c:forEach var="c" items="${sessionScope.retrievedItemsForCheckout}">
								
									<c:set var="itemTotal" value="${c.selectedQuantity * c.itemPrice}" />
									
									<c:set var="total" value="${total + itemTotal}" />

									<div class="cart-item-row" style="display: flex; justify-content: space-between; align-items: center; padding: 12px 20px; border-bottom: 1px solid #eee; margin-bottom: 8px;">
										
										<span style="width: 50%; font-weight: 500;">${c.itemName}</span>
										
										<span style="width: 20%; text-align: center;">${c.selectedQuantity}</span>
										
										<span style="width: 30%; text-align: right; color: #D5451B;">${itemTotal} IQD</span>
										
									</div>
									
								</c:forEach>

							</div>
                                             
                        
                        <!-- Total price display -->
                        <div style="margin-top: 25px; text-align: right; padding: 15px 20px; background-color: #f8f9fa; border-top: 1px solid #dee2e6; font-size: 18px;">
                           
                            <strong>Total Price: </strong> 
                           
                            <span id="checkoutTotalPrice" style="color: #D5451B; font-weight: bold;">${total}</span> IQD
                            
                        </div>
                        
                        
                    </div>
                    
                    
                </div>
                


                <!-- Right Section: User Info Form -->
                <div style="flex: 0.9;">
                   
                    <h5 style="margin-bottom: 20px;">Delivery Information</h5>
                  
                    
                    <form id="deliveryForm" method="post" action="${pageContext.request.contextPath}/orderItems">
                        
                        <div class="form-group" style="margin-bottom: 20px;">
                            
                            <label for="citySelect" style="display: block; margin-bottom: 8px; font-weight: 500;">City</label> 
                           
                            <select id="citySelect" class="form-control" name="location" required style="padding: 10px; height: 45px;">
                                
                                
                                <option value="">Select District</option>
                                
                                <option value="Sulaymaniyah">Sulaymaniya</option>
                                
                                <option value="Erbil">Erbil</option>
                               
                                <option value="Duhok">Duhok</option>
                                
                                
                            </select>
                            
                        </div>
                        
                        <div class="form-group" style="margin-bottom: 25px;">
                           
                            <label for="addressInput" style="display: block; margin-bottom: 8px; font-weight: 500;">Address</label>
                          
                            <textarea id="addressInput" class="form-control" name="address" rows="4" placeholder="Enter your full address" required style="padding: 12px; min-height: 100px;"></textarea>
                        
                        </div>
                        
                        
                        <button type="submit" class="btn btn-success" style="width: 100%; padding: 12px; font-size: 16px; font-weight: 500;">Order</button>
                   
                   
                    </form>
                    
                    
                </div>
                
                
            </div>



            <div class="modal-footer" style="padding: 15px 30px;">
            
                <button type="button" class="btn btn-secondary" data-dismiss="modal" style="padding: 8px 20px;">Close</button>
                
            </div>
            
            
        </div>
        
    </div>
    
</div>



<!-- =========================================================================================================================== -->
<!-- =========================================================================================================================== -->






	<!--=========================--  M A I N   C O N T E N T  --====================-->

	<div id="heading">

		<h1 id="heading-title" style="font-family: 'Pacifico', cursive; font-style: normal; margin-top: 40px; color: #4a403a;"> Suly Bakery</h1>

	</div>


	<!--  I T E M   C A R D S  -->

	<div id="main" style="margin-top: 40px;">

   <!-- Main Content - Menu Section -->
<main class="menu-container" style="background-color: #C9B194;">

 <div >
 
    <h2 class="menu-title" style="font-family: 'Pacifico', cursive; font-style: normal; font-weight: bold; font-size: 46px; color: #4a403a;">  Our Menu </h2>
    
    
  
    
    <!-- Category Buttons -->
     <div style="display: flex; justify-content: center; gap: 30px; margin-bottom: 8px;">
               
           <form method="get" action="customerViewCategoryController">    
            
                <input type="hidden" name="category" value="Breads">
                
                <button type="submit" class="category-btn" style="font-family: 'Pacifico', cursive; font-style: normal;
                                                                  background-color: white; color: #4a403a; border: 2px solid white; 
                                                                  padding: 8px 20px;  font-size: 18px; font-weight: bold; cursor: pointer;">
                        
                    Breads
                                    
                </button>
                
           </form>     
            
              <form method="get" action="customerViewCategoryController">  
                  
                <input type="hidden" name="category" value="Cakes">
                
                <button type="submit" class="category-btn" style="font-family: 'Pacifico', cursive; font-style: normal;
                                                                  background-color: white; color: #4a403a; border: 2px solid white; 
                                                                  padding: 8px 20px;  font-size: 18px;  font-weight: bold; cursor: pointer;">
                        
                    Cakes
                    
                </button>
                
              </form>  
      </div>
    
    
    
    
    
    <div class="menu-items" style="background-color: #F2F3F1">
       
       
       <div class="menu-grid" style="margin-top: 40px;">
       
       <c:choose>

    
    <c:when test="${showCategory == 'Breads' || empty showCategory }">
    
        <c:forEach var="bread" items="${retrievedBreads}">
        
            <div class="card">
            
                <div class="card-content">
                
                    <c:if test="${fn:startsWith(bread.imgURL, '/images/bread/')}">
											
							<img src="${pageContext.request.contextPath}${desert.imgURL}" class="item-img" />
											
					</c:if>

					<c:if test="${not fn:startsWith(bread.imgURL, '/images/bread/')}">
												
							<img src="${bread.imgURL}" class="item-img" />
											
					</c:if>
                    
                    <h1>${bread.itemName}</h1>
                    
                </div>
                
                <div class="card-action">
                
                    <button class="btn btn-primary" data-toggle="modal" data-target="#modal_${bread.breadsId}">
                        Select
                    </button>
                    
                </div>
                
            </div>

            
            <div class="modal fade" id="modal_${bread.breadsId}" tabindex="-1" role="dialog" aria-hidden="true">
            
                <div class="modal-dialog" role="document">
                
                    <div class="modal-content">

                        <div class="modal-header">
                        
                            <h5 class="modal-title" style="font-family: 'Pacifico', cursive; font-style: normal;">
                                ${bread.itemName}
                                
                            </h5>
                            
                        </div>

                        <form method="post" action="${pageContext.request.contextPath}/addToCartController" autocomplete="off">
                        
                            <div class="modal-body">
                            
                                <p>${bread.itemDesc}</p>
                                
                                <select class="price-dropdown" name="selectedQuantity">
                                
                                    <option value="2">2 pieces ~ <c:out value="${2 * bread.itemPrice}" />iqd</option>
                                    
                                    <option value="4">4 pieces ~ <c:out value="${4 * bread.itemPrice}" />iqd</option>
                                    
                                    <option value="8">8 pieces ~ <c:out value="${8 * bread.itemPrice}" />iqd</option>
                                    
                                    
                                </select>
                                
                            </div>

                            <div class="modal-footer">
                            
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="hidden" name="itemName" value="${bread.itemName}">
                                
                                <input type="hidden" name="itemType" value="Bread">
                                
                                <button type="submit" class="btn btn-primary">Add to Cart</button>
                                
                            </div>
                            
                        </form>

                    </div>
                    
                </div>
                
            </div>
            
        </c:forEach>
        
    </c:when>

   
    <c:when test="${showCategory == 'Cakes'}">
    
        <c:forEach var="desert" items="${retrievedDeserts}">
        
            <div class="card">
            
                <div class="card-content">

											<c:if test="${fn:startsWith(desert.imgURL, '/images/cakes/')}">
											
												<img src="${pageContext.request.contextPath}${desert.imgURL}" class="item-img" />
											
											</c:if>

											<c:if test="${not fn:startsWith(desert.imgURL, '/images/cakes/')}">
												
												<img src="${desert.imgURL}" class="item-img" />
											
											</c:if>


											<h1>${desert.itemName}</h1>
                    
                </div>
                
                <div class="card-action">
                
                    <button class="btn btn-primary" data-toggle="modal" data-target="#modal_${desert.desertsId}">
                    
                        Select
                        
                    </button>
                    
                </div>
                
            </div>

            
            <div class="modal fade" id="modal_${desert.desertsId}" tabindex="-1" role="dialog" aria-hidden="true">
            
                <div class="modal-dialog" role="document">
                
                    <div class="modal-content">

                        <div class="modal-header">
                        
                            <h5 class="modal-title" style="font-family: 'Pacifico', cursive; font-style: normal;">
                            
                                ${desert.itemName}
                                
                            </h5>
                            
                        </div>

                        <form method="post" action="${pageContext.request.contextPath}/addToCartController" autocomplete="off">
                        
                            <div class="modal-body">
                            
                                <p>${desert.itemDesc}</p>
                                
                                <select class="price-dropdown" name="selectedQuantity">
                                
                                    <option value="2">2 pieces ~ <c:out value="${2 * desert.itemPrice}" />iqd</option>
                                    
                                    <option value="4">4 pieces ~ <c:out value="${4 * desert.itemPrice}" />iqd</option>
                                    
                                    <option value="8">8 pieces ~ <c:out value="${8 * desert.itemPrice}" />iqd</option>
                                                                    
                                </select>
                                
                            </div>

                            <div class="modal-footer">
                            
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                
                                <input type="hidden" name="itemName" value="${desert.itemName}">
                                
                                <input type="hidden" name="itemType" value="Desert">
                                
                                <button type="submit" class="btn btn-primary">Add to Cart</button>
                                
                            </div>
                            
                        </form>

                    </div>
                    
                </div>
                
            </div>
            
        </c:forEach>
        
    </c:when>

</c:choose>

       
   </div>
       
       
    </div> 
    
    
    
    
  
    
    
    </div>
    
</main>

    
   
   
    </div> <!-- Closing brace of the main -->







<script>

//This 'openModal()' method! allows us to select the items & and be able to Add them into the cart.

 let selectedItem = {}; // Object to hold the details of the selected item.

 // Function to open the modal and populate details
 function openModal(id, title, description) {
	 
	 selectedItem.id = id;
	    selectedItem.title = title;
	    
	    // Get the specific modal for this item
	    var modal = $('#itemModal' + id);
	    
	    // Update the modal content
	    modal.find('.modal-title').text(title);
	    modal.find('#itemDescription').text(description);
	    
	    // Open the correct modal
	    modal.modal('show');
    
    
 }//closing brace of the 'openModal()' method.




</script>

	


	<!-- Footer -->
	<div id="footer" style="margin-top: 40px; background-color: #C9B194;" >

		<!-- Phone Numbers -->
		<div class="footer__contact">
		
			<i style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">+964 750 141 8006</i> <br> <i style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">+964 771 152 8011</i>
			
		</div>

		<!-- Social Media Icons -->
		<div class="footer__social">
		
			<ul class="horizontal-list text-center social-icons">
			
				<!-- Instagram Icon -->
				<li style="color: #4a403a;"> <a href="#"> <i class="fab fa-instagram"></i> </a> </li>
				
				<!-- YouTube Icon -->
				<li style="color: #4a403a;"> <a href="#"> <i class="fab fa-youtube"></i> </a> </li>
				
				<!-- Facebook Icon -->
				<li style="color: #4a403a;"> <a href="#"> <i class="fab fa-facebook"></i> </a> </li>
				
			</ul>
			
		</div>

		<!-- Email -->
		<div class="footer__mail">
		
			<i style="color: #4a403a; font-family: 'Pacifico', cursive; font-style: normal;">SulyBakery@gmail.com</i>
			
		</div>

	</div>



</body>

</html>