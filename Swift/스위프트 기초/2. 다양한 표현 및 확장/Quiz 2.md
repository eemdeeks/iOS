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
```

## Q5. 스위프트 옵셔널 심화 퀴즈

### 아래 코드에서 eemdeeks 객체의 집(home)의 경비원(guard)의 이름(name)의 값에 접근하는 코드를 한 줄로 작성해 봅시다.

```swift
class Person {
    var name: String
    var home: Apartment?
    init(name: String) {
        self.name = name
    }
}
class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}
let eemdeeks: Person? = Person(name: "eemdeeks")
```
 let guardName: String? = _____________

### 직전 문제와 연결된 코드입니다. 아래 코드 실행 후 출력 결과를 빈칸에 입력하세요.

```swift
eemdeeks?.home?.guard?.name = "슈퍼맨"
let name = guardName ?? "경비원"
print(name) // [출력결과]
```
[출력결과] : _____________


### 아래 빈 칸을 알맞게 채워보세요

```swift
class Person {
    var name: String = ""
}
class Student: Person {
    var school: String = ""
}

var eemdeeks: Person = Person()

if let casted: Student = eemdeeks______빈칸________ Student {
    print("\(casted.name)은 Student입니다")
}
```

## Q6. 스위프트 빠른 종료 퀴즈

### 다음 빈칸에 가장 알맞은 함수를 고르세요
```swift
func function(age: int?) {
    [빈칸](age != nil, "age == nil")
    [빈칸]((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
}
```
- debug
- assert
- dump
- scanf
- print

### 다음 빈칸에 공통적으로 들어갈 표현을 채워보세요
```swift
func function(age: Int?) {
    [빈칸] let unwrappedAge = age, 
        unwrappedAge < 130,
        unwrappedAge >= 0 else {
        print("나이값 입력이 잘못되었습니다.")
        return
    }
    print("당신의 나이는 \(unwrappedAge)세입니다")
}
var count = 1
while true {
    [빈칸] count < 3 else{
        break
    }
    print(count)
    count += 1
}

func someFunction(info: [String: Any]) {
    [빈칸] let name = info["name"] as? String else {
        return
    }
    [빈칸] let age = info["age"] as? Int, age >= 0 else {
        return
    }
    print("\(name): \(age)")
}
someFunction(info: ["name": "jenny", "age": "10"])
```

## Q7. 스위프트 타입 확장 퀴즈

### 아래 코드의 [빈칸]에 적절한 표현을 작성해보세요
```swift
[빈칸] Talkable {
    var topic: String { get set }
    var language: String { get }
    func talk()
    init(topic: String, language: String)
}

struct Person: Talkable {
    var topic: String
    let language: String
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다")
    }
    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}
```

### 아래 코드가 정상적으로 동작하기 위해서 [빈칸]에 필요한 공통적인 표현을 채워보세요
```swift
[빈칸] Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}
print(1.isEven) // false

[빈칸] Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
}
print(3.multiply(by: 2))  // 6
```





















