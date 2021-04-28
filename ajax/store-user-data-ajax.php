<?php
session_start();
$link = mysqli_connect("localhost", "root", "password", "psico");

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* 1) -Begin- Store into users table - */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */

/* Variable used into queries */
$u = $_SESSION['username'];
$m = $_SESSION['mobile'];
$c = $_SESSION['country'];
/* Variable used into queries */

//query for checking if a user is already in the DB
$query = "SELECT user_id, name, mobile, country FROM users WHERE name = ? AND mobile = ? AND country = ?;";

if ($stmt = mysqli_prepare($link, $query)) {
    /* bind parameters for markers */
    mysqli_stmt_bind_param($stmt, "sss", $u, $m, $c);

    /* execute query */
    mysqli_stmt_execute($stmt);

    /* bind result variables */
    mysqli_stmt_bind_result($stmt, $userId, $name, $mobile, $country);

    /* If values are fetched the user is already present into the DB so I store it's id in a SESSION variable */
    if(mysqli_stmt_fetch($stmt)) {
        $_SESSION['user_id'] = $userId; //store the user id into a session variable
        echo "User already there" . "<br/>"; //for debugging
        //echo $_SESSION['user_id']; //for debugging
        
		/* close statement */
        mysqli_stmt_close($stmt);
    }
    else { //in this case the user is not into the DB so the INSERT INTO need to be run
        echo "This is a new user" . "<br/>"; //for debugging
        $query = "INSERT INTO users (name, mobile, country) VALUES (?, ?, ?);";
        
        if ($stmt = mysqli_prepare($link, $query)) {
            /* bind parameters for markers */
            mysqli_stmt_bind_param($stmt, "sss", $u, $m, $c);
        
            /* execute query */
            mysqli_stmt_execute($stmt);
        
            /* close statement */
            mysqli_stmt_close($stmt);
            echo "User sent to DB: " . $u . "<br/>"; //for debugging
        }

        //this is for getting the user id of the last inserted user
        $query = "SELECT user_id FROM users WHERE name = ? AND mobile = ? AND country = ?;";
        if ($stmt = mysqli_prepare($link, $query)) {
            mysqli_stmt_bind_param($stmt, "sss", $u, $m, $c);

            /* execute query */
            mysqli_stmt_execute($stmt);

            /* bind result variables */
            mysqli_stmt_bind_result($stmt, $userId);

            if(mysqli_stmt_fetch($stmt)) {
                $_SESSION['user_id'] = $userId; //store the user id into a session variable
                echo $_SESSION['user_id'] . "<br/>";
            }
			
			/* close statement */
            mysqli_stmt_close($stmt);
        }
    }
}

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* -End- Store into users table - */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* 2) -Begin- Store into tests_results table - */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
$tRisk = $_REQUEST['tRisk'];
$anxietyRisk = $_REQUEST['anxietyRisk'];
$depressionRisk = $_REQUEST['depressionRisk'];
$panicRisk = $_REQUEST['panicRisk'];
$rageRisk = $_REQUEST['rageRisk'];
$mesRisk = $_REQUEST['mesRisk'];
$styleRisk = $_REQUEST['styleRisk'];
	
$query = "INSERT INTO tests_results (t_risk, anxiety_risk, depression_risk, panic_risk, rage_risk, mes_risk, style_risk) VALUES (?, ?, ?, ?, ?, ?, ?);";

if ($stmt = mysqli_prepare($link, $query)) {
	/* bind parameters for markers */
	mysqli_stmt_bind_param($stmt, "ddddddd", $tRisk, $anxietyRisk, $depressionRisk, $panicRisk, $rageRisk, $mesRisk, $styleRisk);

	/* execute query */
	mysqli_stmt_execute($stmt);

	/* close statement */
	mysqli_stmt_close($stmt);
	
	echo "Test sent to DB: " . mysqli_insert_id($link) . "<br/>"; //for debugging
}

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* -End- Store into tests_results table - */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* 3) -Begin- Store into tests table - */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */

/* Variable used into queries */
$d = date("y-m-j");
$uid = $_SESSION['user_id']; //user id
$sid = 1; //this is a constant value because we have just one survey atm
$trid = mysqli_insert_id($link); //test result id (last inserted test result id)
/* Variable used into queries */

$query = "INSERT INTO tests (submission_date, fk_user_id, fk_survey_id, fk_test_result_id) VALUES (?, ?, ?, ?);";

if ($stmt = mysqli_prepare($link, $query)) {
    /* bind parameters for markers */
    mysqli_stmt_bind_param($stmt, "siii", $d, $uid, $sid, $trid);

    /* execute query */
    mysqli_stmt_execute($stmt);

    /* close statement */
    mysqli_stmt_close($stmt);
    echo "Test sent to DB: " . $d . "<br/>"; //for debugging
}

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* -End- Store into tests table - */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */


/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* 4) -Begin- Store into tests_answers table - */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */

$tid = mysqli_insert_id($link); //test id (last inserted test id)
$answers = json_decode($_REQUEST['answers']);

$query = "INSERT INTO tests_answers (answer, fk_test_id) VALUES (?, ?);";
for($i=0; $i<sizeof($answers); $i++) {
	$answer = $answers[$i];
	$answerArray = json_decode(json_encode($answer), true);
	$answerString = $answerArray['#a-answer'] . "," . $answerArray['#b-answer'] . "," . $answerArray['#c-answer'] . "," . $answerArray['#d-answer'];
	echo $answerString;
	if ($stmt = mysqli_prepare($link, $query)) {
		/* bind parameters for markers */
		mysqli_stmt_bind_param($stmt, "si", $answerString, $tid);

		/* execute query */
		mysqli_stmt_execute($stmt);

		/* close statement */
		mysqli_stmt_close($stmt);
		echo "Answer sent to DB: " . $answerString . "<br/>"; //for debugging
	}
}

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* -End- Store into tests_answers table - */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */


/* close connection */
mysqli_close($link);
?>