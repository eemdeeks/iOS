# ObservableObject
공식문서 :
    A type of object with a publisher that emits before the object has changed.

## Declaration
```swift
protocol ObservableObject : AnyObject
```

## Overview
By default an ObservableObject synthesizes an objectWillChange publisher that emits the changed value before any of its @Published properties changes.

기본적으로 ObservableObject는 @Published 프로퍼티 래퍼로 선언된 속성이 변경되기 전에 변경된 값을 내보내는 역할을 하는 프로토콜이다.

변경된 값을 방출(emit)하는 objectWillChange 퍼블리셔를 사용할 수 있도록 해준다.
 
ex)
```swift
class Contact: ObservableObject {
    @Published var name: String
    @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func haveBirthday() -> Int {
        age += 1
        return age
    }
}

let john = Contact(name: "John Appleseed", age: 24)
cancellable = john.objectWillChange
    .sink { _ in
        print("\(john.age) will change")
}
print(john.haveBirthday())
// Prints "24 will change"
// Prints "25"

```

위 코드에서 보이듯이 john.haveBirthday()가 호출되면 john.objectWillChange.sink로 선언된 클로저가 먼저 실행되고나서 haveBirthday()가 실행되게 된다.
***
### 공식문서
- [애플공식문서_ObservableObject](https://developer.apple.com/documentation/combine/observableobject)
