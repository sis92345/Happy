/*
    input.js
*/
function input(form){
    //전역변수
    var student = new Student(form.hakbun.value,  
                                            form.name.value, 
                                            parseInt(form.kor.value), 
                                            parseInt(form.eng.value), 
                                            parseInt(form.mat.value));
    array.push(student);
    //기존의 입력값 초기화 후 학번 텍스트박스로 포커스
    form.hakbun.value = ' ';
    form.name.value = ' ';
    form.kor.value = ' ';
    form.eng.value = ' ';
    form.mat.value = ' ';
    form.hakbun.focus();
    document.querySelector('#count').innerHTML = array.length;      
    if(array.length > 0){
        document.myform.btnCalc.disabled = false;
        document.myform.btnOutput.disabled = false;
    }                                  
}