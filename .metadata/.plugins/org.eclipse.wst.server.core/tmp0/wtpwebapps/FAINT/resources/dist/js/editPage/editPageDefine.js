
var codeHtml = CodeMirror(document.getElementById("codeHtml"), {  //코드미러  codeHtml객체

    mode: "htmlmixed", //codeHtml 펜에서 html.css,js 혼합모드 가능
    // profile: "xhtml",
    lineNumbers: true, // 줄번호
    scrollbarStyle: "simple",    // 스크롤바 스타일
    keyMap: "sublime",           // 키맵
    matchBrackets: true,         // 괄호강조
    theme: "dracula",            // 테마
    tabSize: 4,                  // 탭사이즈
    highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true},//단어강조
    indentWithTabs: true, //탭크기 들여쓰기
    electricChars: true,  //현재 줄을 다시 들여야하는지 여부(true기본)
    // resetSelectionOnContextMenu: false, //컨텍스트 메뉴가 현재 선택 영역 바깥 쪽을 클릭하여 열릴 때 커서가 클릭 지점으로 이동하는지 여부(true기본)
    smartIndent: true, //스마트 들여쓰기
    lineWiseCopyCut: true, //커서기준 라인 전체 카피 또는 잘라내기
    pasteLinesPerSelection: true, //행 수가 선택 수와 일치하면 선택 항목 당 한 행을 삽입합니다
    // styleActiveLine: true,
    autoCloseTags: true, //자동 태그 닫기
    lineWrapping: true,   // 가로 스크롤바 숨김, 너비에 맞게 줄바꿈.
    indentUnit: 4,   //들여스기 단위
    extraKeys: { //외부(사용자)키 정의
        "Ctrl-Space": "autocomplete",  //자동완성
        "Ctrl-Q": function (cm) { //
            cm.foldCode(cm.getCursor()); //폴더코드 접기
        },
        "Ctrl-Alt-F": autoFormatSelection //자동 포메이션
    },
    foldGutter: true, //접히는 기능 사용여부
    gutters: ["CodeMirror-linenumbers", "breakpoints", "CodeMirror-foldgutter"], //거터옵션  줄번호, 중단점, 코드접기
    autofocus: true //자동초점 사용
});


var codeCss = CodeMirror(document.getElementById("codeCss"), { //코드미러  codeCss 객체
    mode: "css", //  css 모드
    lineNumbers: true, //줄번호 사용
    scrollbarStyle: "simple",    // 스크롤바 스타일
    keyMap: "sublime",           // 괄호강조
    matchBrackets: true,         // 괄호강조
    theme: "dracula",            // 테마
    tabSize: 4,                  // 탭사이즈
    lineWrapping: true,           // 가로 스크롤바 숨김, 너비에 맞게 줄바꿈.
    highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true}, // 같은단어강조
    indentUnit: 4, //들여스기 단위
    extraKeys: { //외부(사용자)키 정의
        "Ctrl-Space": "autocomplete",  //자동완성
        "Ctrl-Q": function (cm) { //
            cm.foldCode(cm.getCursor()); //폴더코드 접기
        },
        "Ctrl-Alt-F": autoFormatSelection //자동 포메이션
    },
    indentWithTabs: true, //탭인덴트 사용
    electricChars: true, //현재 줄을 다시 들여야하는지 여부(true기본)
    // resetSelectionOnContextMenu: false,  //컨텍스트 메뉴가 현재 선택 영역 바깥 쪽을 클릭하여 열릴 때 커서가 클릭 지점으로 이동하는지 여부(true기본)
    smartIndent: true, //스마트 들여쓰기
    lineWiseCopyCut: true,  //커서기준 라인 전체 카피 또는 잘라내기
    pasteLinesPerSelection: true,  //행 수가 선택 수와 일치하면 선택 항목 당 한 행을 삽입합니다
    // tabindex: 4,  // 탭인덱스
    // styleActiveLine: true,

    foldGutter: true, //접히는 기능 사용여부
    gutters: ["CodeMirror-linenumbers", "breakpoints", "CodeMirror-foldgutter"] //거터옵션 줄번호, 중단점, 코드접기 이용함
});


var codeJavaScript = CodeMirror(document.getElementById("codeJavaScript"), { //코드미러  codeJavaScript 객체
    mode: "javascript", // js펜 모드
    lineNumbers: true, //줄 번호 사용
    scrollbarStyle: "simple",    // 스크롤바 스타일
    keyMap: "sublime",           // 키맵
    matchBrackets: true,         // 괄호강조
    theme: "dracula",            // 테마
    tabSize: 4,                  // 탭사이즈
    lineWrapping: true,          // 가로 스크롤바 숨김, 너비에 맞게 줄바꿈.
    highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true},   // 같은단어강조
    // extraKeys: { ".": "autocomplete" },
    // extraKeys: { "Ctrl-Space": "autocomplete" }, //힌트
    // indentWithTabs: false,
    electricChars: true,         //중괄호 정렬
    // resetSelectionOnContextMenu: false,
    smartIndent: true, //스마트 들여쓰기
    lineWiseCopyCut: true,  //커서기준 라인 전체 카피 또는 잘라내기
    pasteLinesPerSelection: true,  //행 수가 선택 수와 일치하면 선택 항목 당 한 행을 삽입합니다
    // tabindex: 4,
    // styleActiveLine: true,

    wordWrap: true,
    autoCloseBrackets: true,

    indentUnit: 4,                //들여쓰기 단위
    // gutters: ["CodeMirror-linenumbers", "breakpoints"],
    extraKeys: { //외부(사용자)키 정의
        "Ctrl-Space": "autocomplete",  //자동완성
        "Ctrl-Q": function (cm) { //
            cm.foldCode(cm.getCursor()); //폴더코드 접기
        },
        "Ctrl-Alt-F": autoFormatSelection //자동 포메이션
    },
    foldGutter: true, //접히는 기능 사용여부
    gutters: ["CodeMirror-linenumbers", "breakpoints", "CodeMirror-foldgutter"] //거터에서 줄번호, 중단점, 코드접기 이용함
});


