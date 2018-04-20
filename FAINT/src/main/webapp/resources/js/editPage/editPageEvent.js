


//codeHtml펜에 키업 이벤트 발생시 마다 위 이벤트키를 제외하고 자동으로 힌트창 보여준다. 수동키인 ctrl+ Space 와 병행사용 가능
codeHtml.on("keyup", function (cm, event) {
    if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
        !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {   /*Enter - do not open autocomplete list just after item has been selected in it*/
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

//codeHtml펜에 번호표 옆에 빈칸을 클릭시 codeEdit.js의 makeMarker 를 호출해서 마크 뿌려줌
codeHtml.on("gutterClick", function (cm, n) {
    var info = cm.lineInfo(n);
    cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
});

//codeCss펜에 키업 이벤트 발생시 마다 위 이벤트키를 제외하고 자동으로 힌트창 보여준다. 수동키인 ctrl+ Space 와 병행사용 가능
codeCss.on("keyup", function (cm, event) {
    if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
        !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {        /*Enter - do not open autocomplete list just after item has been selected in it*/
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
// codeCss.on("gutterClick", function (cm, n) {
//     var info = cm.lineInfo(n);
//     cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
// });

//codeJavaScript 펜 키업 이벤트 발생시 마다 위 이벤트키를 제외하고 자동으로 힌트창 보여준다. 수동키인 ctrl+ Space 와 병행사용 가능
codeJavaScript.on("keyup", function (cm, event) {
    if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
        !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {        /*Enter - do not open autocomplete list just after item has been selected in it*/
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
// codeJSAlgorithm.on("keyup", function (cm, event) {
//     if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
//         !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {        /*Enter - do not open autocomplete list just after item has been selected in it*/
//         var scope = {};
//         var preventList = ['StyleFix', 'PrefixFree', 'Html2Jade', 'alert'];
//         for (var i in window) {
//             if (preventList.indexOf(i) === -1) {
//                 scope[i] = window[i]
//             }
//         }
//         CodeMirror.commands.autocomplete(cm, null, {completeSingle: false, globalScope: scope});
//     }
// });

//codeJavaScript 펜에 번호표 옆에 빈칸을 클릭시 codeEdit.js의 makeMarker 를 호출해서 마크 뿌려줌
codeJavaScript.on("gutterClick", function (cm, n) {
    var info = cm.lineInfo(n);
    cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
});

// HTML Preprocessor 설정
$(function () {

    $("#htmlPreprocessor").change(function () {
        // alert(selectedText); //선택된 text
        selectedText = $("#htmlPreprocessor option:selected").text();

        // document.getElementById("htmlPreprocessor");
        // var strUser = e.options[e.selectedIndex].value;

        if (selectedText === "None") {

        }
        else if (selectedText === "Haml") {


        } else if (selectedText === "MarkDown") {
            // alert(this.value);
            // alert(this.text);
            // document.write("<script src=" +
            //     "'/resources/dist/js/editPage/markDown.js'></script>");


            // codeHtml.setValue("");
            // codeHtml.clearHistory();
            // codeHtml.setOption("mode", 'gfm');
            // codeHtml.setOption("lineNumbers", false);
            // codeHtml.setOption("matchBrackets", 'true');
            // codeHtml.setOption("lineWrapping", 'true');
            // codeHtml.setOption("theme", 'base16-light');
            // codeHtml.setOption("extraKeys", {
            //     "Enter":
            //         "newlineAndIndentContinueMarkdownList"
            // });


            // alert(codeHtml.getOption("mode"));


        } else if (selectedText === "Slim") {


        } else if (selectedText === "Pug") {


        }

    });

});


//Setting Behavior부분 함수
$(function () {//---------------------------- tab-size 변경시
    $("#tab-size").change(function () {
        // alert(111);
        var st = $(":input:radio[name=gridRadios]:checked").val(); //라디오버튼 name= gridRadios 선택
        var sp = this.value; // sp변수에 값 저장
        // alert(st);
        // alert(sp);

        if (st === "option1") {  // option1 제외
            // alert('tab-click1');

            codeHtml.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(sp)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });
            codeCss.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(sp)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });
            codeJavaScript.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(sp)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });
        } else if (st === "option2") {

            // codeHtml.setOption("indentWithTabs", true);

            //지정된 크기의 탭사이즈로 변경
            codeHtml.setOption("tabSize", sp);
            codeCss.setOption("tabSize", sp);
            codeJavaScript.setOption("tabSize", sp);

        }
    });
});


//Setting Behavior부분 함수
$(function () {//---------------------------- option button 변경시


    $('input[type=radio][name=gridRadios]').change(function () { //라디오버튼 name= gridRadios 선택
        // alert('gridRadios');

        //id: tab-size요소 선택
        var e = document.getElementById("tab-size");
        //현재 리스트박스의 탭사이즈 값 가져오기.
        var strUser = e.options[e.selectedIndex].value;
        // alert (this.value);

        // var sp = this.value;
        if (this.value === "option1") { //option1일때 제외
            // alert('a');


            codeHtml.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(strUser)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });
            codeCss.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(strUser)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });


            codeJavaScript.setOption("extraKeys", {


                "Ctrl-Space": "autocomplete",
                "Ctrl-Q": function (cm) {
                    cm.foldCode(cm.getCursor());
                },
                "Ctrl-Alt-F": autoFormatSelection,


                Tab: function (cm) {

                    cm.execCommand("insertSoftTab"); //백탭을 스페이스로

                    // var spaces = Array(cm.getOption("indentUnit") +
                    //     parseInt(strUser)).join(" ");
                    // cm.replaceSelection(spaces);
                    // cm.execCommand("defaultTab");
                    // cm.execCommand("indentMore");
                    // cm.execCommand("newlineAndIndent")

                }



            });


        } else if (this.value === "option2") {
            // alert('b');
            // codeHtml("tabSize", strUser);
            codeHtml.setOption("extraKeys", {
                Tab: function (cm) {
                    cm.execCommand("defaultTab"); //indent tab키로 설정시 백스페이스를 기본탭으로


                }
                // ,

                // "Ctrl-Space": "autocomplete",
                // "Ctrl-Q": function (cm) {
                //     cm.foldCode(cm.getCursor());
                // },
                // "Ctrl-Alt-F": autoFormatSelection
            });

            codeCss.setOption("extraKeys", {
                Tab: function (cm) {
                    cm.execCommand("defaultTab"); //indent tab키로 설정시 백스페이스를 기본탭으로
                },

                // "Ctrl-Space": "autocomplete",
                // "Ctrl-Q": function (cm) {
                //     cm.foldCode(cm.getCursor());
                // },
                // "Ctrl-Alt-F": autoFormatSelection
            });


            codeJavaScript.setOption("extraKeys", {

                // "Ctrl-Space": "autocomplete",
                // "Ctrl-Q": function (cm) {
                //     cm.foldCode(cm.getCursor());
                // },
                // "Ctrl-Alt-F": autoFormatSelection,


                "Tab": function (cm) {

                    cm.execCommand("defaultTab"); //indent tab키로 설정시 백스페이스를 기본탭으로

                }
                // ,
                // "Shift-Tab": function (cm) {
                //     cm.indentSelection("subtract");
                // }
            });




        }
    });
});

