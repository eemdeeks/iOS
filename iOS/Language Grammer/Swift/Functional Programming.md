# Functional Programming
Swift 함수형 프로그래밍

프로그램이 상태의 변화 없이 데이터 처리를 수학적 함수 계산으로 취급하고자 하는 것.


## 함수형 프로그래밍이란
- 함수의 응용을 중요하게 생각한다.
- 함수를 일급 객체로 다룬다.
- 함수가 외부의 영향을 받지 않고, 전달된 인자 값으로만 결과를 만들어 내기 때문에 순수하게 함수만으로 동작.
- 함수 호출이 다른 함수의 간섭이 없이 실행이 되기 때문에 병렬 처리할 때 예상하지 못한 오류가 적다.

## 일급 객체란?
1. 변수나 상수에 저장과 할당이 가능해야 한다.
2. 함수의 매개변수(파라미터)로 사용이 가능하다.
3. 함수(객체)에서 return이 가능하다.

### 1. 변수나 상수에 저장과 할당이 가능해야 한다.
```swift
func functional(a: String) -> String {
    return a
}
let funct = functional
```

### 2. 함수의 매개변수(파라미터)로 사용이 가능하다.
```swift
func funcUsePara(b: String) {
    print("swift")
}

funcUsePara(b: funct("스트링"))
```

### 3. 함수(객체)에서 return이 가능하다.
```swift
func functional2(a: String) -> String {
    return functional(a : "스트링")
}
```

## 순수함수
순수한 함수란 함수의 실행이 외부에 영향을 끼치지 않는 함수이다.

순수한 함수는 스레드가 안전하고, 병렬적인 계산이 가능하다.

ex)
```swift
func returnThree() -> Int {
    return 3
}

let intItem = returnThree()
let result = returnThree() * returnThree()
let result2 = intItem * intItem
```
returnThree()함수의 결과 값은 외부의 영향을 받지 않고 오로지 함수자체의 결과에만 의존한다.

그래서 returnThree()함수의 input이 null로 항상 일정하다면 result처럼 함수를 2번 선언하는 것이 아닌 함수의 결과 값 자체를 변수로 사용하여 최적화가 가능하다.

만약 returnThree()가 순수 함수가 아니라면 결과값이 달라질 것이다.

순수 함수란 이렇게 외부의 값(Side - Effect)에 의해 결과값이 달라지지 않고 input이 같다면 항상 같은 값을 도출하는 함수를 말한다.

## 익명 함수
익명함수란 말 그대로 이름이 없는 함수이다.

ex)
```swift
let test = { (item : String) -> Void in 
    print("item: \(item)")
}

test("테스트")
```

## 고차 함수
고계 함수(higher-order function)란, 함수를 다루는 함수를 뜻한다.

함수형 언어에서는 함수도 '값(value)'으로 취급한다. -> 정수 1이나 인수를 제곱하는 함수나 동등한 입장.

어떤 함수도 다른 함수의 인수로 전달 할 수 있다.

또한 함수의 결과 값으로도 함수를 반환 할 수 있다.

ex) map, filter, reduce 등

1에서 10까지 숫자로 이루어진 리스트의 각 원소를 제곱하고 싶다고 하자. 

명령형 언어에서는 반복문을 이용하여 리스트를 훑어 가며 각 원소를 제곱하겠지만, 함수형 언어에서는 리스트를 다루는 Map함수로 쉽게 처리할 수 있다. 

 
```swift
let item = numbers.map{ $0 * $0 }
```

## 마무리
함수형 프로그래밍에서 가장 중요한 것은 Side-Effect의 영향을 받지 않으면서 함수 중심의 프로그래밍을 진행 하는 것이다.

지금까지 그저 구글링 하며 만들어낸 프로젝트들의 코드들을 보면 거의 야무진 스파게티이다..

함수형 프로그래밍에 대하여 공부하다보니 내 코드의 문제점들을 알게 되었고 더 공부해서 내 코드의 점목시켜보도록 노력해야겠다.

***

### 참고
- [티스토리_코딩하는버디](https://coding-rengar.tistory.com/)
