<?php
    session_start();
?>

<!DOCTYPE html>
<!-- This site was created in Webflow. https://www.webflow.com --><!-- Last Published: Sat Oct 14 2023 07:59:48 GMT+0000 (Coordinated Universal Time) -->
<html data-wf-domain="dos-groovy-site-815b31.webflow.io" data-wf-page="652a49b013ed5242e0b913a0"
    data-wf-site="652a49b013ed5242e0b91280" data-wf-status="1">

<head>
    <meta charset="utf-8" />
    <title>HCMUT_SPSS</title>
    <!-- <meta
        content="Take your startup to new heights with Dashdark X 🌑📱! Our Devlink Dark Mode Dashboard Webflow Template is the ultimate solution for stunning SaaS dashboards."
        name="description" />
    <meta content="Products - Dashdark X Webflow Template" property="og:title" />
    <meta
        content="Take your startup to new heights with Dashdark X 🌑📱! Our Devlink Dark Mode Dashboard Webflow Template is the ultimate solution for stunning SaaS dashboards."
        property="og:description" />
    <meta
        content="https://assets-global.website-files.com/641a0c8100e68df2708b96bf/642312766efb2c24caff692e_featured-image-dashdark-webflow-template.png"
        property="og:image" />
    <meta content="Products - Dashdark X Webflow Template" property="twitter:title" />
    <meta
        content="Take your startup to new heights with Dashdark X 🌑📱! Our Devlink Dark Mode Dashboard Webflow Template is the ultimate solution for stunning SaaS dashboards."
        property="twitter:description" />
    <meta
        content="https://assets-global.website-files.com/641a0c8100e68df2708b96bf/642312766efb2c24caff692e_featured-image-dashdark-webflow-template.png"
        property="twitter:image" />
    <meta property="og:type" content="website" />
    <meta content="summary_large_image" name="twitter:card" /> -->
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="Webflow" name="generator" />
     
    <link href="style.css" rel="stylesheet" type="text/css" />
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2, h3 {
            color: #333;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 15px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #000;
        }

        input[type="text"], select, input[type="submit"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            background-color: #fff;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

        li:hover {
            background-color: #f0f0f0;
        }

        table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #4caf50;
            color: #fff;
        }
    </style>
    <script type="text/javascript">
        !function (o, c) { var n = c.documentElement, t = " w-mod-";
        n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);
    </script>
    
    <!-- Need to change -->
    <link href="https://assets-global.website-files.com/652a49b013ed5242e0b91280/652a49b013ed5242e0b912f0_favicon-dashdark-webflow-template.svg"
        rel="shortcut icon"
        type="image/x-icon"
    />

    <!-- Need to change -->
    <link
        href="https://assets-global.website-files.com/652a49b013ed5242e0b91280/652a49b013ed5242e0b912f1_webclip-dashdark-webflow-template.svg"
        rel="apple-touch-icon" />
</head>






