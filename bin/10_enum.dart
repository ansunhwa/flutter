enum Status {          //각각이 하나의 객체
  approved,  //승인
  pending,   //대기
  rejected   //거절
}

void main() {
  Status status = Status.approved;

  if(status == Status.approved) {
    print('승인되었습니다');
  } else if(status == Status.pending){
    print('대기 하세요');
  } else {
    print('거절되었습니다');
  }
}