// 아래 keyup 이벤트 발생시 제외할  키코드 아스키값
var ExcludedIntelliSenseTriggerKeys =
    {
        //num 자동완성에서 제외할 키코드와 키
        "49": "1", //번호 1 제외
        "50": "2",
        "51": "3",
        "52": "4",
        "53": "5",
        "54": "6",
        "55": "7",
        "56": "8",

        //key-pad
        "96": "0", //키패드 0 제외
        "97": "1",
        "98": "2",
        "99": "3",
        "100": "4",
        "101": "5",
        "102": "6",
        "103": "7",
        "104": "8",
        "105": "9",


        "21": "한/영", //한영키 제외
        "65": "A", // 알파벳 A제외
        "66": "B",
        // "67": "C",
        // "68": "D",
        "69": "E",
        // "70": "F",
        "71": "G",
        // "72": "H",
        "73": "I",
        "74": "J",
        "75": "K",
        "76": "L",
        "77": "M",
        // "78": "N",
        "79": "O",
        // "80": "P",
        "81": "Q",
        "82": "R",
        "83": "S",
        "84": "T",
        // "85": "U",
        "87": "W",
        "89": "Y",
        "90": "Z",
        "8": "backspace",
        "9": "tab",
        "13": "enter",
        "16": "shift",
        "17": "ctrl",
        "18": "alt",
        "19": "pause",
        "20": "capslock",
        "27": "escape",
        "32": "space",
        "33": "pageup",
        "34": "pagedown",
        "35": "end",
        "36": "home",
        "37": "left",
        "38": "up",
        "39": "right",
        "40": "down",
        "45": "insert",
        "46": "delete",
        "48": ")",
        "57": "(",
        "86": "ctrl-v",
        "88": "ctrl-x",
        "91": "left window key",
        "92": "right window key",
        "93": "select",
        "107": "add",
        "109": "subtract",
        "110": "decimal point",
        "111": "divide",
        "112": "f1",
        "113": "f2",
        "114": "f3",
        "115": "f4",
        "116": "f5",
        "117": "f6",
        "118": "f7",
        "119": "f8",
        "120": "f9",
        "121": "f10",
        "122": "f11",
        "123": "f12",
        "144": "numlock",
        "145": "scrolllock",
        "186": "semicolon",
        "187": "equalsign",
        "188": "comma",
        "189": "dash",
        "190": "period",
        "191": "slash",
        "192": "graveaccent",
        "219": "{",
        "220": "backslash",
        "221": "}",
        "222": "quote"
    };

var delay; //setTimeout 함수 저장변수
var saveStatus = true; //저장 유도 변수(코드 변경시 저장상태 변경)
var saveImg = $("#save-img"); //save 이미지 변경 관련 변수
var srcReplyCnt; //src 댓글 카운트
//---------console관련 변수
var editConsoleView = document.getElementById("edit-console-view"); //실제 결과값이 찍히는 콘솔화면 div태그
var editConsole = document.getElementById("edit-console");  //콘솔전체를 감싸는 div태그
var commandLine = document.getElementById("command-line-view"); //명령어 작성하는 input태그

var srcId, srcWriter, srcComments, srcTitle, srcWriterName, srcRegdate, srcUpdate, viewCnt, likeCnt, srcStatus, userId, Heart;
var strHtml, strCss, strJs; //코드미러 객체에서 string 값 받아올 변수
var curhref = location.href; //현재 주소 받아오는 변수
var saving = false; //저장중에 여러번 누르는 경우 막기 위한 변수

var codeMLayout = document.getElementsByClassName("CodeMirror");

var codeMain = document.getElementById("code-main");
var codeMirrorLayout = document.getElementsByClassName("CodeMirror");
var codeLayout = document.getElementsByClassName("code_layout");
var srcId, srcWriter, srcComments, srcTitle, srcWriterName, srcRegdate, srcUpdate, viewCnt, likeCnt, srcStatus, srcReplyRegdate, srcReplyUpdate;
var userId;
var Heart;
var strHtml, strCss, strJs;
var curhref = location.href;

//cdn관련 변수
var cdnCssidx = 1;// csscdn id값 변경
var cdnCssCnt = 0;//csscdn 갯수
var cdnJsidx = 1;// jscdn id값 변경
var cdnJsCnt = 0;//jscdn 갯수
var cdnCss = new Array();
var cdnJs = new Array();
//cdn 문자열 임시저장변수
var cssLnkSet = "";
var jsLnkSet = "";

var consoleCategory = []; // 콘솔 함수 문자열 배열
var consoleSearchLog = []; //검색한 로그들 저장해두는 배열
var consoleCur = -1; //현재 검색한 로그 위치값 저장변수

// var dragging = false;

var likebt = $("#likebt"); //e좋아요 버튼

var pageTitleView = document.getElementById("page-title-view"); //div
var pageTitleText = document.getElementById("page-title-text"); //input

//--------------------------------------------------------------------------------------------------------------------함수정의부분

//cdn추가 삭제 관련 함수
function cdnCssAdd(str) { //cdn 추가시 화면에 찍어주는 함수
    $("#cdn-css").append("<div class=\"row\" id='cdn-add-css" + cdnCssidx + "'>" +
        "<div class=\"col cdn_div\">\n" +
        "<div class=\"col\">\n" +
        "<img src=\"/resources/images/positionChange.png\">\n" +
        "<input class=\"form-control cdn_input\" type=\"text\" id=\"css-cdn" + cdnCssidx + "\"\n" +
        "placeholder=\"CDN을 추가해 주세요\" value='" + str + "'>\n" +
        "<button type=\"button\" class=\"close cdn_close\" aria-label=\"Close\"" +
        "onclick='cdnCssDelete(" + cdnCssidx + ");'>\n" +
        "<span aria-hidden=\"true\">&times;</span>\n" +
        "</button>\n" +
        "</div>\n" +
        "</div>" +
        "</div>");
    ++cdnCssidx; //cdn id값
    ++cdnCssCnt; //cdn 갯수 증가
    cdnChangeCss("cdn-css", cdnCssCnt); //cdn 갯수에 따라 overflow변경 함수
}

