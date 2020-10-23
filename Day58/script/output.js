function output(){
    var str = ' ';
    for(var i = 0; i < array.length; i++){
        str += array[i].toString(); //학생의 tr을 누적
    }
    document.querySelector('#result').innerHTML = str;
    
}