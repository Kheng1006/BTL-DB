<!DOCTYPE html>
<html data-wf-domain="memberbase-template.webflow.io" data-wf-page="62b23e3745c1a63ba4be4e39"
    data-wf-site="62aee78456e4207786ac4d18">

<head>
    <meta charset="utf-8" />
    <title>SPSS - Central Authentication Service</title>
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="Webflow" name="generator" />
    <!-- <link href="loginStyle.css"
        rel="stylesheet" type="text/css" /> -->
    <style>
        <?php include "loginStyle.css" ?>
    </style>
</head>

<body>
    <div class="w-users-userformpagewrap full-page-wrapper">
        <div style="display: flex;">
        <div class="w-users-userloginformwrapper admin-form-card" style="margin-left:100px;margin-bottom: 100px;">
            <!-- <div class="login-logo"><img
                src="logo.png"
                class="img-fluid"/></div> -->
            <form id="student-form" data-wf-user-form-type="login" data-wf-user-form-redirect="/resources" >
                <div class="w-users-userformheader form-card-header" >
                    <h2 class="heading h3">Central Authentication Service</h2>
                <div class="login-divider"></div>
                    <!-- <h2 class="heading h3">Student log in</h2> -->
                    <p class="login-heading">Fill in your log in details below.</p>
                    <div id="login-message"></div>
                </div><input id="username" type="text" maxlength="256" placeholder="Your username" name="Username" 
                    class="text-field w-input" required="" data-wf-user-form-input-type="email" /><input type="password"
                    maxlength="256" placeholder="Your password" name="Password" id="password"
                    class="text-field w-input" required="" data-wf-user-form-input-type="password" />
                <div class="login-divider"></div>
                    <input
                    type="submit" value="Log In" data-wait="Please wait..."
                    class="w-users-userformbutton button w-button" /><input
                    type="submit" value="Clear" style="float:right;" data-wait="Please wait..."
                    class="w-users-userformbutton button w-button" />
                <!-- <a href="https://account.hcmut.edu.vn/" class="below-card-link">Change password?</a> -->
            </form>
            </div>
       
        <!-- <div class="scroll-container" >
            
				<div class="sidebar-content"  style="padding: 40px 0;">
                <div id="list-notes" class="fl-panel">
                	<h3 style="font-weight: bold; font-size: medium; color: black;margin-bottom:0px;padding-left: 15px;">Please note</h3>
                	<p style="font-size: small;color: black;padding: 0 25px;margin-top: 2px;margin-bottom: 5px;">The Login page enables single sign-on to multiple websites at HCMUT. This means that you only have to enter your user name and password once for websites that subscribe to the Login page.

</p>
                	<p style="font-size: small;color: black;padding: 0 25px;margin-bottom: 5px;">You will need to use your HCMUT Username and password to login to this site. The "HCMUT" account provides access to many resources including the HCMUT Information System, e-mail, ... </p>
                	<p style="font-size: small;color: black;padding: 0 25px;">For security reasons, please Exit your web browser when you are done accessing services that require authentication!</p>
                </div>
                              
			  </div>
            </div> -->
        </div>
    </div>
</body>
<script src="text.js"></script>
</html>