function cdnJsAdd(str) { //cdn 추가시 화면에 찍어주는 함수
    $("#cdn-js").append("<div class=\"row\" id='cdn-add-Js" + cdnJsidx + "'>" +
        "<div class=\"col cdn_div\">\n" +
        "<div class=\"col\">\n" +
        "<img src=\"/resources/images/positionChange.png\">\n" +
        "<input class=\"form-control cdn_input\" type=\"text\" id=\"js-cdn" + cdnJsidx + "\"\n" +
        "placeholder=\"CDN을 추가해 주세요\" value='" + str + "'>\n" +
        "<button type=\"button\" class=\"close cdn_close\" aria-label=\"Close\"" +
        "onclick='cdnJsDelete(" + cdnJsidx + ");'>\n" +
        "<span aria-hidden=\"true\">&times;</span>\n" +
        "</button>\n" +
        "</div>\n" +
        "</div>" +
        "</div>");
    ++cdnJsidx;//cdn id값
    ++cdnJsCnt;//cdn 갯수 증가
    cdnChangeCss("cdn-js", cdnJsCnt); //cdn 갯수에 따라 overflow변경 함수
}

function cdnCssDelete(idx) { //css cdn 삭제 함수
    if (cdnCssCnt > 2) { //화면에 기본으로 보여지는 갯수(2개) 보다 많을 경우
        $("#cdn-add-css" + idx).remove(); //해당 태그 삭제
        --cdnCssCnt; //cdn 갯수 감소
        cdnChangeCss("cdn-css", cdnCssCnt); //cdn 갯수에 따라 overflow변경 함수
    } else {
        $("#css-cdn" + idx).val(""); //문자열 값만 비우기
    }
}

function cdnJsDelete(idx) { //js cdn 삭제 함수
    if (cdnJsCnt > 2) { //화면에 기본으로 보여지는 갯수(2개) 보다 많을 경우
        $("#cdn-add-Js" + idx).remove(); //해당 태그 삭제
        --cdnJsCnt; //cdn 갯수 감소
        cdnChangeCss("cdn-js", cdnJsCnt); //cdn 갯수에 따라 overflow변경 함수
    } else {
        $("#js-cdn" + idx).val(""); //문자열 값만 비우기
    }
}

function cdnChangeCss(id, idx) { //cdn 갯수에 따라 overflow변경 함수
    if (idx > 4) {
        $("#" + id).css("overflow-y", "scroll");
    } else {
        $("#" + id).css("overflow-y", "auto");
    }
}

function cdnCssJsViewSet(arr, kind) { // Setting모달에 cdn 소스를 찍어주는 함수
    var arrlen = arr.length < 2 ? 2 : arr.length; //2개 이상일 경우 배열 갯수로
    if (kind === "css") { //css일때
        for (var i = 1; i <= arrlen; i++) {
            if (arr[i - 1]) {
                cdnCssAdd(arr[i - 1]);
            } else {
                cdnCssAdd("");
            }
        }
    } else { //js일때
        for (var i = 1; i <= arrlen; i++) {
            if (arr[i - 1]) {
                cdnJsAdd(arr[i - 1]);
            } else {
                cdnJsAdd("");
            }
        }
    }
}

function cdnCssJsValSet() {//iframe에 넣을 cdn 문자열 값 작업
    cdnCss = new Array();
    cdnJs = new Array();
    cssLnkSet = "";
    jsLnkSet = "";
    //cdn 갯수만큼 for문 돌리기
    for (var i = 1; i <= cdnCssCnt; i++) {
        if ($("#css-cdn" + i).length) {
            if ($("#css-cdn" + i).val()) {
                cdnCss.push($("#css-cdn" + i).val());
                cssLnkSet += "<link rel='stylesheet' href='" + $("#css-cdn" + i).val() + "'\/>";
                changeSaveImg(2);
            }
        }
    }
    for (var i = 1; i <= cdnJsCnt; i++) {
        if ($("#js-cdn" + i).length) {
            if ($("#js-cdn" + i).val()) {
                cdnJs.push($("#js-cdn" + i).val());
                jsLnkSet += "<script src='" + $("#js-cdn" + i).val() + "'><\/script>";
                changeSaveImg(2);
            }
        }
    }
}

//브레이크 포인트
function makeMarker() {
    var marker = document.createElement("div");
    marker.style.color = "#822";
    marker.innerHTML = "●";
    return marker;
}
function codeChangeEvent(){ //코드변환 이벤트시 작용할 작업들
    changeSaveImg(2); //저장 이미지 변경(저장유도)
    clearTimeout(delay); //기존 setTimeout 초기화

    if ($('#autoPreview').is(':checked')) { //자동 미리보기 (3초 딜레이)
        delay = setTimeout(updatePreview, 2000);
    }

    if ($('#autoSave').is(':checked')) { // 자동 저장기능
        // clearTimeout(delay);
        if (srcId !== "") { //srcId가 없을 경우 저장 안함
            delay = setTimeout(codeSave, 30000); // 3초 딜레이
        }
    }
}

var changeTitle = function (el) { //타이틀 찍어주는 함수 (이벤트 발생한 객체 받아옴)
    changeSaveImg(2);
    srcTitle = el.value;
    document.getElementById("src-title").innerHTML = srcTitle;
    if (el.id === "src-title-modal") {
        document.getElementById("src-title-input").value = srcTitle;
    } else {
        document.getElementById("src-title-modal").value = srcTitle;
    }
    pageTitleView.style = "display: block;";
    pageTitleText.style = "display: none;";
}

