<?php
header('Content-type: application/json');
if (isset($_REQUEST["table"]) && isset($_REQUEST["var"])){
    $table = strtolower($_REQUEST["table"]);
    $var = $_REQUEST["var"];
    switch ($table) {
        case "answers":
        case "comments":
        case "events":
        case "locations":
        case "posts":
        case "questions":
        case "rsvps":
        case "users":
        case "answer":
        case "comment":
        case "event":
        case "location":
        case "post":
        case "question":
        case "rsvp":
        case "user":
            echo json_encode((call_user_func('db::get'.$table,$var)));
            break;
        default:
            echo "BAD REQUEST";
    }
}