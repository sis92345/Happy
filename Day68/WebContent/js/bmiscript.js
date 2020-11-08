window.onload = function(){
    document.forms[0].addEventListener('submit',myclick,false);
}

function myclick(){
    var f = this;
    if(!f.username.value || !f.age.value || !f.height.value || !f.weight.value){
        alert("필수 입력 값을 처리해 주세요");
        
        return false; //서버에 전송되는 것을 막는다.
        //evt.preventDefault() 
    }
    f.action = "/Day66/bmiserver.jsp" 
    f.method =  "post";
    f.submit();
}