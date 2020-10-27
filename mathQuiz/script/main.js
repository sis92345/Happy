window.addEventListener('load', setup, false);
        var count = 0; //맞은 개수
        var tot = 0;
        function setup(){
            var userAns = document.getElementsByName('answer');
            //1. 정답을 맞추는 이벤트
            document.querySelector('#btn').addEventListener('click', mycalc, false);
            //2. 맞춘 정답을 결과 화면으로 출력하는 이벤트
            document.querySelector('#btn').addEventListener('click', myoutput, false);
            //3. 미입력 칸을 클릭하면 자동으로 공백 입력
            //answer는 배열이다.
            //배열에 이벤트를 걸때는 반드시 for문으로 처리해야하나?
            for(var i = 0; i < userAns.length; i++){
                userAns[i].addEventListener('focus', reinput ,false);
            }
        }
        function reinput(){
            var userAns = document.getElementsByName('answer');
            for(var i = 0; i < userAns.length; i++){
                if(userAns[i].value == '값을 입력'){
                    //만약 유저가 값을 입력하지 않았다면...
                    userAns[i].value = '';
                }
                
            }
        }
        function myoutput(){
            var fi = document.querySelector('#outputtd');
            var username = document.querySelector('#userid').value;
            var date = new Date();
            var str = '<fieldset id="output">';
            str = str + '<p>';
            str += username + '님의' +  date.toLocaleDateString() +'계산 퀴즈 결과';
            str += ' 총 5문제 중 ' + count + '문제를 틀렸습니다.'
            str += '<br>';
            str += '틀린 답은 빨간색으로 표시 하였습니다.';
            str += '<br>';
            str += '최종 점수는 <span id=\'tot\'>' + tot + '점</span>입니다.';
            str += '</p>';
            str += '</fieldset>';
            fi.innerHTML = str;
            //초기화
            count = 0;
            tot = 0;
        }
        function mycalc(){
            //계산 이벤트
            //정답
            var answers = [11, 5, 42, 18, 11];
            //유저 입력 값
            var userAns = document.getElementsByName('answer');
            //console.log(typeof(userAns));
            
            for(var i = 0; i < userAns.length; i++){
                //console.log(userAns[2].value);
                if(answers[i] == userAns[i].value){
                    //만약 유저와 유저의 입력값이 같다면...
                    userAns[i].style.backgroundColor = 'green';
                    userAns[i].style.color = 'white';
                    tot += 20;
                }else if(answers[i] != userAns[i].value){
                    //console.log(userAns[2].value);
                    userAns[i].style.backgroundColor = 'red';
                    userAns[i].style.color = 'white';
                    count++;
                }
                if(userAns[i].value == '' || userAns[i].value === '값을 입력'){
                    userAns[i].style.backgroundColor = 'gray';
                    userAns[i].style.color = 'white';
                    userAns[i].value = '값을 입력';
                }
            }
        }