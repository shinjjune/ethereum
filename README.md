
## Solidity 문법을 정리해보자(remix에서 작업을 하자)

<p>참조: https://xayahfirst.tistory.com/14 </p>

-  **솔리디티의 컨트랙?**

자바의 클래스와 비슷한 개념이라고 생각하면 될 것 같다.



- **컨트랙의 구조**

pragma solidity + 버전정보

contract mycontract(컨트랙의 이름)

상태변수 : 클래스의 멤버변수라고 생각하면 될 것 같다.

생성자 생성 : constructor() public{ }

함수 : 자바와 자바스크립트를 섞은 느낌



### **문법구조**



**접근제어자**

가시성(Visibility) - 4가지로 구분된다.

**external**

 \- 외부컨트랙만 접근가능(같은 함수 내부에서 호출되면 안됨)

 \- 상태변수는 external 불가능

**internal**

 \- 컨트랙 내부호출가능

 \- 상속받은 컨트랙도 호출가능

 \- 상태변수는 디폴트로 internal 선언

**public**

 \- 컨트랙 내부호출 가능

 \- 상속받은 컨트랙도 호출가능

 \- 외부컨트랙도 호출가능

**private**

 \- 컨트랙 내부만 호출가능



**함수타입제어자**

**view**

 \- 데이터를 읽을 수만 있다. read only - '데이터를 읽는다'는 것은 블록체인에서 읽어온다는 말

 \- 가스비용 없음

**pure**

 \- 데이터 읽지않음

 \- 인자값만 활용해서 반환값 정함

 \- 가스비용 없음

**constant**

 \- 0.4.17이전에는 view/pure대신쓰였음 ( 현재는 안쓰는 제어자)

**payable**

 \- 함수가 에더(eth)를 받을 수 있게함

 \- 가스비용 있음



**값타입**

**boolean** - 모두 익숙한 불린타입입니다.

 \- true/false

**int** - 모두 익숙한 정수타입입니다.

 \- 정수

**uint** 

 \- unsigned int (보통 양수만 사용하기 때문에 주로사용합니다.)

**address**

 \- 20bytes 고정 이더리움 계정주소

 \- 두개의 멤버소유 balance, transfer

**bytes**

 \- 문자열저장(hex로 변환해서 저장해야함)

 \- solidity는 string에 최적화 되어있지 않기 때문에 bytes로 사용

 \- string 타입은 가스비용이 더 요구됨

 \- bytes == bytes1 같은 의미라는 것

**bytes/string**

 \- 크기 무한, 값타입은 아니고 참조형과 비슷

**enum** - 모두 익숙한? 열거형입니다.

 \- 열거형(문자열배열에 index를 부여한 자료형)

 \- 값을 정수형으로 리턴

 \- 이름{value1,value2}



**참조타입 : 데이터위치를 말함**

**storage**

 \- 변수를 블록체인에 영구히 저장

 \- 디폴트로 상태변수는 storage

**memory**

 \- 임시저장변수(휘발성이라는 의미)

 \- 디폴트로 매개변수와 리턴값은 memory

 \- 배열은 strorage로 선언



**참조타입 : 배열**

 \- 정적배열과 동적배열이 있음

 \- 정적배열은 uint256[] memory a = new uint256[](5) 이런식으로 memory를 명시해야됨, 함수 밖에서는 상관없음



**참조타입 : 구조체**

struct : 필요한 자료형들을 가지고 새롭게 정의하는 사용자 정의타입

struct Student{

string name;

string gender;

...

}

이런식으로 사용



**참조타입 : 매핑**

 \- Key&Value를 쌍으로 저장하는 것 dictionary타입과 유사함

 \- mapping(_KeyType=>_ValueType) 이런식으로 사용

