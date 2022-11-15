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

## Q2. 스위프트 클로저 퀴즈

### 다음 빈칸에 알맞지 않은 코드를 고르세요.

 
```swift
func plus(a: Int, b: Int) -> Int {
     return a + b
}

let add: (Int, Int) -> Int = [빈칸]
```
- { return a + b }
- { (a, b) in return a + b }
- plus(a:b:)
- plus
- { $0 + $1 }

## Q3. 스위프트 프로퍼티 퀴즈

### 다음 코드의 [출력1], [출력2], [출력3]의 알맞은 값을 채워보세요.
```swift
struct Money {
    var currencyRate: Int = 100
    var dollar: Int = 0
    var won: Int {
        get {
            return dollar*currencyRate
        }
        set {
            dollar = newValue/currencyRate
        }
    }
}
var moneyInMyPocket = Money()
moneyInMyPocket.won = 11000
print(moneyInMyPocket.won) // [출력1]
moneyInMyPocket.dollar = 15
print(moneyInMyPocket.won) // [출력2]
print(moneyInMyPocket.dollar) // [출력3]
```
 

[출력1]:_____

[출력2]:_____

[출력3]:_____

답은 "/"로 구분하여 작성해주세요.(띄어쓰기 미포함)

ex)10/20/30

## Q4. 스위프트 클래스 퀴즈

### 다음 코드가 제대로 동작하기 위해 [빈칸]에 필요한 키워드를 채워보세요

```swift
class Person {
  [빈칸] func method() {
      print("method")
  }
}
class Student: Person {
    override [빈칸] func method() {
        print("overriden method")
    }
}

Person.method()
Student.method()
```

### 아래 코드는 인스턴스가 메모리에서 해제되는 시점에 호출되는 디이니셜라이저를 구현하는 코드입니다. [빈칸]에 알맞은 코드를 채워보세요

```swift
class Person {
    [빈칸] {
        print("Person 클래스의 인스턴스가 메모리에서 해제됩니다")
    }
}



























