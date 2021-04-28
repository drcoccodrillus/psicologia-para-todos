<?php
session_start();
$_SESSION["username"] = $_REQUEST["username"];
$_SESSION["mobile"] = $_REQUEST["whatsapp"];
$_SESSION["country"] = $_REQUEST["country"];
echo $_SESSION["username"];
?>