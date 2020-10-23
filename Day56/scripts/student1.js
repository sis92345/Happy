        //자바스크립트 객체 생성 방법2: 생성자 이용
        //캡슐화 -- >this키워드 제한
        function Student(hakbun, name, kor, eng, mat){
            var hakbun= hakbun;//private 개념
            var name = name;//멤버변수를 속성이라고한다.
            var kor = kor;
            var eng = eng;
            var mat =mat;
            var tot = null;
            var avg = null;
            var grade = null;
            this.calc = function(){ //public 개념의 method
                //calc는 function을 가르키는 주소다.
                tot = kor + eng + mat;
                avg = tot/3;
                grade = (avg>=90) ? 'A':
                                        (avg>=80) ? 'B':
                                            (avg>=70) ? 'C':
                                                (avg>=60) ? 'D': 'F';
            }
            //this는 public
            this.getTot = function(){
                return tot;
            }
            this.toString = function(){
                document.write('<ul>');
                document.write('<li>학번 :' + hakbun + '</li>');
                document.write('<li>이름 :' + name + '</li>');
                document.write('<li>국어 :' + kor+ '</li>');
                document.write('<li>영어 :' + eng + '</li>');
                document.write('<li>수학 :' + mat + '</li>');
                document.write('<li>총점 :' + tot + '</li>');
                document.write('<li>평균 :' + avg + '</li>');
                document.write('<li>평점 :' + grade + '</li>');
                document.write('</ul>');
                document.write('<hr>');
            }
        }