//editHeader.jsp script

$(function () {

    if ($('#autoPreview').is(':checked')) { //첫 로딩시 상태
    } else {
        var runstyle = document.getElementById("run");
        runstyle.style = "visibility: visible;"
    }

    //처음 문서 로드시 콘솔창 숨기기
    editConsole.style.display = "none";
    commandLine.style.display = "none";



    //pencil 클릭시 input text 보이기
    $("#pencil").click(function () { //붓 클릭시 input박스 활성화
        pageTitleView.style = "display: none;";
        pageTitleText.style = "display: block;";
        document.getElementById("src-title-input").focus();
    });
    //pageTitle input작성 완료후 focus 똔는 enter를 쳤을때
    $("#src-title-input").keydown(function (key) {
        if (key.keyCode == 13) { //enter
            changeTitle(this); //타이들 관련 부분 모두 변경
        }
    });
    $("#src-title-input").focusout(function (e) { //focus에서 나갔을때
        changeTitle(this); //타이들 관련 부분 모두 변경
    });

    $("#src-title-modal").keydown(function () { //모달창에서 title 입력시
        changeTitle(this); //타이들 관련 부분 모두 변경
    });



    $("#autoPreview").click(function () { //클릭시 상태
        var runstyle = document.getElementById("run");
        if (this.checked) {
            runstyle.style = "visibility: hidden;"
        } else {
            runstyle.style = "visibility: visible;"
        }
    });

    //------------------------------------------------------코드 입력시 변화 이벤트 받기
    codeHtml.on("change", function () {
        codeChangeEvent();
    });

    codeCss.on("change", function () {
        codeChangeEvent();
    });

    codeJavaScript.on("change", function () {
        codeChangeEvent();
    });

    $("#run").click(function () { // run button 실행
        updatePreview();
    });

    $("#command-line").keyup(function (e) { //커멘드 라인에서 키 입력시
        if (e.keyCode === 13) { //enter
            consoleView(this.value);
            this.value = "";
        }
    });

    $("#console-button").click(function () { //footer에 있는 콘솔버튼 눌렀을때
        if (editConsole.style.display === "none") {
            editConsole.style.display = "block";
            commandLine.style.display = "block";

            jQuery("#console-button").addClass("btn_active");

        } else {
            editConsole.style.display = "none";
            commandLine.style.display = "none";
            jQuery("#console-button").removeClass("btn_active");

        }
    });

    $("#modal-comment").on("change", function (e) { //comments 변경시 등록
        changeSaveImg(2);
        srcComments = this.value;
        document.getElementById("comment-view").value = srcComments;
    });

    $("#setting").on("hide.bs.modal", function () { //setting 모달 닫힐때 이벤트
        cdnCssJsValSet();
        updatePreview();
    });

    $("#like").click(function (e) { //좋아요 버튼 클릭시
        $.ajax({
            type: "post",
            url: "/edit/like",
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: 'json',
            data: JSON.stringify({
                srcId: srcId
            }),
            success: function (success) {
                if (success.result === 0) {
                    //좋아요 추가시
                    likeImgChange("fa-heart-o", "fa-heart", "red");
                } else {
                    //좋아요 취소시
                    likeImgChange("fa-heart", "fa-heart-o", "gray");
                }

                document.getElementById("like-couont").innerHTML = success.srcLikeCnt;
            }
        });
    });

    $("#saveCode").click(function (e) { //저장버튼 클릭시
        codeSave();
    });

    $("#login").click(function (e) { //로그인 버튼 클릭시
        if (window.sessionStorage) {
            if (srcId !== "") {
                sessionStorage.setItem('srcId', srcId);
            }
        }
        self.location = '/user/login'
    });

    $('input[name="visibility"]').on("change", function (e) {
        srcStatus = this.value;
    });

    $("#src-delete").click(function (e) { //삭제버튼 클릭시(setting 모달)
        srcDelete();
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

// save & update






// $('input[name="genderS"]:checked')

//=================SrcReply===============================================
$(function () {

    //총 댓글 갯수
    // var replyTotCnt = pageMaker.getTotalCount();

    //댓글등록 회원권한
    replyPage = 1; //기본리스트페이지 1페이지 지정
    if (srcId !== "") {  //저장됬을때
        getPage("/srcReply/" + srcId + "/" + replyPage); //rest 호출
    }


    if (userId == "") { //비회원일시
        $("#textarea").val("로그인 하세요!");
        $("#textarea").click(function () {
            alert("로그인 후 이용가능합니다!");
        });
        $("#post").click(function () {
            alert("로그인 후 이용가능합니다!");
        });


    } else {
        $("#textarea").removeAttr('readonly').val("");//로그인시 readonly속성제거

        //등록 & 전체목록
        $("#post").click(function (e) {
            var replyText = $("#textarea").val(); //id textarea초기화
            if (replyText !== "") { //댓글내용이 있을때
                $.ajax({
                    type: "post",
                    url: "/srcReply/srcInsert.do",// srcReply콘트롤러 srcInsert.do메서드 호출"
                    headers: {
                        "Content-Type": "application/json",
                        "X-HTTP-Method-Override": "POST"
                    },
                    dataType: 'text', //응답타입

                    data: JSON.stringify({ //요청 내용
                        srcId: srcId,
                        replyText: replyText,
                        replyWriter: userId,
                        replyStatus: srcStatus
                    }),


                    error: function () {
                        alert("등록에러");
                        // if (userId == "") then
                        // alert("로그인 후 이용가능합니다!");
                    },

                    success: function (result) {
                        // console.log("result:" + result);
                        alert("등록 되었습니다.");
                        // getPageList(); //전체목록
                        replyPage = 1; //보여줄페이지 1페이지 지정
                        getPage("/srcReply/" + srcId + "/" + replyPage); //rest
                        $("#textarea").val(""); //textarea 초기화


                    }
                });
            } else {
                alert("내용을 입력하세요!");
                $("#textarea").focus(); //포커스 지정
            }

        });


        //삭제
        $("#list_view_all").on("click", "#reply-delete-button", function (e) {


            var reply = $(this);
            var replyId = reply.attr("data-rno"); //#reply-delete-button data-rno추가


            $.ajax({
                type: 'delete',
                url: '/srcReply/srcDelete.do/' + replyId, //rest

                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "DELETE"
                },
                dataType: 'text', //리턴타입

                error: function () {
                    // if (userId == " ") then
                    // alert("로그인 후 이용가능합니다!");

                },


                success: function (result) {
                    console.log("result: " + result);
                    if (result === 'SUCCESS') {
                        alert("삭제 되었습니다");
                        // getPageList();
                        getPage("/srcReply/" + srcId + "/" + replyPage); // rest


                    }
                },

                "change": function () {

                }
            })


        });


        //수정
        $("#list_view_all").on("click", "#reply-modify-button", function (e) { //동적생성된 선택자에게 위임처리
            var reply = $(this);  // #reply-modify-button의 현재값 저장
            var rno; //리플게시글 번호(Reply_id)
            rno = reply.attr("data-rno");  // data-rno 속성 값 저장
            // alert(rno);
            var replytext = $('#' + rno).val(); // 동적 rno id값 저장
            // alert(replytext);

            $.ajax({
                type: 'put',
                url: '/srcReply/srcUpdate.do/' + rno, //reset

                headers: { //요청데이터타입: json , 수정: PUT
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "PUT"
                },
                data: JSON.stringify({ // 요청내용
                    srcId: srcId,
                    replyText: replytext,
                    replyId: rno
                }),

                dataType: 'text', //응답데이터 :text

                error: function () {
                    // if (userId == " ") then
                    // alert("로그인 후 이용가능합니다!");

                },

                success: function (result) {
                    console.log("result: " + result);
                    if (result === 'SUCCESS') {
                        alert("수정 되었습니다");
                        // getPageList();
                        getPage("/srcReply/" + srcId + "/" + replyPage);//rest호출
                    }
                }
            })
        });

    }//if

    $(".pagination").on("click", "li a", function (event) {//페이지네이션

        event.preventDefault();

        replyPage = $(this).attr("href"); //li태그 href속성값 읽어오기

        getPage("/srcReply/" + srcId + "/" + replyPage); //rest호출
        // getPageList("/srcReply/"+srcId+"/"+replyPage);

    }); //else


});


// $(function () {
//     $('html, body').css({'overflow': 'hidden', 'height': '100%'}); // 모달팝업 중 html,body의 scroll을 hidden시킴
//     $('#list_view_all').on('scroll touchmove mousewheel', function (event) { // 터치무브와 마우스휠 스크롤 방지
//         // if($(window).scrollTop() == $(document).height() - $(window).height()){
//         //     alert(111);
//         // }
//         event.preventDefault();
//         event.stopPropagation();
//         return false;
//     });
// });


// $(function () {
//     $("#list_view_all").jscroll({
//         autoTrigger: true,
//         loadingHtml: '<div class="row reply_list load_view" id="reply-more-list">' +
//         '<div class="load">' +
//         '<div class="line"></div>' +
//         '<div class="line"></div>' +
//         '<div class="line"></div>' +
//         '</div>' +
//         '</div>',
//         nextSelector: 'a.nextPage:last'
//     })
// });


$(function () {
    $("#command-line").keydown(function (e) {

        if (e.keyCode === 13) { //enter
            consoleSearchLog.unshift(this.value);// 배열 앞에 추가
            consoleCur = -1; //현제 겸색로그 위치 초기화
        } else if (e.keyCode === 38) { //화살표키 위
            if (consoleSearchLog.length - 1 !== consoleCur) { //현제 위치가 끝이 아닐때
                consoleCur++; //위치값 증가
                this.value = consoleSearchLog[consoleCur]; //배열값 가져와 커멘드라인에 찍기
            }

        } else if (e.keyCode === 40) { //화살표키 아래
            if (consoleCur > 0) { //현재 위치가 처음이 아닐때
                consoleCur--; //위치값 감소
                this.value = consoleSearchLog[consoleCur];
            } else {
                if (consoleCur === 0) { //배열위치 값은 -1이 없으므로 현재 위치가 0이고 화살표 아래키를 눌렀기 때문에 현재위치 감소
                    consoleCur--;
                }
                this.value = "" //커맨드 라인 value값 빈문자열로 찍기
            }
        }
    });
});

$(function () {
    $("#console-clear").click(function () {
        editConsoleView.innerHTML = ""; //콘솔 비우기
    });
});