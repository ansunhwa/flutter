import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  //1. 유저에게 무엇을 낼건지 물어보는
  print('가위, 바위, 보 중 하나를 입력해 주세요');

  final String? userInput =  stdin.readLineSync(encoding: utf8);   //사용자가 넣은거 한 줄 읽어 오기
  print('내가 낸 값 : $userInput');

  //2. 컴퓨터가 랜덤 추출
  const comList = ['가위', '보', '바위'];
  final comResult = comList[Random().nextInt(3)];  // `0,1,2 까지
  print('컴이 낸 값 : $comResult');

  final result = getResult(userInput!, comResult);
  print('사용자는 $userInput 을 냈습니다');
  print('컴퓨터는 $comResult 를 냈습니다');
  print('결과는  $result 을 냈습니다');
}

getResult(String userInput, String comInput) {
  const comWin = '컴퓨터 승리';
  const userwin = '사용자 승리';
  const draw = '비겼습니다';

  String result = draw;

  switch(userInput) {
    case '가위' :
      if(comInput == '바위') {
        result = comWin;
      }
      if(comInput == '보') {
        result = userwin;
      }
    case '바위' :
      if(comInput == '보') {
        result = comWin;
      }
      if(comInput == '가위') {
        result = userwin;
      }
    case '보' :
      if(comInput == '가위') {
        result = comWin;
      }
      if(comInput == '바위') {
        result = userwin;
      }
    default:
      result = '값이 정확하지 않습니다';
  }
  return result;

}