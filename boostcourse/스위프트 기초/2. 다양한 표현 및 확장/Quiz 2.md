# Quiz 2
## Q1. 스위프트 사용자정의 타입 퀴즈

### 다음 중 값 타입인 것을 모두 고르세요.(다중선택)
- 열거형
- 제네릭
- 구조체
- 클래스
- 클로저


### 다음 코드의 [빈칸1]과 [빈칸2]에 들어갈 코드의 쌍으로 알맞은 것을 고르세요.

```swift
enum Weekday {
     [빈칸1] mon, tue
     [빈칸1] wed
     [빈칸1] thu, fri, sat, sun
}

var day: Weekday = [빈칸2]

```

- switch / fri
- switch / .fri
- let / sat
- let / .sat
- case / sun
- case / .sun

### 다음 중 오류가 발생하지 않는 코드를 고르세요
```swift
struct MyStruct {
     var propertyA: Int = 10
     let propertyB: Int = 10
}

class MyClass {
     var propertyA: Int = 10
     let propertyB: Int = 10
}

let instance = MyStruct()
let object = MyClass()
```
- instance.propertyB = 20
- object.propertyA = 20
- object.propertyB = 20
- instance.propertyA = 20

