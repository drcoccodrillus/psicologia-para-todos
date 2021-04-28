<?php

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */

/* -Begin- Retrieve the hints             - */

/* -Hints are retrieved on the score        */

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */



$link = mysqli_connect("localhost", "psicomanager", "Psik0loGi@pato2", "psico");



if (mysqli_connect_errno()) {

    printf("Connect failed: %s\n", mysqli_connect_error());

    exit();

}



if (!mysqli_set_charset($link, "utf8")) {

    printf("Error loading character set utf8: %s\n", mysqli_error($link));

    exit();

}



$hints1 = [];

$hints2 = [];

$hints3 = [];



/* Questo array lo ho introdotto per gestire solo un numero ridotto di suggerimenti */

$firstThree = [

    "anxiety" => $_REQUEST['anxiety'],

    "depression" => $_REQUEST['depression'],

    "mes" => $_REQUEST['mes'],

    "panic" => $_REQUEST['panic'],

    "rage" => $_REQUEST['rage'],

    "style" => $_REQUEST['style']

];



arsort($firstThree); //sorting by descending by score

array_splice($firstThree, 1); //keep just the first element. The one with the highest score





$query = "  SELECT title, hint FROM hints

            WHERE ? BETWEEN min_category_risk AND max_category_risk

            AND fk_category_id=?;";



foreach($firstThree as $key => $val) {

    if ($stmt = mysqli_prepare($link, $query)) {

        if($key == "anxiety") {

            $categoryId = 1;

            mysqli_stmt_bind_param($stmt, "ii", $val, $categoryId);

        }

        elseif($key == "depression") {

            $categoryId = 2;

            mysqli_stmt_bind_param($stmt, "ii", $val, $categoryId);

        }

        elseif($key == "mes") {

            $categoryId = 3;

            mysqli_stmt_bind_param($stmt, "ii", $val, $categoryId);

        }

        elseif($key == "panic") {

            $categoryId = 4;

            mysqli_stmt_bind_param($stmt, "ii", $val, $categoryId);

        }

        elseif($key == "rage") {

            $categoryId = 5;

            mysqli_stmt_bind_param($stmt, "ii", $val, $categoryId);

        }

        elseif($key == "style") {

            $categoryId = 6;

            mysqli_stmt_bind_param($stmt, "ii", $val, $categoryId);

        }



        mysqli_stmt_execute($stmt);

    

        mysqli_stmt_bind_result($stmt, $title, $hint);

    

        while(mysqli_stmt_fetch($stmt)) {

            if($title == "Posiblemente tú...") {

                $hints1[] = $hint;

            }

            elseif($title == "Técnicas") {

                $hints2[] = $hint;

            }

            else {

                $hints3[] = $hint;

            }

        }

        mysqli_stmt_close($stmt);

    }

}





mysqli_close($link);



$finalHints = [$hints1, $hints2, $hints3];



echo json_encode($finalHints);

?>