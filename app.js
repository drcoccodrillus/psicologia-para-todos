/* -Beginning- Global variables */
var start = false; //this is the sentinel for the quiz
var currentQuestion = 0;
const percentages1 = {
    1: 120, //domanda 1
    2: 150,
    3: 180,
    4: 210,
    5: 240,
    6: 270,
    7: 270,
    8: 270, //cambio querySelector 50%
    9: 270,
    10: 270,
    11: 270,
    12: 270,
    13: 270,
    14: 270 //fine del quiz
};
const percentages2 = {
    1: 90,
    2: 90,
    3: 90,
    4: 90,
    5: 90,
    6: 90,
    7: 90,
    8: -67.5, //cambio querySelector
    9: -45,
    10: -22.5,
    11: 0,
    12: 22.5,
    13: 45,
    14: 90
};
const coefficient = 100 / 14;
var userData; //this is the userdata container
var userAnswer = {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0};
var answers = [
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0},
    {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0}
]; //this is the answers array

var currentCombinations = []; //variabile di appoggio che contiene la combinazione scelta dall'utente in fase di risposta

var tmpRRisk = 0;

var tmpCrRisk = 0;

var rXcr = 0; //per ogni domanda contiene il valore di r moltiplicato per cr

var emotionMatrix = {"anxiety": 0, "depression": 0, "mes": 0, "panic": 0, "rage": 0, "style": 0};

/* -End- Global variables */

function initialize() {
    if(document.querySelector("#flag-ci").checked) {
        document.querySelector("#ci").classList.remove("alert-danger");
        setTimeout(function () { //time delay of 1.5 sec. Just for a nice effect while removing the class alert-danger
            location.href = 'app.html';
        }, 1500);
	}
	else {
		document.querySelector("#ci").classList.add("alert-danger");
	}
}


/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* - The game is on - */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
function startQuiz() {
    start = true;
    getNextQuestion();
}
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* - - */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */

//This function is for storing the user data into the global array userData
function getUserData() {
    userData = document.querySelectorAll(".arete-input");
    //console.log(userData);
    //console.log("Username: " + userData[0].value);
    //console.log("Country: " + userData[1].value);
    //console.log("WhatsApp: " + userData[2].value);

    //This is for checking the userdata gotten at page app.html
    if(userData[0].value != "" && userData[1].value != "" && userData[2].value != "") {
        /* -Begin- XML HTTP Request */
        const data = new FormData();
        data.append("username", userData[0].value);
        data.append("country", userData[1].value);
        data.append("whatsapp", userData[2].value);

        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                window.location.replace("question.html"); //The game begin when the userData are stored
            }
        }
        xhr.open("POST", "ajax/park-user-data-ajax.php", true); //I dati sono parcheggiati in variabili di sessione
        xhr.send(data);
        /* -End- XML HTTP Request */
    }
    else {
        //This is for checking if the user data error is already in the DOM
        if(!document.querySelector("#user-data-error")) {
            const error = document.createElement("div");
            error.id = "user-data-error";
            error.className = "alert alert-danger";
            error.innerHTML = "Faltan datos";
            document.querySelector("#personal-data-form").appendChild(error);
        }
    }
}


/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* -Begin- Layout functions */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */

var countries = {
    "+54" : "ar",
    "+591" : "bo",
    "+55" : "br",
    "+56" : "cl",
    "+57" : "co",
    "+506" : "cr",
    "+53" : "cu",
    "+593" : "ec",
    "+503" : "sv",
    "+502" : "gt",
    "+509" : "ht",
    "+504" : "hn",
    "+52" : "mx",
    "+505" : "ni",
    "+507" : "pa",
    "+595" : "py",
    "+51" : "pe",
    "+598" : "uy",
    "+58" : "ve"
}
//This function change the country flag
function changeFlag() {
    countryCode = document.querySelector("#country-code").value;
    //console.log(countryCode); //for debugging
    document.querySelector("#country-flag").className = "col-md-1 flag-icon-background flag-icon-"+countries[countryCode];
}

