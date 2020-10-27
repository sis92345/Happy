window.onload = function(){
    document.getElementById('btn').addEventListener('click', myclick,  false);
}
function myclick(){
    var name = document.getElementById('irum').Value;
    var today = new Date().toLocaleString();
    var jumsu = null; //맞은 개수
    var array = [5+6, 8-3, 7*6, 15 / 3, 8+6-3*2/2];
    for(var i=1; i<6;i++){
        var munje = document.getElementById('question' + i);
        if(munje.value == array[i-1]){
            jumsu++;
        }else{
            wrongStryleChange(munje) //파라미터로 넘어온 것은 텍스트 박스
    }
    var str = ' ';
    str += '<div>' + name + '님이 방문한 날짜는' + today + '이며' + '</div>';
    str += '<div>' + array.length + '문제 중 ' + jumsu + '개를 맞추셔서 </div>';
    str += '<div>' + jumsu * 20 + '점이며 틀린 문제는 빨간색으로 표시했습니다.</div>';
    document.getElementById('resultarea').innerHTML = str;
    document.getElementById('resultarea').style.visibility = 'visible';
}
function wrongStryleChange(munje){ //파라미터로 넘어온 것은 텍스트 박스
    munje.style.backgroundColor = 'red';
    munje.style.color = 'white';
    munje.style.fontweight = '900';
}
}