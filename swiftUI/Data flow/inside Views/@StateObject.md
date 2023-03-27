# @StateObject
공식문서 :
    A property wrapper type that instantiates an observable object.

## Declaration
```swift
@frozen @propertyWrapper struct StateObject<ObjectType> where ObjectType : ObservableObject
```

## Overview
ex)
```swift
final class CounterViewModel: ObservableObject {
    @Published var count = 0

    func incrementCounter() {
        count += 1
    }
}

struct CounterView: View {
    @StateObject var viewModel = CounterViewModel()

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
위 코드를 보면 @ObservedObject와 비슷하게 동작하는 것을 볼 수 있다.

이 것만 보면 ObservedObject만을 사용해도 된다고 생각할 수 있다.

하지만 명확한 차이점이 존재한다.

@StateObject를 통해서 관찰되고 있는 객체는 그들을 가지고 있는 화면 구조가 재생성되어도 파괴되지 않는다. 이 차이점은 화면이 다른 화면을 포함하고 있는 경우를 생각하면 이해하기 쉽다.

```swift
struct RandomNumberView: View {
    @State var randomNumber = 0

    var body: some View {
        VStack {
            Text("Random number is: \(randomNumber)")
            Button("Randomize number") {
                randomNumber = (0..<1000).randomElement()!
            }
        }.padding(.bottom)

        CounterView()
    }
}
```
위의 코드를 보면 버튼을 누를 때마다 randomNumber에 랜덤값이 들어가는데, randomNumber가 @State로 선언 되었기 때문에 랜덤값이 바뀔때마다(버튼을 누를 때마다) 화면이 새로 그려질 것이다.

그렇게 된다면 CounterView()의 viewModel이 @ObservedObject로 선언되어 있다면 화면이 새로 그려질때마다(랜덤 버튼을 누를 때마다) CounterView()에 나오는 count는 0으로 초기화 될 것이다.

그렇다면 @StateObject는?

@StateObject는 위에서도 말했듯이 화면 구조가 재생성되어도 파괴되지 않으므로 0으로 초기화 되지 않고 그 값을 유지할 것이다.

### 언제 @StateObject를 써야 할까
SwiftUI가 화면을 만들거나 다시 그릴 확률이 있다면 @ObservedObject는 안전 하지 않을 것이다.

@ObservedObject객체를 외부에서 주입하는 것이 아니라면 @StateObject를 쓰는 것이 항상 같은 결과를 얻을 수 있을 것이다.

### 동일한 객체를 가져다 쓰는 모든 뷰에서는 @StateObject를 쓰는게 맞을까?
동일한 @StateObject인스턴스를 관찰하고 있는 자식들은 객체를 프로퍼티 래퍼로 표시할 필요가 없다.

그렇게 된다면 여러군데에서 객체의 라이프사이클을 관리하게 돼서 그러지 않는 것이 좋다.

위에서도 말했듯이 @ObservedObject를 주입하는 경우엔 @ObservedObject를 사용하는 것이 좋습다.

***
### 공식문서
- [애플공식문서_@Binding](https://developer.apple.com/documentation/swiftui/binding)
- [참고_github.io](https://pilgwon.github.io/post/state-object-vs-observed-object)