//This function is for making the selected button (answer) yellow and set to 1 the relative array
function answerSelector(answer) {
    /* -Parameters- */
    /* -answer: #a-answer, #b-answer, #c-answer, #d-answer */

    //console.log(document.querySelector(answer).id); //for debugging. It prints the id of the user selected answers
    if(document.querySelector(answer).className == "btn question-button") {
        document.querySelector(answer).className = "btn question-button question-button-selected"; //CSS Class updating
        userAnswer[answer] = 1;
    }
    else {
        document.querySelector(answer).className = "btn question-button"; //CSS Class updating
        userAnswer[answer] = 0;
    }
}

//This function is to reset the button class to the default (unselected)
function resetButtonsLayout() {
    document.querySelector("#a-answer").className = "btn question-button";
    document.querySelector("#b-answer").className = "btn question-button";
    document.querySelector("#c-answer").className = "btn question-button";
    document.querySelector("#d-answer").className = "btn question-button";
}

//This function is for updating the percentage circle
function percentageUpdater(percentage) {
    /* -Parameters- */
    /* -percentage: 1,2,3,4,5,6,7,8,9,10,11,12,13,14*/

    if(currentQuestion<7) {
        document.querySelector("#activeBorder").style.backgroundImage = "linear-gradient("+percentages1[percentage]+"deg, transparent 50%, #f5f5f5 50%), linear-gradient("+percentages2[percentage]+"deg, #f5f5f5 50%, transparent 50%)";
        document.querySelector("#percentage").innerHTML = Math.round(coefficient*percentage) + "%";
    }
    else {
        document.querySelector("#activeBorder").style.backgroundImage = "linear-gradient("+percentages1[percentage]+"deg, #f3bb34 50%, transparent 50%), linear-gradient("+percentages2[percentage]+"deg, #f3bb34 50%, #f5f5f5 50%)";
        document.querySelector("#percentage").innerHTML = Math.round(coefficient*percentage) + "%";
    }
    //console.log(document.querySelector("#activeBorder")); //for debugging. It prints the percentage HTML object
}

//This function attach to the DOM the div block containing the error message for unaccepted combination
function printAnswerError() {
    //Checks if the error element is already into the DOM. If not the function creates it
    if(!document.querySelector("#combination-error")) {
        const error = document.createElement("div");
        error.id = "combination-error";
        error.className = "alert alert-danger";
        error.innerHTML = "No es una combinacion posible";
        document.querySelector("#question-data-form").appendChild(error);
    }
}

function removeAnswerError() {
    if(document.querySelector("#combination-error")) {
        document.querySelector("#combination-error").remove();
    }
}

function resultPageGenerator() {
    document.querySelector("#question-row").remove();
    document.querySelector("#answers-row").remove();
    document.querySelector("#next-button").remove();
    /*const finalRisk = document.createElement("div");
    const anxiety = document.createElement("div");
    const depression = document.createElement("div");
    const mes = document.createElement("div");
    const panic = document.createElement("div");
    const rage = document.createElement("div");
    const style = document.createElement("div");
    finalRisk.innerHTML = "Riesgo Total: " + (rXcr/100);
    anxiety.innerHTML = "Ansiedad: " + (emotionMatrix["anxiety"]/100);
    depression.innerHTML = "Depresión: " + (emotionMatrix["depression"]/100);
    mes.innerHTML = "Madurez y estabilidad emocional: " + (emotionMatrix["mes"]/100);
    panic.innerHTML = "Ataques de pánico: " + (emotionMatrix["panic"]/100);
    rage.innerHTML = "Ira: " + (emotionMatrix["rage"]/100);
    style.innerHTML = "Estilos de afrontamiento: " + (emotionMatrix["style"]/100);
    document.querySelector("#button-col").appendChild(finalRisk);
    document.querySelector("#button-col").appendChild(anxiety);
    document.querySelector("#button-col").appendChild(depression);
    document.querySelector("#button-col").appendChild(mes);
    document.querySelector("#button-col").appendChild(panic);
    document.querySelector("#button-col").appendChild(rage);
    document.querySelector("#button-col").appendChild(style);*/
    getHints();
}

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* -End- Layout functions */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */

