# Subscript
공식문서 :
     Accesses the element at the specified position.

특정 위치에 있는 요소 값에 접근 할 수 있다라고 해석할 수 있는데, 흔히 배열에서 값을 접근할 때 쓰는 대괄호가 바로 Subscript이다.

## Declaration
```swift
subscript(index: Int) -> Element { get set }
```
파라미터로 index가 들어오는데, 바로 접근할 요소의 위치이다. index는 startIndex보다 크거나 같아야 하고, endIndex보다 작아야한다.

결과 값으로 해당하는 index위치의 Element를 반환한다.

## Overview
```swift
var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
streets[1] = "Butler"
print(streets[1])
// Prints "Butler"
```

예시 코드처럼 흔히 우리가 배열에서 볼 수 있는 것과 같다.

클래스, 구조체, 열거형에서 모두 멤버 요소에 접근할 수 있으며, 단일 타입에 여러 서브스크립트를 정의할 수 있다.

예시로 아래 코드를 확인 할 수 있다.

```swift
public extension String {
    public subscript (i: Int) -> Element {
        return self[index(startIndex, offsetBy: i)]
    }
}

```
우리는 주로 String을 사용하면서 String도 배열처럼 String[index]처럼 해당 문자를 접근하고 싶은 경우가 많다.

이럴 때 위 코드처럼 extension을 통해 subscript를 구현할 수 있다. 이 코드만 있다면 String도 배열처럼 접근이 가능하게 된다.



***
- [애플 공식문서_Subscript](https://developer.apple.com/documentation/swift/array/subscript(_:)-25iat) 
