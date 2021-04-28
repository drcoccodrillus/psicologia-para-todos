<?php

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */

/* -Begin- Updates the "Emotion Matrix"   - */

/* -The "Emotion Matrix" stores the outcome */

/* of "R Risk" x "C Risk"                 - */

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */



$link = mysqli_connect("localhost", "psicomanager", "Psik0loGi@pato2", "psico");



$emotionMtx = [

    'anxiety' => 0,

    'depression' => 0,

    'mes' => 0,

    'panic' => 0,

    'rage' => 0,

    'style' => 0

];



if (mysqli_connect_errno()) {

    printf("Connect failed: %s\n", mysqli_connect_error());

    exit();

}



if (!mysqli_set_charset($link, "utf8")) {

    printf("Error loading character set utf8: %s\n", mysqli_error($link));

    exit();

}



$query = "SELECT fk_category_id, c_risk

            FROM questions JOIN rel_question_category

            ON question_id = fk_question_id

            WHERE question_id = ?;";



if ($stmt = mysqli_prepare($link, $query)) {



    mysqli_stmt_bind_param($stmt, "i", $_REQUEST['questionNumber']);



    mysqli_stmt_execute($stmt);



    mysqli_stmt_bind_result($stmt, $categoryId, $cRisk);



    while(mysqli_stmt_fetch($stmt)) {

        if($categoryId == 1) {

            $emotionMtx['anxiety'] = (int)$cRisk;

        }

        elseif ($categoryId == 2) {

            $emotionMtx['depression'] = (int)$cRisk;

        }

        elseif ($categoryId == 3) {

            $emotionMtx['mes'] = (int)$cRisk;

        }

        elseif ($categoryId == 4) {

            $emotionMtx['panic'] = (int)$cRisk;

        }

        elseif ($categoryId == 5) {

            $emotionMtx['rage'] = (int)$cRisk;

        }

        elseif ($categoryId == 6) {

            $emotionMtx['style'] = (int)$cRisk;

        }

    }



    mysqli_stmt_close($stmt);

}



mysqli_close($link);



echo json_encode($emotionMtx);

?>