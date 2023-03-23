# Property wrapper
     property wrapper adds a layer of separation between code that manages how a property is stored and the code that defines a property.
Swift 공식문서 내용..

번역해보자면 프로퍼티 래퍼는 프로퍼티가 저장되는 방식을 관리하는 코드와 프로퍼티가 정의되는 코드 사이에 분리된 계층을 추가해줍니다. 프로퍼티 래퍼를 정의할 때, management code를 한번 작성하면 여러 프로퍼티에 적용하면서 재사용할 수 있습니다.

Swift 5.1에 추가된 property wrapper는 행동을 정의하는 타입을 만드는 것으로, @State @Binding등이 모두 Property Wrapper이다.

한마디로 미리 정의해둔 연산들을 활용할 수 있는 프로퍼티를 뜻한다.

## 종류
- @State
- @Binding
- @StateObject
- @ObservedObject
- @EnvironmentObject
- @Environment
- @FetchRequest
- @AppStorage
- @SceneStorage
- 등등..


## 사용하는 이유
반복되는 작업을 줄이고 싶을 때 사용하게된다.

## 예시 코드
```swift
@propertyWrapper
struct TwelveOrLess {
    private var number: Int

    init() {
        self.number = 0
    }

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12)}
    }
}
```
위에 코드에서 wrappedValue는 propertyWrapper에서 필수로 있어야 하며 없으면 컴파일 오류가 난다.

위 공식문서의 설명에서 management code가 이에 해당하는 것 같다.

코드를 해석하자면 이 구조체는 12보다 높은 값은 set할 수 없는 구조체로, 12보다 높으면 12로 set, 그 아래면 그 값으로 set되는 구조체이다.

```swift
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
// Print : 0
print(rectangle.height)

rectangle.height = 10
// Print : 10
print(rectangle.height)

rectangle.height = 24
// Print : 12
print(rectangle.height)

rectangle.width = 12
// Print : 12
print(rectangle.width)
```
위에서 만든 propertyWrapper를 사용한 코드로 height과 width를 12보다 높이 설정하면 12로, 그 아래면 그 값으로 설정되는 코드이다.