<body>
    <div style="opacity:0" class="page-wrapper">
        <div data-w-id="8902ab60-ff18-1ad1-7b19-201b504196ac" data-animation="over-right" data-collapse="medium"
            data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="sidebar-wrapper w-nav">
            <div class="overflow-hidden">
                <div class="sidebar-logo-section-container">
                    <a href="index.php" 
                        aria-current="page"
                        class="sidebar-logo-link w-nav-brand w--current"
                    >
                        <img src="./images/logobk.svg" loading="eager" alt="HCMUT - Logo" />
                    </a>
                    
                    <div data-w-id="8902ab60-ff18-1ad1-7b19-201b504196b1" class="sidebar-collapsed-icon-btn-wrapper">
                        <div class="sidebar-collapsed-icon-btn">
                            <img src="https://assets-global.website-files.com/652a49b013ed5242e0b91280/652a49b013ed5242e0b912f3_sidebar-icon-dashdark-webflow-template.svg"
                                loading="eager" 
                                alt="HCMUT - Icon"
                            />
                        </div>
                    </div>


                    <!--<div data-w-id="8902ab60-ff18-1ad1-7b19-201b504196b4" class="sidebar-collapse-icon-container"><img
                            src="https://assets-global.website-files.com/652a49b013ed5242e0b91280/652a49b013ed5242e0b912f2_sidebar-collapse-icon-dashdark-webflow-template.svg"
                            loading="eager" alt="" /></div>-->
                </div>
                
                <!--<div class="sidebar-collapsed-divider"></div>-->
                <!-- Search bar -->
                <!--<form action="/search" class="sidebar-search-wrapper w-form"><input type="search"
                        class="input icon-inside-left w-input" maxlength="256" name="query" placeholder="Search for..."
                        id="search" required="" /><input type="submit" value=""
                        class="btn-inside-input-left w-button" /></form>-->
                
                
                
                <div class="position-relative---z-index-1 logo-and-icon-mobile-container">
                    <nav role="navigation" class="sidebar-menu-container w-nav-menu">
                        <div class="sidebar-menu-collapsed-overlay"></div>

                        <!-- LEFT NAVBAR -->

                        <!-- Printing Service -->
                        <a href="search.php" class="sidebar-dropdown-link" style="text-decoration: none;">
                            <div data-hover="false" data-delay="0" data-w-id="8902ab60-ff18-1ad1-7b19-201b504196bd"
                                class="dropdown-wrapper sidebar-dropdown w-dropdown"
                            >
                                <div class="dropdown-toggle sidebar-dropdown">
                                    <div class="flex">
                                        <div class="dashdark-custom-icon sidebar-link-icon"></div>
                                        <div class="text-200 sidebar-dropdown-text">Searching Patient</div>
                                    </div>
                                </div>
                            </div>
                        </a>


                        <!-- Paper Purchase -->
                        <a href="add.php" class="sidebar-dropdown-link" style="text-decoration: none;">
                            <div data-hover="false" data-delay="0" data-w-id="8902ab60-ff18-1ad1-7b19-201b504196bd"
                                class="dropdown-wrapper sidebar-dropdown w-dropdown">
                                <div class="dropdown-toggle sidebar-dropdown ">
                                    <div class="flex">
                                        <div class="dashdark-custom-icon sidebar-link-icon"></div>
                                        <div class="text-200 sidebar-dropdown-text">Add Patient</div>
                                    </div>
                                </div>
                            </div>
                        </a>


                        <!-- Printing History -->
                        <a href="testing.php" class="sidebar-dropdown-link" style="text-decoration: none;">
                            <div data-hover="false" data-delay="0" data-w-id="8902ab60-ff18-1ad1-7b19-201b504196bd"
                                class="dropdown-wrapper sidebar-dropdown w-dropdown"
                            >
                                <div class="dropdown-toggle sidebar-dropdown ">
                                    <div class="flex">
                                        <div class="dashdark-custom-icon sidebar-link-icon"></div>
                                        <div class="text-200 sidebar-dropdown-text">Testing Details</div>
                                    </div>
                                </div>
                            </div>
                        </a>

                        <a href="report.php" class="sidebar-dropdown-link" style="text-decoration: none;">
                            <div data-hover="false" data-delay="0" data-w-id="8902ab60-ff18-1ad1-7b19-201b504196bd"
                                class="dropdown-wrapper sidebar-dropdown w-dropdown"
                            >
                                <div class="dropdown-toggle sidebar-dropdown ">
                                    <div class="flex">
                                        <div class="dashdark-custom-icon sidebar-link-icon"></div>
                                        <div class="text-200 sidebar-dropdown-text">Making Report</div>
                                    </div>
                                </div>
                            </div>
                        </a>

                        <!-- Account Settings -->
                        <div data-hover="false" data-delay="0" data-w-id="8902ab60-ff18-1ad1-7b19-201b5041977e" 
                            class="dropdown-wrapper sidebar-dropdown w-dropdown"
                        >
                            <div class="dropdown-toggle sidebar-dropdown w-dropdown-toggle">
                                <div class="flex align-center gap-column-8px">
                                    <!-- Need to change -->
                                    <!-- avatar -->
                                    <img
                                        src="https://assets-global.website-files.com/652a49b013ed5242e0b91280/652a49b013ed5242e0b912f7_john-carter-sidebar-avatar-dashdark-webflow-ecommerce-template.jpg"
                                        loading="eager"
                                        sizes="(max-width: 991px) 100vw, (max-width: 1439px) 32px, (max-width: 1919px) 2vw, 32px"
                                        srcset="https://assets-global.website-files.com/652a49b013ed5242e0b91280/652a49b013ed5242e0b912f7_john-carter-sidebar-avatar-dashdark-webflow-ecommerce-template-p-500.jpg 500w, https://assets-global.website-files.com/652a49b013ed5242e0b91280/652a49b013ed5242e0b912f7_john-carter-sidebar-avatar-dashdark-webflow-ecommerce-template.jpg 600w"
                                        alt="account avatar" class="avatar-circle _01"
                                    />
                                    
                                        <div class="sidebar-user-text-container">
                                        <div class="text-200 sidebar-dropdown-text color-neutral-100">Manager</div>
                                        <div class="text-100 sidebar-dropdown-text color-neutral-400">Account settings</div>
                                    </div>
                                </div>
                                <div class="line-rounded-icon sidebar-dropdown-arrow"></div>
                            </div>



                            <nav class="sidebar-dropdown-list-wrapper sidebar-account-settings-list w-dropdown-list">
                                <div class="flex-vertical">
                                    <div class="grid-1-column gap-row-16px">
                                        <a id="w-node-_8902ab60-ff18-1ad1-7b19-201b5041978c-504196ac"
                                            href=""
                                            class="font-icon-left-link w-inline-block"
                                        >
                                            <div class="dashdark-custom-icon"></div>
                                            <div class="text-100 medium">View profile</div>
                                        </a>

                                        <a id="w-node-_8902ab60-ff18-1ad1-7b19-201b50419791-504196ac"
                                            href=""
                                            class="font-icon-left-link w-inline-block"
                                        >
                                            <div class="dashdark-custom-icon"></div>
                                            <div class="text-100 medium">Profile settings</div>
                                        </a>
                                        
                                        <a id="w-node-_8902ab60-ff18-1ad1-7b19-201b50419796-504196ac"
                                            href=""
                                            class="font-icon-left-link w-inline-block"
                                        >
                                            <div class="dashdark-custom-icon"></div>
                                            <div class="text-100 medium">Notifications</div>
                                        </a>
                                    </div>
                                    
                                    <div class="sidebar-account-settings-divider"></div>
                                    <div class="grid-1-column gap-row-16px">
                                        <a id="w-node-_8902ab60-ff18-1ad1-7b19-201b504197a7-504196ac"
                                            href="register.php"
                                            class="font-icon-left-link color-red-300 w-inline-block"
                                        >
                                            <div class="dashdark-custom-icon"></div>
                                            <div class="text-100 medium">Log out</div>
                                        </a>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </nav>


                    <a href="#" class="sidebar-logo-link show-on-tablet w-nav-brand"><img
                        src="./images/logobk.svg"
                        loading="eager" alt="Dashdark X Webflow Template - Logo" /></a>
                    <div class="hamburger-menu-wrapper w-nav-button">
                        <div class="sidebar-mobile-menu-icon-wrapper"><img
                                src="./images/leftarrow.svg"
                                loading="eager" alt="" class="sidebar-mobile-menu-icon left" /><img
                                src="./images/rightarrow.svg"
                                loading="eager" alt="" class="sidebar-mobile-menu-icon right" /></div>
                    </div>
                </div>
            </div>
        </div>


        <div class="dashboard-main-section">
            <div class="sidebar-spacer"></div>
            <div class="dashboard-content">
                <div class="dashboard-main-content">
                    <?php
                        include "config.php";
                    ?>
                    <h2>Add Patient</h2>
                    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                        <label for="ssn">SSN:</label>
                        <input type="text" name="ssn" required><br>

                        <label for="fName">First Name:</label>
                        <input type="text" name="fName" required><br>

                        <label for="lName">Last Name:</label>
                        <input type="text" name="lName" required><br>

                        <label for="bDate">Birth Date:</label>
                        <input type="date" name="bDate" required><br>

                        <label for="gender">Gender:</label>
                        <select name="gender" required>
                            <option value="F">Female</option>
                            <option value="M">Male</option>
                        </select><br>

                        <label for="comorbidities">Comorbidities:</label>
                        <input type="text" name="comorbidities"><br>

                        <label for="highRisk">High Risk:</label>
                        <input type="checkbox" name="highRisk"><br>

                        <label for="phone">Phone:</label>
                        <input type="text" name="phone" required><br>

                        <label for="address">Address:</label>
                        <input type="text" name="address" required><br>

                        <input type="submit" value="Add Patient">
                    </form>
                        
                    <?php
                        if ($_SERVER["REQUEST_METHOD"] == "POST") {
                            // Get data from the form
                            $ssn = $_POST["ssn"];
                            $fName = $_POST["fName"];
                            $lName = $_POST["lName"];
                            $bDate = $_POST["bDate"];
                            $gender = $_POST["gender"];
                            $comorbidities = $_POST["comorbidities"];
                            $highRisk = isset($_POST["highRisk"]) ? 1 : 0;
                            $phone = $_POST["phone"];
                            $address = $_POST["address"];
                        
                            // SQL query to insert data into the Patient table
                            $sql = "INSERT INTO patient (ssn, fName, lName, bDate, gender, comorbitidies, highrisk, phone, address) 
                                    VALUES ('$ssn', '$fName', '$lName', '$bDate', '$gender', '$comorbidities', $highRisk, '$phone', '$address')";
                        
                            // Execute the query
                            if ($con->query($sql) === TRUE) {
                                echo "Patient record added successfully.";
                            } else {
                                echo "Error: " . $sql . "<br>" . $con->error;
                            }
                        }
                        
                    ?>
                    
                </div>


                <div class="dashboard-footer-wrapper">
                    <div class="container-default w-container">
                        <!--<div class="text-200 medium">Copyright © Dashdark X | Designed by <a
                                href="https://brixtemplates.com/" target="_blank" class="text-decoration-none">BRIX
                                Templates</a> - Powered by <a href="https://webflow.com/" target="_blank"
                                class="text-decoration-none">Webflow</a></div>-->
                        <div class="text-200 medium" style="padding-bottom: 20px;">Contact us: something@gmail.com</div>
                        <div class="text-200 medium" style="padding-bottom: 20px;">Phone number: 1234567890</div>
                        <div class="text-200 medium" style="padding-bottom: 20px;">Address: 268 Lý Thường Kiệt</div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <div class="loading-bar-wrapper">
        <div class="loading-bar"></div>
    </div>
    
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=652a49b013ed5242e0b91280"
        type="text/javascript"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"
    >
    </script>

    <script src="script.js"
        type="text/javascript">
    </script>

</body>

</html>