//생성자
function Student(hakbun, name, kor, eng, mat){
    //함수에서 var키워드를 붙이면 지역변수
    //Property
    var hakbun = hakbun;
    var name = name;
    var kor = kor;
    var eng = eng;
    var mat = mat;
    var tot= null;
    var avg= null;
    var grade= null;
    //지역변수로 접근하기위해서 public 사용 필요
    //자바스크립트의 public은 this를 이용해 getter setter 생성
    //익명함수 사용
    this.getKor = function(){
        return kor;
    }
    this.getEng = function(){
        return eng;
    }
    this.getMat = function(){
        return mat;
    }
    this.getTot = function(){   
        return tot;  
    }
    this.setTot = function(total){
        tot = total;
    }
    this.getAvg= function(){
        return avg;
    }
    this.setAvg = function(average){
        avg = average;
    }
    this.getGrade= function(){
        return grade;
    }
    this.setGrade = function(grd){
        grade = grd;
    }
    //toString
    this.toString = function(){
        var str = ' ';
        //하나의 학생은 테이블에 하나의 tr
        str = '<tr>';
        str += '<td>' + hakbun + '</td>';
        str += '<td>' + name + '</td>';
        str += '<td>' + kor + '</td>';
        str += '<td>' + eng + '</td>';
        str += '<td>' + mat + '</td>';
        str += '<td>' + tot + '</td>';
        str += '<td>' + avg.toFixed(1) + '</td>';
        str += '<td>' + grade + '</td>';
        str += '</tr>';
        return str;
    }
}