/* O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_ */
/* O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_ */
/* O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_O_ */

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* -Begin- Game functions */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */

function getHints() {
    const hintsData = new FormData();
    hintsData.append("anxiety", emotionMatrix.anxiety/100);
    hintsData.append("depression", emotionMatrix.depression/100);
    hintsData.append("mes", emotionMatrix.mes/100);
    hintsData.append("panic", emotionMatrix.panic/100);
    hintsData.append("rage", emotionMatrix.rage/100);
    hintsData.append("style", emotionMatrix.style/100);

    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            const hintsDiv = JSON.parse(xhr.responseText);
            document.querySelector("#button-col").innerHTML = "<table class='table'><thead><tr><th scope='col'>Posiblemente tu...</th><th scope='col'>Técnicas</th><th scope='col'>Pensamientos prácticos, ten en cuenta...</th></tr></thead><tbody><tr><td>"+hintsDiv[0]+"</td><td>"+hintsDiv[1]+"</td><td>"+hintsDiv[2]+"</td></tr></tbody></table>";
            document.querySelector("#button-col").innerHTML = "<div><h3>Posiblemente tu...</h3></div><div>"+hintsDiv[0]+"</div><div><h3>Técnicas</h3></div><div>"+hintsDiv[1]+"</div><div><h3>Pensamientos prácticos, ten en cuenta...</h3></div><div>"+hintsDiv[2]+"</div>";
            console.log(hintsDiv);
        }
    }
    xhr.open("POST", "ajax/hints-ajax.php", true);
    xhr.send(hintsData);
}

//This function is for getting the next question
function checkAnswer(questionNumber) {
    var returnValue = false;
    for(var i = 0; i<currentCombinations.length; i++) {
        //This is the variable we use to compare the userAnswer for the current question with all the possible combinations
        var tmpCombination = {
            "#a-answer": currentCombinations[i]['a'],
            "#b-answer": currentCombinations[i]['b'],
            "#c-answer": currentCombinations[i]['c'],
            "#d-answer": currentCombinations[i]['d']
        };

        tmpCrRisk = currentCombinations[i]['crRisk'];

        //console.log("--> " + JSON.stringify(tmpCombination)); //for debugging
        //console.log("++> " + JSON.stringify(userAnswer)); //for debugging
        if(JSON.stringify(userAnswer)==JSON.stringify(tmpCombination)) {
            answers[questionNumber-1] = userAnswer; //assign to the final user answers dictionary the current user answer
            //console.log(i + " OK!"); //for debugging
            //console.log(answers[questionNumber]); //for debugging
            rXcr += tmpCrRisk * tmpRRisk;

            console.log(rXcr/100); //Mostra il risultato di r x cr

            //console.log(answers);
            /* This is to refresh the appo dictionary */
            userAnswer = {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0};
            //console.log("--> New" + JSON.stringify(userAnswer));
            return true;
        }
        else {
            //console.log("Risposta non ammissibile"); //questo va rimosso
            returnValue = false;
        }
    }
    userAnswer = {"#a-answer": 0, "#b-answer": 0, "#c-answer": 0, "#d-answer": 0};
    return returnValue;
}

