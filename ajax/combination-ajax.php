<?php

$link = mysqli_connect("localhost", "psicomanager", "Psik0loGi@pato2", "psico");



$currentCombinations = [];



/* check connection */

if (mysqli_connect_errno()) {

    printf("Connect failed: %s\n", mysqli_connect_error());

    exit();

}



if (!mysqli_set_charset($link, "utf8")) {

    printf("Error loading character set utf8: %s\n", mysqli_error($link));

    exit();

}



$query = "SELECT

                a,

                b,

                c,

                d,

                cr_risk

            FROM questions JOIN combinations

            ON question_id = fk_question_id

            WHERE fk_question_id = ?;";



//"SELECT question FROM questions WHERE question_id=?"



if ($stmt = mysqli_prepare($link, $query)) {



    /* bind parameters for markers */

    mysqli_stmt_bind_param($stmt, "i", $_REQUEST['questionNumber']);



    /* execute query */

    mysqli_stmt_execute($stmt);



    /* bind result variables */

    mysqli_stmt_bind_result($stmt, $a, $b, $c, $d, $crRisk);

        

    /* fetch values */

    $i = 0;

    while(mysqli_stmt_fetch($stmt)) {

        $currentCombinations[$i]['a'] = $a;

        $currentCombinations[$i]['b'] = $b;

        $currentCombinations[$i]['c'] = $c;

        $currentCombinations[$i]['d'] = $d;

        $currentCombinations[$i]['crRisk'] = $crRisk;

        $i++;

    }



    /* close statement */

    mysqli_stmt_close($stmt);

}



/* close connection */

mysqli_close($link);



echo json_encode($currentCombinations);

?>