<?php

$con = mysqli_connect("localhost", "Manager", "123", "mydb") or die("Couldn't connect");

function validate_input($input) {
    $known_bad = array("select", "insert", "update", "delete", "drop", "--", "'");
    $good_string = true;
    foreach ($known_bad as $bad) {
        if (stripos($input, $bad) !== false) {
            $good_string = false;
            break;
        }
    }
    $good_password_chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%&!_-/, ";
    $good_char = true;
    for ($i = 0; $i < strlen($input); $i++) {
        $c = $input[$i];
        if (strpos($good_password_chars, $c) === false) {
            $good_char = false;
            break;
        }
    }
    return $good_char && $good_string;
}
//  adđ some thinh
