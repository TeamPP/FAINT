//var allEditValue;//html, javascript, css 모두 합친 문자열
//------------------------------------------------------코드 자동 적용 기능

var codeJSAlgorithm = CodeMirror(document.getElementById("codeJSAlgorithm"), {
    mode: "javascript",
    lineNumbers: true,
    scrollbarStyle: "simple",    // 스크롤바 스타일
    keyMap: "sublime",           // 키맵
    matchBrackets: true,         // 괄호강조
    theme: "dracula",            // 테마
    tabSize: 4,                  // 탭키 간격
    lineWrapping: true,          // 가로 스크롤바 숨김, 너비에 맞게 줄바꿈.
    highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true},   // 같은단어강조
    // extraKeys: { ".": "autocomplete" },
    // extraKeys: { "Ctrl-Space": "autocomplete" }, //힌트

    // indentWithTabs: false,
    electricChars: true,         //중괄호 정렬
    resetSelectionOnContextMenu: false,
    smartIndent: true,
    lineWiseCopyCut: true,
    pasteLinesPerSelection: true,
    tabindex: 4,
    styleActiveLine: true,

    wordWrap: true,
    autoCloseBrackets: true,
    // gutters: ["CodeMirror-linenumbers", "breakpoints"],

    indentUnit: 1,                //들여쓰기
    lineWrapping: true,           //Folding
    extraKeys: {
        "Ctrl-Space": "autocomplete",
        "Ctrl-Q": function (cm) {
            cm.foldCode(cm.getCursor());
        }
        ,
        "Ctrl-Alt-F": autoFormatSelection
    },
    foldGutter: true,
    gutters: ["CodeMirror-linenumbers", "breakpoints", "CodeMirror-foldgutter"]
});
// editor.foldCode(CodeMirror.Pos(13, 0));

function getSelectedRange3() { //자동완성 영역지정
    return {from: codeJSAlgorithm.getCursor(true), to: codeJSAlgorithm.getCursor(false)};
}

function autoFormatSelection() {  //자동선택 범위지정
    var range3 = getSelectedRange3();
    codeJSAlgorithm.autoFormatRange(range3.from, range3.to);
}



var origin = codeJSAlgorithm.getValue();
var declaration = origin.substr(origin.indexOf("(")+1,origin.indexOf("{")-origin.indexOf("(")-2);
testFunc = new Function(declaration,origin.substr(origin.indexOf("{")+1,origin.lastIndexOf(";")-origin.indexOf("{")));

//키업 이벤트 발생시 마다 위 이벤트키를 제외하고 자동으로 힌트창 보여준다. 수동키인 ctrl+ Space 와 병행사용 가능
codeJSAlgorithm.on("keyup", function (cm, event) {
    if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
        !ExcludedIntelliSenseTriggerKeys2[(event.keyCode || event.which).toString()]) {        /*Enter - do not open autocomplete list just after item has been selected in it*/
        var scope = {};
        var preventList = ['StyleFix', 'PrefixFree', 'Html2Jade', 'alert'];
        for (var i in window) {
            if (preventList.indexOf(i) === -1) {
                scope[i] = window[i]
            }
        }
        CodeMirror.commands.autocomplete(cm, null, {completeSingle: false, globalScope: scope});
    }
});

