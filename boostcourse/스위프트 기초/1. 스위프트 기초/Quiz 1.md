# Quiz
## Q1. 스위프트 기초개념 퀴즈
### 내 이름을 나타내는 변수를 선언할 때 적절한 이름은 무엇일까요?
- my-name
- my_name
- myName
- MyName

### 콘솔로그를 남기는 간단한 함수를 모두 선택하세요
- dump
- scanf
- print
- printf

### 아래 코드의 [빈칸]에 들어가기 알맞은 코드를 골라보세요
```swift
import Swift
let number: Int = 777
let output: String = [빈칸]
print(output)    // 행운의 숫자는 777입니다!
```
- "행운의 숫자는 \(number)입니다!”
- “행운의 숫자는 /(number)입니다!”
- “행운의 숫자는 %d입니다!”
- “행운의 숫자는 (number)입니다!”

### 차후에 변경이 불가능한 값을 선언하고 싶을 때 아래 코드의 [빈칸]에 들어갈 키워드를 골라보세요.
- var
- let
- static
- const

## Q2. 스위프트 기본 데이터타입 퀴즈
### 다음 중 오류가 발생하는 코드를 모두 선택하세요.
- let numberTwo: Double = 123
- let string: String = "A"
- let character: Character = 'A'
- let numberThree: UInt = -123
- let numberOne: Int = 123

### 다음 중 스위프트에서 없음을 나타내는 키워드를 고르세요.
- nil
- NULL
- No
- Any

### 다음 중 오류가 발생하는 코드를 모두 선택하세요
- var dictionary: [String:Int] = ["key":100]
- var dictionaryOne: Dictionary<String> = Dictionary<String>()
- var arrayOne: Array<Int> = [1, 2, 3]
- var arrayTwo: [Int] = Array<Int>()
- var arrayThree: [Int] = [Int]

## Q3. 스위프트 함수 퀴즈
### 다음 중 오류가 발생하는 코드를 고르세요.

```swift
func addOne(left a: Int, right b: Int) -> Int {
     return a + b
}

func addTwo(a: Int = 0, b: Int = 0) -> Int {
     return a + b
}
```
- addOne(left: 0, right: 0)
- addTwo(b: 10)
- addTwo(a: 10, b: 10)
- addOne(a: 10, b: 20)
- addTwo()
    
## Q4. 스위프트 제어구문 퀴즈
### 다음 코드의 실행 결과로 콘솔에 출력될 문자열을 입력해주세요.

```swift
import Swift
let someInteger = 50

if someInteger < 100 {
     print("100 미만")
} else if someInteger > 0 {
     print("0 초과")
} else if someInteger > 30 {
     print("30 초과")
} else {
     print("50")
}
```
출력 결과 :  _______
    
### 다음 코드의 실행 결과로 콘솔에 출력될 문자열로 알맞은 것을 고르세요.

```swift
let someInteger = 50

case 0:
     print("zero")
case 1..<100:
     print("1~99")
case 50:
     print("50")
}
```
- zero
- 50
- 실행불가
- 1~99
              
### 다음 코드의 실행 결과로 콘솔에 출력될 내용을 고르세요.

```swift
let max = 1
var count = 0

repeat {
     count = count + 1
     print(count)
} while count < max
```
- 1
- 01
- 0
- 출력내용 없음
    
## Q5. 스위프트 옵셔널 퀴즈
### 다음 중 오류가 발생하는 코드를 고르세요.
- let optionalFour: Int = nil
- let optionalTwo: Int? = optionalOne
- let optionalThree: Int? = nil
- let optionalOne: Int! = nil

### 다음 중 오류가 발생하는 코드를 모두 고르세요 
```swift
var optionalA: Int? = nil
var optionalB: Int! = nil
```
- print(optionalB * 3)
- optionalB = optionalA
- optionalA = optionalB + 1
- optionalA = 100

### 다음 코드의 [빈칸]에 알맞은 코드를 고르세요.

 
```swift
let some: Int? = 100
    
[빈칸] unwrapped: Int = some {
print("추출된 some의 값은 \(unwrapped)입니다")
}
```
- guard let
- let
- if let
- some let