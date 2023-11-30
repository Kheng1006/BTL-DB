<?php

$con = mysqli_connect("localhost", "root", "", "mydb") or die("Couldn't connect");

function validate_input($input) {
    $known_bad = array("select", "insert", "update", "delete", "drop", "--", "'");
    $validate_string = true;
    foreach ($known_bad as $bad) {
        if (stripos($input, $bad) !== false) {
            $validate_string = false;
            break;
        }
    }
    $good_password_chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    $validatepassword = true;
    for ($i = 0; $i < strlen($input); $i++) {
        $c = $input[$i];
        if (strpos($good_password_chars, $c) === false) {
            $validatepassword = false;
            break;
        }
    }
    return $validatepassword && $validate_string;
}
//  adđ some thinh