// 아래 keyup 이벤트 발생시 제외할  키코드 아스키값
var ExcludedIntelliSenseTriggerKeys2 =
    {
        //num
        "49": "1",
        "50": "2",
        "51": "3",
        "52": "4",
        "53": "5",
        "54": "6",
        "55": "7",
        "56": "8",

        //key-pad
        "96": "0",
        "97": "1",
        "98": "2",
        "99": "3",
        "100": "4",
        "101": "5",
        "102": "6",
        "103": "7",
        "104": "8",
        "105": "9",


        "21": "한/영",
        "65": "A",
        "66": "B",
        // "67": "C",
        "68": "D",
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
        // "82": "R",
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


//
// //번호표 옆에 빈칸을 클릭시 codeEdit.js의 makeMarker 를 호출해서 마크 뿌려줌
// codeHtml.on("gutterClick", function (cm, n) {
//     var info = cm.lineInfo(n);
//     cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
// });
//

codeJSAlgorithm.on("gutterClick", function (cm, n) { //거터클릭시 중단점표시
    var info = cm.lineInfo(n);
    cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
});

//editHeader.jsp script
//pencil 클릭시 input text 보이기
$(function () {
    var pageTitleView = document.getElementById("page-title-view");
    var pageTitleText = document.getElementById("page-title-text");

    $("#pencil").click(function(){
        pageTitleView.style = "display: none;";
        pageTitleText.style = "display: block;";
        document.getElementById("src-title-input").focus();
    });
    //pageTitle input작성 완료후 focus 또는 enter를 쳤을때
    $("#src-title-input").keydown(function (key) {
        if(key.keyCode == 13) {
            changeTitle(this);
        }
    });
    $("#src-title-input").focusout(function (e) {
        changeTitle(this);
    });
    $("#src-title-modal").keydown(function(){
        changeTitle(this);
    });

    var changeTitle = function(el){
        srcTitle = el.value;
        document.getElementById("src-title").innerHTML = srcTitle;
        if(el.id === "src-title-modal"){
            document.getElementById("src-title-input").value = srcTitle;
        }else{
            document.getElementById("src-title-modal").value = srcTitle;
        }
        pageTitleView.style = "display: block;";
        pageTitleText.style = "display: none;";
    }
});

//comments 변경시 등록
// $(function () {
//     $("#modal-comment").on("change", function (e) {
//         srcComments = this.value;
//         document.getElementById("comment-view").value = srcComments;
//     });
// });

//Setting Behavior부분 함수
// $(function () {//---------------------------- tab-size 변경시
//     $("#tab-size").change(function () {
//         // alert(111);
//         var st = $(":input:radio[name=gridRadios]:checked").val();
//         var sp = this.value;
//         if (st === "option1") {
//
//             codeHtml.setOption("extraKeys", {
//                 Tab: function (cm) {
//                     var spaces = Array(cm.getOption("indentUnit") +
//                         parseInt(sp)).join(" ");
//                     cm.replaceSelection(spaces);
//                 }
//             });
//         } else if (st === "option2") {
//
//             // $("#gridRadios1").prop("checked", true);
//             codeHtml.setOption("tabSize", this.value);
//             codeCss.setOption("tabSize", this.value);
//             codeJavaScript.setOption("tabSize", this.value);
//         }
//     });
// });
//
// //Setting Behavior부분 함수
// $(function () {//---------------------------- option button 변경시
//     $('input[type=radio][name=gridRadios]').change(function () {
//         alert(222);
//
//         //현재 리스트박스의 탭사이즈 값 가져오기.
//         var e = document.getElementById("tab-size");
//         var strUser = e.options[e.selectedIndex].value;
//
//         // var sp = this.value;
//         if (this.value === "option1") {
//             // alert('a');
//
//             codeHtml.setOption("extraKeys", {
//                 Tab: function (cm) {
//                     var spaces = Array(cm.getOption("indentUnit") +
//                         parseInt(strUser)).join(" ");
//                     cm.replaceSelection(spaces);
//                 }
//             });
//         } else if (this.value === "option2") { // have to: option1 갖다오면 백탭안됨
//             // alert('b');
//             // codeHtml.setOption("indentWithTabs", true);
//             codeHtml.setOption("tabSize", strUser);
//             codeCss.setOption("tabSize", strUser);
//             codeJavaScript.setOption("tabSize", strUser);
//             console.log(strUser);
//
//         }
//     });
// });



$(function () {
    $("#command-line").keyup(function (e) {
        if (e.keyCode === 13) {
            consoleView(this.value);
            this.value = "";
        }
    });
});

//--------------------

//창 크기조절 관련
$(function () {
    $(window).resize(function () {
        //            창크기 width 제한
        if (this.outerWidth <= 450) {
            this.outerWidth = 450;
        }
    });
});

// jQuery(window).mouseup(function (e) {
//     $(window).unbind('mousemove');
//     $('.iframeWrapper').unbind('mousemove');
//     dragging = false;
// });
//
// jQuery('.iframeWrapper').mouseup(function (e) {
//     $(window).unbind('mousemove');
//     $('.iframeWrapper').unbind('mousemove');
//     dragging = false;
// });
