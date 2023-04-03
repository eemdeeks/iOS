# @Published
공식문서 :
    A type that publishes a property marked with an attribute.
## Declaration
```swift
@propertyWrapper struct Published<Value>
```

## Overview
@Published 속성을 사용하면 이 유형의 퍼블리셔(publisher)가 생성된다.

이 후 $연산자를 사용하여 변수값의 변화에 접근할 수 있다.

ex)
```swift
class Weather : ObservableObject {
    @Published var temperature: Double
    init(temperature: Double) {
        self.temperature = temperature
    }
}

let weather = Weather(temperature: 20)
cancellable = weather.$temperature
    .sink() {
        print ("Temperature now: \($0)")
}
weather.temperature = 25

// Prints:
// Temperature now: 20.0
// Temperature now: 25.0
```

위 코드 처럼 프로퍼티가 변했을 때, willSet 블록에 게시가 발생한다.

이 말은, 실제로 프로퍼티가 변경(설정)되기 전에 새 값을 받는다는 말이다.

Temperature now: 20.0은 클로져를 선언 했을 때 바로 출력되며, 그 이후 변한값에대한 출력이 나타나게 된다.

## 추가
@Published는 프로퍼티 래퍼로 프로퍼티가 변경이 발생할 때 자동으로 알려주는 observable object를 만들 수 있다.

SiwftUI는 이러한 변경사항을 관찰하고 모니터링하는 View의 body속성을 다시 호출해 준다.

한마디로 @Published를 사용하면 그 프로퍼티가 변경 될 때마다 해당 프로퍼티를 사용하는 View들을 다시 로드 시켜 준다는 말이다.

예를 들어보자,

```swift
class Test: ObservableObject {
    var testNumArray = [String]()
}
```

위의 예시는 관찰 가능하도록 프로토콜을 사용해 주어서 SwiftUI가 변경 사항을 감시해 주도록 했다.

하지만 프로퍼티에는 아무런 프로퍼티 래퍼가 선언 되어 있지 않기에 변경은 자유자재로 할 수 있지만, 변경 사항을 알려주거나 하지 않는다.

이 때 @Published를 사용 하여 이 점을 보완할 수 있다.

```swift
class Test: ObservableObject {
    @Published var testNumArray = [String]()
}
```

위 코드로 바꿔서 작성한다면 @Published 속성 래퍼는 항목에 willSet 속성 관찰자를 추가하여 모든 변경 사항이 observer에게 자동으로 전송 된다.

이 말은 즉, testNummArray가 변경 되었을 경우 해당 프로퍼티를 사용하는 뷰들을 변경한 값에 대하여 자동으로 리로드 된다는 말이다.

***
### 공식문서
- [애플공식문서_@Published](https://developer.apple.com/documentation/combine/published)
