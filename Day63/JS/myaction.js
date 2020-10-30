window.onload = function(){
    var button = document.getElementsByTagName("button"); //getElements: 버튼 여러개 간주
    button[0].addEventListener('click', myclick, false);
    function myclick(){
        //뒤로가기: JS의 history 객체
        //history.back();도 가능
        history.go(-1);
        
    }
}