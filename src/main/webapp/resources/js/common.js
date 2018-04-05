
//길이 제한
function lengthCheck(obj, limit) {
   var msg = "이 값이 최대 " + limit + "개의 글자인지 확인하세요.";
   //길이 초과 할 경우 알림 발생, 초과 글자 제거
   if (obj.value.length > limit) {
      alert(msg);
      obj.value = obj.value.substr(0, limit);
      return false;
   }

	return true;
}

//searchFilter - 포스트 내용, 프로필 intro, 댓글 해쉬태그 및 인물태그 링크처리
function searchFilter(){
   $(".intro, .s2_2_1, .replyContainer").find("span").each(function(){
      
      //1. 텍스트 가져오기 & 처리한 새로운 문자
      var text = $(this).text();
      
      //2. split() 함수처리하기
      text = split(text);
      
      //3. 공백으로 나누기
      var splitArray = text.split(" ");
      
      //4. 특수문자 
      var special = "!$%^&*()-=+<>?_";
      
      //5. 링크처리
      for(var i in splitArray){
         var word = splitArray[i];
         
         //두글자 이상이면서, 첫글자가 #이면서 , 두번째글자가 특수문자가 아니면 링크처리
         if(splitArray[i].length!=1 && (word.indexOf("#")==0 && special.indexOf(splitArray[i].charAt(1))==-1)){
            var hash=word.substring(word.lastIndexOf("#")+1);
            splitArray[i] = "<a class='hashTag' href='/search/tags?name="+hash+"'>"+splitArray[i]+"</a>";
         
         
         //두글자 이상이면서, 첫글자가 @이면서 , 두번째글자가 특수문자가 아니면 링크처리
         } else if(splitArray[i].length!=1 && (word.indexOf("@")==0 && special.indexOf(splitArray[i].charAt(1))==-1)){
            var person=word.substring(word.lastIndexOf("@")+1);
            splitArray[i] = "<a class='hashTag' href='/member/"+person+"'>"+splitArray[i]+"</a>";
         }
      }
      
      //6. 한문장으로 합치기
      var splitMerge = splitArray.join(" ");
      
      $(this).html(splitMerge);
   });
}
//searchFilter메서드의 보조 사용 함수
function split(text){
    
    //1. 공백기준으로 나누기
    var splitArray = text.split(" ");
    
    //2. 처리될 특수문자 
    var special="!$%^&*()-=+<>?_";
    
    //3. 두글자 이상이면서, 2번째 글자가 특수문자가 아님
    // '#'->' #' : #과 @앞에 공백넣기
    for(var i in splitArray){
       if(splitArray[i].length!=1 && special.indexOf(splitArray[i].charAt(1))==-1){
           splitArray[i]=splitArray[i].replace(/#/g, " #"); 
           splitArray[i]=splitArray[i].replace(/@/g, " @"); 
       } //if end
    } // for end
    
    //4. 배열의 각 요소를 한문장으로 합치기
    var splitMerge = splitArray.join(" ");
    return splitMerge;
}