# Generic

타입에 의존하지 않는 범용코드를 위해서 존재 하며 어떤 타입이 들어와도 괜찮은 코드이다.

```swift
func 함수이름<타입이름>(input: 실제 입력받은 타입) {
    input -> 타입 변수
}
```

예를 들어 Int를 저장하는 배열을 갖는 구조체를 한번 만들어 보자

```swift
struct MyStack {
    var data: [Int] = []

    mutating func insertValue(input: Int) {
        data.append(input)
    }

    func showData() {
        data.forEach { item in
            print(item)
        }
    }
}
```

그런데, Int형이 아닌 String, Float등 다른 값을 갖는 구조체를 만들려고 한다면 계속해서 만들어야 할까?

이 때 사용할 수 있는 것이 Generic이다.

```swift
struct MyGenericStack<T> {
    var data: [T] = []

    mutating func insertValue(input: T) {
        data.append(input)
    }

    func showData() {
        data.forEach { item in
            print(item)
        }
    }

}
```

이렇게 만든다면 여러번 만들 뻔 했던 걸 한 코드로 해결 할 수 있게 된다.