function updatePreview() { //작성된 코드 미리보기

    $("#resultView").remove(); //iframe 삭제

    var imsi = document.createElement("iframe"); //iframe 생성
    imsi.setAttribute("class", "col");
    imsi.setAttribute("id", "resultView");
    imsi.setAttribute("scrolling", "yes");
    $("#iframe-body").html(imsi); //생성된 iframe 화면에 직접 대입

    // var val = codeHtml.getValue().replace(/<equation>((.*?\n)*?.*?)<\/equation>/ig, function (a, b) {
    //     return '<img src="http://latex.codecogs.com/png.latex?' + encodeURIComponent(b) + '" />';
    // });

    var previewFrame = document.getElementById('resultView'); // iframe 객체
    var out = previewFrame.contentDocument || previewFrame.contentWindow.document; //iframe document 객체 받기

    //초기화중

    // emojify.run(out);
    //
    // var old = out.cloneNode(true);
    // var allold = old.getElementsByTagName("*");
    // if (allold === undefined) return;
    //
    // var allnew = out.getElementsByTagName("*");
    // if (allnew === undefined) return;
    //
    // for (var i = 0, max = Math.min(allold.length, allnew.length); i < max; i++) {
    //     if (!allold[i].isEqualNode(allnew[i])) {
    //         out.scrollTop = allnew[i].offsetTop;
    //         return;
    //     }
    // }

    // clearTimeout(hashto);
    // hashto = setTimeout(updateHash, 1000);


    // var cacheWhitelist = ['v2'];

    // caches.keys().then(function (keyList) {
    //     return Promise.all(keyList.map(function (key) {
    //         if (cacheWhitelist.indexOf(key) === -1) {
    //             console.log(key);
    //             return caches.delete(key);
    //         }
    //     }));
    // });


    out.open(); //out 객체 오픈
    out.write(  // out 객체 코드작성
        cssLnkSet
        +
        "<script>" + consoleString + "</script>"
        +
        "<style>" + codeCss.getValue() + "</style>"
        +
        codeHtml.getValue()
        +
        jsLnkSet
        +
        "<script>"
        // +
        // consoleString
        + codeJavaScript.getValue() + "<\/script>"
    );

    out.close();

    // consoleView("");
    // editConsoleView.scrollTop = editConsoleView.scrollHeight;
}

// window.onload = function() {
//     var previewFrame = document.getElementById('resultView');
//     var out = previewFrame.contentDocument || previewFrame.contentWindow.document;
//     out.location.reload();
// };

// var console=(function(oldCons){
//     return {
//         log: function(text){
//             oldCons.log(text);
//             editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>\"" + text + "\"</p>";
//             // Your code
//         },
//         info: function (text) {
//             oldCons.info(text);
//             editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>\"" + text + "\"</p>";
//             // Your code
//         },
//         warn: function (text) {
//             oldCons.warn(text);
//             editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>\"" + text + "\"</p>";
//             // Your code
//         },
//         error: function (text) {
//             oldCons.error(text);
//             editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>\"" + text + "\"</p>";
//             // Your code
//         }
//     };
// }(window.console));


function getSelectedRange() {  //선택영역 autoFormatSelection
    return {from: codeHtml.getCursor(true), to: codeHtml.getCursor(false)};
}

function getSelectedRange1() { //autoFormatSelection
    return {from: codeCss.getCursor(true), to: codeCss.getCursor(false)};
}

function getSelectedRange2() { //autoFormatSelection
    return {from: codeJavaScript.getCursor(true), to: codeJavaScript.getCursor(false)};
}

// function getSelectedRange3() {
//     return {from: codeJSAlgorithm.getCursor(true), to: codeJSAlgorithm.getCursor(false)};
// }

//--Ctrl-Alt-F
function autoFormatSelection() {
    var range = getSelectedRange();
    codeHtml.autoFormatRange(range.from, range.to);
    var range1 = getSelectedRange1();
    codeCss.autoFormatRange(range1.from, range1.to);
    var range2 = getSelectedRange2();
    codeJavaScript.autoFormatRange(range2.from, range2.to);
    // var range3 = getSelectedRange3();
    // codeJSAlgorithm.autoFormatRange(range3.from, range3.to);
}

//--ctrl+/
// function commentSelection(isComment) {
//     var range = getSelectedRange();
// codeHtml.commentRange(isComment, range.from, range.to);
// codeCss.autoFormatRange(range.from, range.to);
// codeJavaScript.autoFormatRange(range.from, range.to);
// }