function getNextQuestion() {    
    var nextQuestion = currentQuestion+1;
    var isNext = true;
    //console.log("nextQuestion--> " + nextQuestion); //for debugging. It prints the current question number
    if(currentQuestion > 0) { //checks if we are coming from app.html
        resetButtonsLayout(); //brings the buttons to the unselected layout
        isNext = checkAnswer(currentQuestion);
    }
    if(isNext) {
        removeAnswerError();
        percentageUpdater(nextQuestion);
        getQuestion(nextQuestion);
        emotionMatrixUpdater(currentQuestion);
        //console.log(tmpRRisk);
        getCombinations(nextQuestion);
        currentQuestion = nextQuestion; //set the currentQuestion value to the last nextQuestion value
    }
    else {
        printAnswerError();
    }
	
	if(currentQuestion == 7) {
		document.querySelector("#suggestion-row").style.display = "block";
	}

    //if we are at the last question the game has to finish and the data have to be stored into the DB
    if(currentQuestion == 14) {
		//Here we should get the suggestions from the DOM and store them into the tests_results table
        const data = new FormData();
        data.append("tRisk", rXcr/100);
		data.append("anxietyRisk", emotionMatrix['anxiety']);
		data.append("depressionRisk", emotionMatrix['depression']);
		data.append("mesRisk", emotionMatrix['mes']);
		data.append("panicRisk", emotionMatrix['panic']);
		data.append("rageRisk", emotionMatrix['rage']);
		data.append("styleRisk", emotionMatrix['style']);
		data.append("answers", JSON.stringify(answers));

        const xhr = new XMLHttpRequest();
        xhr.open("POST", "ajax/store-user-data-ajax.php", true);
        xhr.send(data);

        resultPageGenerator();
    }
}

function getQuestion(questionNumber) {
    console.log(currentQuestion);
    if(currentQuestion < 13) {
        const questionData = new FormData();
        questionData.append("questionNumber", questionNumber);

        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                //console.log("Retrieved question --> "); //for debugging
                //console.log(JSON.parse(xhr.responseText)); //for debugging
                const question = JSON.parse(xhr.responseText)[0];
                const a = JSON.parse(xhr.responseText)[1];
                const b = JSON.parse(xhr.responseText)[2];
                const c = JSON.parse(xhr.responseText)[3];
                const d = JSON.parse(xhr.responseText)[4];
                document.querySelector("#question").innerHTML = question;
                document.querySelector("#a-answer").innerHTML = a;
                document.querySelector("#b-answer").innerHTML = b;
                document.querySelector("#c-answer").innerHTML = c;
                document.querySelector("#d-answer").innerHTML = d;
                tmpRRisk = JSON.parse(xhr.responseText)[5]; //dovrebbe assegnarlo correttamente sin dalla numero 1
                //console.log(tmpRRisk);
            }
        }
        xhr.open("POST", "ajax/question-ajax.php", true);
        xhr.send(questionData);
    }
}

//This function is for getting the possible answer combinations for the current question and saving it into a global array
function getCombinations(questionNumber) {
    const questionData = new FormData();
    questionData.append("questionNumber", questionNumber);

    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            //console.log("Retrieved combinations for current question -->"); //for debugging
            //console.log(JSON.parse(xhr.responseText)); //for debugging
            currentCombinations = JSON.parse(xhr.response); //saving the response into the currentCombination array
        }
    }
    xhr.open("POST", "ajax/combination-ajax.php", true);
    xhr.send(questionData);
}


/* ++-- FUNCTION VAR001 */
//this updates the emotionMatrix
function emotionMatrixUpdater(questionNumber) {
    const questionData = new FormData();
    questionData.append("questionNumber", questionNumber);

    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function() {
        if(currentQuestion <= 13) {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                emotionMatrix["anxiety"] += JSON.parse(xhr.response)["anxiety"] * tmpCrRisk;
                emotionMatrix["depression"] += JSON.parse(xhr.response)["depression"] * tmpCrRisk;
                emotionMatrix["mes"] += JSON.parse(xhr.response)["mes"] * tmpCrRisk;
                emotionMatrix["panic"] += JSON.parse(xhr.response)["panic"] * tmpCrRisk;
                emotionMatrix["rage"] += JSON.parse(xhr.response)["rage"] * tmpCrRisk;
                emotionMatrix["style"] += JSON.parse(xhr.response)["style"] * tmpCrRisk;
                console.log(emotionMatrix); //this is for debugging
            }
        }
    }

    xhr.open("POST", "ajax/question-category-ajax.php", true);
    xhr.send(questionData);
}

/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */
/* -End- Game functions */
/* -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ */