<?php

$link = mysqli_connect("localhost", "psicomanager", "Psik0loGi@pato2", "psico");

$currentQuestion = [];



/* check connection */

if (mysqli_connect_errno()) {

    printf("Connect failed: %s\n", mysqli_connect_error());

    exit();

}



if (!mysqli_set_charset($link, "utf8")) {

    printf("Error loading character set utf8: %s\n", mysqli_error($link));

    exit();

}



//here we need to modify the script in order to get the c_risk as well (coming from rel_question_category table)

$query = "SELECT

                question,

                answer,

                r_risk

            FROM questions JOIN answers

            ON questions.question_id = answers.fk_question_id

            WHERE questions.question_id = ?;";



//"SELECT question FROM questions WHERE question_id=?"



if ($stmt = mysqli_prepare($link, $query)) {



    /* bind parameters for markers */

    mysqli_stmt_bind_param($stmt, "i", $_REQUEST['questionNumber']);



    /* execute query */

    mysqli_stmt_execute($stmt);



    for($i=0; $i<=4; $i++) {

        /* bind result variables */

        mysqli_stmt_bind_result($stmt, $question, $answer, $rRisk);



        /* fetch value */

        mysqli_stmt_fetch($stmt);



        if($i == 0) {

            $currentQuestion[] = $question;

        }

        if($i >=0 & $i<=3) {

            $currentQuestion[] = $answer;

        }

        if($i == 4) {

            $currentQuestion[] = $rRisk;

        }

        



        /*printf ("%s \n", $question);

        printf ("%s \n", $answer);*/

    }



    /* close statement */

    mysqli_stmt_close($stmt);

}



/* close connection */

mysqli_close($link);



echo json_encode($currentQuestion);

?>