function escapeHtml(text) {// 문자치환
    return text
        .replace(/&lt;/gi, "<")
        .replace(/&gt;/gi, ">")
        .replace(/&#33;/gi, "!")
        .replace(/&#034;/gi, '"')
        .replace(/&quot;/gi, '"')
        .replace(/&#035;/gi, '"')
        .replace(/&#037;/gi, "%")
        .replace(/&amp;/gi, "&")
        .replace(/&#038;/gi, "&")
        .replace(/&#039;/gi, "'");
}


function codeSave() {//코드 저장 로직

    if(!saving) {
        if (!saveStatus) {
            saving = true; //저장중으로 변경
            srcId = curhref.replace("https://", "").replace("http://", "").replace(document.location.host + "/edit/editPage", "").replace("/", ""); //srcId 가져오기

            $.ajax({ //코드저장
                type: "post",
                url: "/edit/save",
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "POST"
                },
                dataType: 'text',
                data: JSON.stringify({
                    srcId: srcId,
                    srcComments: srcComments,
                    srcWriter: srcWriter,
                    srcTitle: srcTitle,
                    srcHtml: codeHtml.getValue(),
                    srcCss: codeCss.getValue(),
                    srcJavaScript: codeJavaScript.getValue(),
                    srcStatus: srcStatus,
                    cdnCss: cdnCss,
                    cdnJs: cdnJs
                }),
                success: function (getLink) {
                    alert("저장 되었습니다.");

                    if (srcId === "" && userId === "") {
                        document.cookie = getLink + "=";    //익명으로 저장시 해당 쿠키 저장
                    }

                    if (srcId === "" || (srcWriter === "0" && userId !== "")) {
                        location.replace("/edit/editPage/" + getLink); // 반환된 링크로 화면 갱신
                    }
                    changeSaveImg(1); //저장 이미지 변경
                    saving = false;
                }
            });
        } else {
            alert("변경된 사항이 없습니다.");
        }
    }else{
        alert("저장중입니다.");
    }
}

function srcDelete() { //소스코드 삭제
    $.ajax({
        type: "post",
        url: "/edit/delete",
        headers: {
            "Content-Type": "application/json",
            "X-HTTP-Method-Override": "POST"
        },
        // dataType: 'text',
        data: JSON.stringify({
            srcId: srcId,
            srcStatus: srcStatus
        }),
        success: function (result) {
            alert("삭제되었습니다.");
            location.replace("/"); //메인 화면으로 이동
        }
    });
}




var consoleView = function (str) {
    //console.log() 입력시 문자열 작업(정규식)
    var previewFrame = document.getElementById('resultView'); //iframe 객체

    var temp = consoleLogStr(str);

    if (str !== "") {
        try {
            editConsoleView.innerHTML += "<p class='console-log'> &nbsp;> " + str + "</p>";

            consoleLogView(temp, consoleCategory); //콘솔 로그관련
            editConsoleView.innerHTML += "<p class='console-log' style='color:darkorange;'> &nbsp;<· "
                + previewFrame.contentWindow.eval(str) + "</p>";
        } catch (err) {
            editConsoleView.innerHTML += "<p class='console-log' style='color:red;'> &nbsp;<· " + "Uncaught " + err.name + " : " + err.message + "</p>"
        }

        editConsoleView.scrollTop = editConsoleView.scrollHeight;
    }
};

function consoleLogView(temp, consoleCategory) {
    if (temp !== null) {
        for (i in temp) {
            var color = "";
            if (consoleCategory[i] === "log") {
                color = "darkseagreen";
            } else if (consoleCategory[i] === "info") {
                color = "dodgerblue";
            } else if (consoleCategory[i] === "warn") {
                color = "yellow";
            } else if (consoleCategory[i] === "error") {
                color = "red";
            }
            editConsoleView.innerHTML += "<p class='console-log' style='color:" + color + ";'>\"" + temp[i] + "\"</p>"
        }
    }
}

//
function consoleLogStr(str) { //콘솔 요청함수 문자열로 자르기
    var reg = /console\.(log|info|warn|error)\(\"([\w|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*)\"\)|console\.(log|info|warn|error)\(\'([ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w]*)\'\)/g; //정규식
    var temp = str.match(reg);
    var category = ["log", "info", "warn", "error"];
    for (i in temp) {

        for (j in category) {
            if (temp[i].indexOf("console." + category[j] + "(") !== -1) {
                consoleCategory[i] = category[j];
                temp[i] = temp[i].replace("console." + category[j] + "(", "");
                temp[i] = temp[i].replace("'", "");
                temp[i] = temp[i].replace("\"", "");
                temp[i] = temp[i].replace("')", "");
                temp[i] = temp[i].replace("\")", "");
                break;
            }
        }
    }
    return temp;
}

//콘솔객체 재정의 (커스텀 콘솔에 값 같이 찍기 위해서 정의함)  iframe 내부에서 사용
var consoleString = "var console=(function(oldCons){\n" +
    "        return {\n" +
    "            log: function(text){\n" +
    "                oldCons.log(text);\n" +
    "                parent.document.getElementById(\"edit-console-view\").innerHTML += \"<p class='console-log' style='color:darkseagreen;'>&nbsp;&nbsp;\\\"\" + text + \"\\\"</p>\";\n" +
    "            },\n" +
    "            info: function (text) {\n" +
    "                oldCons.info(text);\n" +
    "                parent.document.getElementById(\"edit-console-view\").innerHTML += \"<p class='console-log' style='color:dodgerblue;'>&nbsp;&nbsp;\\\"\" + text + \"\\\"</p>\";\n" +
    "            },\n" +
    "            warn: function (text) {\n" +
    "                oldCons.warn(text);\n" +
    "                parent.document.getElementById(\"edit-console-view\").innerHTML += \"<p class='console-log' style='color:yellow;'>&nbsp;&nbsp;\\\"\" + text + \"\\\"</p>\";\n" +
    "            },\n" +
    "            error: function (text) {\n" +
    "                oldCons.error(text);\n" +
    "                parent.document.getElementById(\"edit-console-view\").innerHTML += \"<p class='console-log' style='color:red;'>&nbsp;&nbsp;\\\"\" + text + \"\\\"</p>\";\n" +
    "            }\n" +
    "        };\n" +
    "    }(parent.document.getElementById('resultView').contentWindow.console));\n";

$(function () { //콘솔객체 재정의 (커스텀 콘솔에 값 같이 찍기 위해서 정의함)
    var console = (function (oldCons) {
        return {
            log: function (text) {
                oldCons.log(text);
                document.getElementById("edit-console-view").innerHTML += "<p class='console-log' style='color:darkseagreen;'>&nbsp;&nbsp;\"" + text + "\"</p>";
                // Your code
            },
            info: function (text) {
                oldCons.info(text);
                document.getElementById("edit-console-view").innerHTML += "<p class='console-log' style='color:darkseagreen;'>&nbsp;&nbsp;\"" + text + "\"</p>";
                // Your code
            },
            warn: function (text) {
                oldCons.warn(text);
                document.getElementById("edit-console-view").innerHTML += "<p class='console-log' style='color:darkseagreen;'>&nbsp;&nbsp;\"" + text + "\"</p>";
                // Your code
            },
            error: function (text) {
                oldCons.error(text);
                document.getElementById("edit-console-view").innerHTML += "<p class='console-log' style='color:darkseagreen;'>&nbsp;&nbsp;\"" + text + "\"</p>";
                // Your code
            }
        };
    }(window.console));

    window.console = console;
});

//저장 이미지 변경
function changeSaveImg(idx) {
    if (saveImg !== null) { //저장버튼 활성화 됐을때
        if (idx === 2) {  //저장유도
            saveImg.css("color", "#00c4ff");
            saveStatus = false;
        } else { //저장유도 X
            saveImg.css("color", "gray");
            saveStatus = true;
        }

    }
}

//이미지 색상 체크
function likeImgChange(remove, kinds, color) {
    likebt.addClass(kinds);
    likebt.removeClass(remove);
    likebt.css("color", color);
    $("#modalSrcLikeImg").addClass(kinds);
    $("#modalSrcLikeImg").removeClass(remove);
    $("#modalSrcLikeImg").css("color", color);
}

//==========================================GFM setting

var URL = window.URL || window.webkitURL || window.mozURL || window.msURL;
navigator.saveBlob = navigator.saveBlob || navigator.msSaveBlob || navigator.mozSaveBlob || navigator.webkitSaveBlob;
window.saveAs = window.saveAs || window.webkitSaveAs || window.mozSaveAs || window.msSaveAs;

// Because highlight.js is a bit awkward at times
var languageOverrides = {
    js: 'javascript',
    html: 'xml'
};

// emojify.setConfig({img_dir: 'emoji'});

// var md = markdownit({
//     html: true,
//     linkify: true,
//     highlight: function (code, lang) {
//         if (languageOverrides[lang]) lang = languageOverrides[lang];
//         if (lang && hljs.getLanguage(lang)) {
//             try {
//                 return hljs.highlight(lang, code).value;
//             } catch (e) { }
//         }
//         return '';
//     }
// })
//     .use(markdownitFootnote);
//
// var hashto;

// function update(e) {
//     setOutput(e.getValue());
//
//     clearTimeout(hashto);
// hashto = setTimeout(updateHash, 1000);
// }

// function setOutput(val) {
// val = val.replace(/<equation>((.*?\n)*?.*?)<\/equation>/ig, function(a, b){
//     return '<img src="http://latex.codecogs.com/png.latex?' + encodeURIComponent(b) + '" />';
// });
//
// var out = document.getElementById('resultView');
//
// var old = out.cloneNode(true);
// out.innerHTML = md.render(val);
// return md.render(val);

// markDownUpdate();
// emojify.run(out);
// codeHtml.setValue(md.render(val));


// var allold = old.getElementsByTagName("*");
// if (allold === undefined) return;
//
// var allnew = out.getElementsByTagName("*");
// if (allnew === undefined) return;
//
// for (var i = 0, max = Math.min(allold.length, allnew.length); i < max; i++) {
//     if (!allold[i].isEqualNode(allnew[i])) {
//         out.scrollTop = allnew[i].offsetTop;
//         return;
//     }
// }
// }

// codeHtml.on('change', update(codeHtml.getValue()));

document.addEventListener('drop', function (e) {
    e.preventDefault();
    e.stopPropagation();

    var reader = new FileReader();
    reader.onload = function (e) {
        codeHtml.setValue(e.target.result);
    };

    reader.readAsText(e.dataTransfer.files[0]);
}, false);


// function saveAsMarkdown() {
//     save(codeHtml.getValue(), "untitled.md");
// }

// function saveAsHtml() {
//     save(document.getElementById('resultView').innerHTML, "untitled.html");
// }

// document.getElementById('saveas-markdown').addEventListener('click', function () {
//     saveAsMarkdown();
//     hideMenu();
// });

// document.getElementById('saveas-html').addEventListener('click', function () {
//     saveAsHtml();
//     hideMenu();
// });

// function save(code, name) {
//     var blob = new Blob([code], {type: 'text/plain'});
//     if (window.saveAs) {
//         window.saveAs(blob, name);
//     } else if (navigator.saveBlob) {
//         navigator.saveBlob(blob, name);
//     } else {
//         url = URL.createObjectURL(blob);
//         var link = document.createElement("a");
//         link.setAttribute("href", url);
//         link.setAttribute("download", name);
//         var event = document.createEvent('MouseEvents');
//         event.initMouseEvent('click', true, true, window, 1, 0, 0, 0, 0, false, false, false, false, 0, null);
//         link.dispatchEvent(event);
//     }
// }


// var menuVisible = false;
// var menu = document.getElementById('menu');
//
// function showMenu() {
//     menuVisible = true;
//     menu.style.display = 'block';
// }
//
// function hideMenu() {
//     menuVisible = false;
//     menu.style.display = 'none';
// }

// document.getElementById('close-menu').addEventListener('click', function () {
//     hideMenu();
// });


// document.addEventListener('keydown', function (e) {
//     if (e.keyCode == 83 && (e.ctrlKey || e.metaKey)) {
//         alert(111);
//         e.shiftKey ? showMenu() : saveAsMarkdown();
//
//         e.preventDefault();
//         return false;
//     }
//
//     if (e.keyCode === 27 && menuVisible) {
//         hideMenu();
//
//         e.preventDefault();
//         return false;
//     }
// }, {passive: true});


// function updateHash() {
//     window.location.hash = btoa( // base64 so url-safe
//         RawDeflate.deflate( // gzip
//             unescape(encodeURIComponent( // convert to utf8
//                 codeHtml.getValue()
//             ))
//         )
//     );
// }

// if (window.location.hash) {
//     var h = window.location.hash.replace(/^#/, '');
//     if (h.slice(0, 5) == 'view:') {
//         setOutput(decodeURIComponent(escape(RawDeflate.inflate(atob(h.slice(5))))));
//         document.body.className = 'view';
//     } else {
//         codeHtml.setOption(
//             decodeURIComponent(escape(
//                 RawDeflate.inflate(
//                     atob(
//                         h
//                     )
//                 )
//             ))
//         );
//         updatePreview();
//         codeHtml.focus();
//     }
// }
// else {
//     // updatePreview();
//     codeHtml.focus();
// }
// document.write("<script src='//d1l6p2sc9645hc.cloudfront.net/tracker.js' data-gs='GSN-265185-D' async'></script>");

//소스댓글리스트
function getPageList(pageInfo) {
    // alert(pageInfo);


    $.getJSON({
        type: 'get',
        dataType: "json",
        contentType: "application/json", //RestController이기 때문에 생략가능

        // url: "/srcReply/srcListJson.do?srcId=" + srcId,
        // url: "/srcReply/"+srcId+"/"+page,
        url: pageInfo,


        error: function () {
            alert('리스트실패!!');
        },

        success: function (result) {
            console.log(result);
            // console.log(result[i].reply

            var output = "";


            for (var i in result.list) {
                // alert(result.list[i].reply_writer + ":" + userId);
                // alert(userId);
                output += "<div class=\"row reply_list\" id=\"reply-list-view\" data-rno= " + result.list[i].reply_id + ">";
                output += "<div class=\"col-2 no_padding\">";
                output += "<img class=\"user_img\" src=\"" + getFileInfo(result.list[i].userProfile) + "\" id=\"reply-list-user-img\">";
                output += "</div>";
                output += "<div class=\"col\">";
                output += "<div style=\"display: block;\" class=\"row reply_user_data_view\" id=\"reply-user-id\">";
                output += "<span class=\"reply_user_name\" id=\"reply-user-name\">" + result.list[i].userName + "</span>";

                if (result.list[i].reply_writer != userId) {
                    output += "<a class=\"btn btn-outline-secondary btn-sm\" href=\"javascript:;\"\n" +
                        "                                       style =\"visibility: hidden;\"\n" +
                        "                                       id=\"reply-modify-button\" data-rno= " + result.list[i].reply_id + ">\n" +
                        "                                        Modify\n" +
                        "                                    </a>";

                    output += "<a class=\"btn btn-outline-secondary btn-sm\" href=\"javascript:;\"\n" +
                        "                                       style =\"visibility: hidden;\"\n" +
                        "                                       id=\"reply-delete-button\" data-rno= " + result.list[i].reply_id + ">\n" +
                        "                                        Delete\n" +
                        "                                    </a>";
                } else if (result.list[i].reply_writer == userId) {
                    // alert('bbb');
                    output += "<a class=\"btn btn-outline-secondary btn-sm\" href=\"javascript:;\"\n" +
                        "                                       style =\"visibility: visible;\"\n" +
                        "                                       id=\"reply-modify-button\" data-rno= " + result.list[i].reply_id + ">\n" +
                        "                                        Modify\n" +
                        "                                    </a>";

                    output += "<a class=\"btn btn-outline-secondary btn-sm\" href=\"javascript:;\"\n" +
                        "                                       style =\"visibility: visible;\"\n" +
                        "                                       id=\"reply-delete-button\" data-rno= " + result.list[i].reply_id + ">\n" +
                        "                                        Delete\n" +
                        "                                    </a>";
                }
                output += "<div style =\"float: right\" class=\"right\">" + changeDate(result.list[i].reply_update) + "</div>";
                output += "</div>";

                if (result.list[i].reply_writer != userId) {
                    output += "<textarea readonly  class=\"form-control reply_content\"" +
                        " id=" + result.list[i].reply_id + " data-rno= " + result.list[i].reply_id + ">"
                        + result.list[i].reply_text + "</textarea>";
                } else {
                    output += "<textarea  class=\"form-control reply_content\"" +
                        " id=" + result.list[i].reply_id + " data-rno= " + result.list[i].reply_id + ">"
                        + result.list[i].reply_text + "</textarea>";
                }

                output += "</div>";
                output += "</div>";

            }
            $("#list_view_all").html(output); //반복구간 시작전 부동위치 id에 동적태그 주입

        }

    })
}


function getPage(pageInfo) {

    $.getJSON(pageInfo, function (data) {
        // printData(data.list, $("#repliesDiv"), $('#template'));
        getPageList(pageInfo);
        printPaging(data.pageMaker, $(".pagination"));

        // alert(111);
        srcReplyCnt = data.pageMaker.totalCount;
        if (srcReplyCnt !== null ) {
             $("#reply-count").html(srcReplyCnt);}
        else {
             srcReplyCnt = 0;
        }


    });
}

var printPaging = function (pageMaker, target) {

    var str = "";

    if (pageMaker.prev) {
        str += "<li><a href='" + (pageMaker.startPage - 1)
            + "'> << </a></li>";
    }

    for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
        var strClass = pageMaker.cri.page == i ? 'class=active' : '';
        str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
    }

    if (pageMaker.next) {
        str += "<li><a href='" + (pageMaker.endPage + 1)
            + "'> >> </a></li>";
    }

    target.html(str);
};


// function iScroll() {
//     var lastScrollTop = 0;
//     var easeEffect = 'easeInQuint';
//
//
//     // 1. 스크롤 이벤트 발생
//     // $("#list_view_all").scroll(function () { // ① 스크롤 이벤트 최초 발생
//
//         var currentScrollTop = $("#list_view_all").scrollTop();
//         // alert(currentScrollTop);
//
//     // alert("currentScrollTop - lastScrollTop");
//     // alert(currentScrollTop - lastScrollTop);
//     // alert("$(window).scrollTop()");
//     // alert($(window).scrollTop());
//     // alert("$(document).height()");
//     // alert($(document).height());
//     // alert("$(window).height()");
//     // alert($(window).height());
//         /*
//             =================   다운 스크롤인 상태  ================
//         */
//         if (currentScrollTop - lastScrollTop > 0) {
//             // down-scroll : 현재 게시글 다음의 글을 불러온다.
//             // console.log("down-scroll");
//
//             // 2. 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
//             // var a = $(window).scrollTop() >= ($(document).height() - $(window).height());
//
//
//
//             if ($(window).scrollTop() >= ($(document).height() - $(window).height())) { //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
//
//                 // 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 data-bno속성 값을 받아온다.
//                 //      즉, 현재 뿌려진 게시글의 마지막 bno값을 읽어오는 것이다.( 이 다음의 게시글들을 가져오기 위해 필요한 데이터이다.)
//                 // var lastbno = $(".scrolling:last").attr("data-bno");
//                 var lastbno = $("#reply-list-view:last").attr("data-bno");
//
//                 // alert(lastbno);
//
//                 // 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 bno를 서버로 보내어 그 다음 20개의 게시물 데이터를 받아온다.
//                 $.ajax({
//                     type: 'post',  // 요청 method 방식
//                     // url: 'infiniteScrollDown',// 요청할 서버의 url
//                     url: "/srcReply/infiniteScrollDown",
//                     headers: {
//                         "Content-Type": "application/json",
//                         "X-HTTP-Method-Override": "POST"
//                     },
//                     dataType: 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
//                     data: JSON.stringify({ // 서버로 보낼 데이터 명시
//                         reply_id: lastbno
//                     }),
//                     success: function (result) {// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
//
//                         var output = "";
//                         // 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
//                         if (result != null) {
//                             //6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
//                             for (var i in result){
//                                 // 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
//                                 // console.log(result[i].reply_id);
//                                 //     alert(result[i].reply_id);
//                                     output += "<div class=\"row reply_list\" id=\"reply-list-view\" data-bno= "+ result[i].reply_id +" >";
//                                     output += "<div class=\"col-2 no_padding\">";
//                                     output += "<img class=\"user_img\" src=\"/resources/images/logo.png\" id=\"reply-list-user-img\">";
//                                     output += "</div>";
//                                     output += "<div class=\"col\">";
//                                     output += "<div class=\"row reply_user_data_view\" id=\"reply-user-id\">";
//                                     output += "<span class=\"reply_user_name\" id=\"reply-user-name\">"+ result[i].userName + "</span>";
//                                     output += "<a class=\"btn btn-outline-secondary btn-sm\" href=\"javascript:;\"\n" +
//                                         "                                       id=\"reply-modify-button\">\n" +
//                                         "                                        Modify\n" +
//                                         "                                    </a>";
//                                     output += "<a class=\"btn btn-outline-secondary btn-sm\" href=\"javascript:;\"\n" +
//                                         "                                       id=\"reply-delete-button\">\n" +
//                                         "                                        Delete\n" +
//                                         "                                    </a>";
//                                     output += "</div>";
//                                     output += "<div class=\"form-control reply_content\" id=\"reply_content\">"+ result[i].reply_text + "</div>";
//                                     output += "</div>";
//                                     output += "</div>";
//
//                                 }// each
//                             // 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 output을  뿌려준다.
//
//                             // $(".listToChange").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.
//                             // $("#reply-list-view").empty();
//
//                             // $(".scrollLocation").after(str);
//                             $("#list_view_all").html(output);
//
//                         }// if : data!=null
//                         else { // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..
//                             // alert("더 불러올 데이터가 없습니다.");
//                         }// else
//
//                     }// success
//                 });// ajax
//
//                 // 여기서 class가 listToChange인 것중 가장 처음인 것을 찾아서 그 위치로 이동하자.
//                 // var position = $(".listToChange:first").offset();// 위치 값
//                 var position = $("#reply-list-view:first").offset();// 위치 값
//
//
//                 // 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
//                 // $('html,body').stop().animate({scrollTop: position.top}, 600, easeEffect);
//
//             }//if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
//
//             // lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
//             lastScrollTop = currentScrollTop;
//         }// 다운스크롤인 상태
//
//         /*
//             =================   업 스크롤인 상태   ================
//         */
//         // else {
//         //     // up- scroll : 현재 게시글 이전의 글을 불러온다.
//         //     console.log("up-scroll");
//         //
//         //     // 2. 현재 스크롤의 top 좌표가  <= 0 되는 순간
//         //     if ($(window).scrollTop() <= 0) { //
//         //
//         //         // 3. class가 scrolling인 것의 요소 중 첫 번째 요소를 선택한 다음 그것의 data-bno속성 값을 받아온다.
//         //         //      즉, 현재 뿌려진 게시글의 첫 번째 bno값을 읽어오는 것이다.( 이 전의 게시글들을 가져오기 위해 필요한 데이터이다.)
//         //         var firstbno = $(".scrolling:first").attr("data-bno");
//         //
//         //         // 4. ajax를 이용하여 현재 뿌려진 게시글의 첫 번째 bno를 서버로 보내어 그 이전의 20개의 게시물 데이터를 받아온다.
//         //         $.ajax({
//         //             type: 'post',  // 요청 method 방식
//         //             url: 'infiniteScrollUp',// 요청할 서버의 url
//         //             headers: {
//         //                 "Content-Type": "application/json",
//         //                 "X-HTTP-Method-Override": "POST"
//         //             },
//         //             dataType: 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
//         //             data: JSON.stringify({ // 서버로 보낼 데이터 명시
//         //                 bno: firstbno
//         //             }),
//         //             success: function (data) {// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
//         //
//         //                 var str = "";
//         //
//         //                 // 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
//         //                 // 이때 서버에서 값이 없으면 null을 던질줄 알았는데 ""를 던진다. 따라서 (data != null) 이라는 체크를 해주면 안되고, (data != "") 만 해주어야한다.
//         //                 // 이건아마 컨트롤러의 리턴타입이 @ResponseBody로 json형태로 던져지는데 이때 아마 아무것도 없는게 ""로 명시되어 날아오는것 같다.
//         //                 if (data != "") {
//         //
//         //                     //6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
//         //                     $(data).each(
//         //                         // 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
//         //                         function () {
//         //                             console.log(this);
//         //                             str += "<tr class=" + "'listToChange'" + ">"
//         //                                 + "<td class=" + "'scrolling'" + " data-bno='" + this.bno + "'>"
//         //                                 + this.bno
//         //                                 + "</td>"
//         //                                 + "<td>" + this.title + "</td>"
//         //                                 + "<td>" + this.writer + "</td>"
//         //                                 + "<td>" + this.regdate + "</td>"
//         //                                 + "<td>" + this.viewcnt + "</td>"
//         //                                 + "</tr>";
//         //
//         //                         });// each
//         //                     // 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
//         //                     $(".listToChange").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.
//         //                     $(".scrollLocation").after(str);
//         //
//         //                 }//if : data != ""
//         //                 else { // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..??
//         //
//         //                     alert("더 불러올 데이터가 없습니다.");
//         //                 }// else
//         //
//         //             }// success
//         //         });// ajax
//         //
//         //         // 스크롤 다운이벤트 때  ajax통신이 발생하지 않을때 까지의 좌표까지 스크롤을 내려가주기.
//         //         var position = ($(document).height() - $(window).height()) - 10;
//         //
//         //         // 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
//         //         $('html,body').stop().animate({scrollTop: position}, 600, easeEffect);
//         //
//         //     }//if : 현재 스크롤의 top 좌표가  <= 0 되는 순간
//         //
//         //     // lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
//         //     lastScrollTop = currentScrollTop;
//         // }// else : 업 스크롤인 상태
//
//
//     // })//$("#list_view_all").
//
//     // $.getJSON("/srcReply/srcListJson.do" + srcId, function () {
//     //     var str = "";
//     //     console.log(data.length);
//     //     $(data).each(
//     //
//     //
//     //         function () {
//     //             str += "<li data-replyId='" + this.replyId + "' class='leplyLi'> "
//     //                 + this.replyId + ":" + this.replyText
//     //                 + "</li>";
//     //         });
//     //     $("#reply-user-name").html(str);
//     //
//     // });
//
//
//     // $.getJSON("/srcReply/srcListJson.do/"+srcId, function (data) {
//     //     console.log(data.length);
//     // });
// }

// **날짜 변환 함수 작성
var changeDate = function (date) {
    date = new Date(parseInt(date));
    year = date.getFullYear();
    month = date.getMonth() + 1;
    if (month < 10) {
        month = '0'+month;
    }

    day = date.getDate();
    if (day < 10) {
        day = '0'+day;
    }

    hour = date.getHours();
    minute = date.getMinutes();
    second = date.getSeconds();
    strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
    return strDate;
};

