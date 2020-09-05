<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order product</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<div class="w3-card-4">
  <div class="w3-container w3-green">
    <h2>Order your product</h2>
  </div>
  <form class="w3-container" action="/action_page.php">
    <p>      
    <label class="w3-text-green"><b>First Name</b></label>
    <input class="w3-input w3-border w3-sand" name="first" type="text"></p>
    <p>      
    <label class="w3-text-green"><b>Last Name</b></label>
    <input class="w3-input w3-border w3-sand" name="last" type="text"></p>
    <p>
    <p>      
    <label class="w3-text-green"><b>email</b></label>
    <input class="w3-input w3-border w3-sand" name="last" type="text"></p>
    <p>
    <p>      
    <label class="w3-text-green"><b>Mobile No</b></label>
    <input class="w3-input w3-border w3-sand" name="last" type="text"></p>
    <p>
    <p>      
    <label class="w3-text-green"><b>User Id</b></label>
    <input class="w3-input w3-border w3-sand" name="last" type="text"></p>
    <p> 
    <p>      
    <label class="w3-text-green"><b>Latitude</b></label>
    <input class="w3-input w3-border w3-sand" name="last" type="text"></p>
    <p>
    <p>      
    <label class="w3-text-green"><b>Longitude</b></label>
    <input class="w3-input w3-border w3-sand" name="last" type="text"></p>
    <p>
    <p> 
    <select name="productcat">
    <option value="1">Cafeterias</option>
    <option value="3">Super Markets</option>
    <option value="4">Fashion & Clothing</option>
  </select>
  <br><br>     
    <label class="w3-text-green"><b>Product</b></label>
    <input class="w3-input w3-border w3-sand" name="last" type="text"></p>
    <p>
    <p>      
    <label class="w3-text-green"><b>Quantity</b></label>
    <input class="w3-input w3-border w3-sand" name="last" type="text"></p>
    <p>
    <button class="w3-btn w3-green">Order</button></p>
  </form>
</div>
</body>
</html>