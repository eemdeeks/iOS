# @ObservedObject
공식문서 :
    A property wrapper type that subscribes to an observable object and invalidates a view whenever the observable object changes.

## Declaration
```swift
@propertyWrapper @frozen struct ObservedObject<ObjectType> where ObjectType : ObservableObject
```

## Overview
@ObservedObject는 이름 그대로 관찰하는 Property wrapper로 객체가 변화를 관찰하여 변화를 뷰에 다시 전달하여 업데이트를 가능하게 한다.

@ObservedObject는 ObservableObject프로토콜을 따르는 객체를 필요로 하며, 이 프로토콜은 객체의 값이 바뀌기 전에 알려주는 퍼블리셔를 의미한다. 또한 SWiftUI가 화면을 다시 그리는 것을 가능하게 한다.


ex)
```swift
final class CounterViewModel: ObservableObject {
    @Published var count = 0

    func incrementCounter() {
        count += 1
    }
}

struct CounterView: View {
    @ObservedObject var viewModel = CounterViewModel()

    var body: some View {
        VStack {
            Text("Count is: \(viewModel.count)")
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}
```

위 코드는 버튼을 누를때 마다 텍스트에 나타나는 값이 1씩 올라가는 코드로, CounterViewModel이 ObservableObject프로토콜을 따르기 때문에 @ObservedObject로 정의할 수 있는 것이다.

뷰 모델 내부의 값이 버튼을 누를 때마다 증가하는데, 이 떄 @Published가 변했다는 신호를 쏴서 변화를 알게 하는 것이다.

***
### 공식문서
- [애플공식문서_@Binding](https://developer.apple.com/documentation/swiftui/observedobject)
