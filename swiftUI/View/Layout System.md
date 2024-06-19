# SwiftUI ViewLayout 결정 원리
UIKit에서는 AutoLayout 시스템을 사용하지만 SwiftUI에서는 선언형 패러다임에 맞게 자체 시스템을 따른다.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello world!")
    }
}
```

Root View와 Content View처럼 body가 존재하는 뷰의 layer는 layout 중립을 지킨다.

layout 중립을 지킨다는 것은 하위 자식 뷰의 Bounds에 따라 결정된다. 위 코드에 따라 본다면 ContentView는 body가 존재하기에 layout 중립이며 body에 의해 크기가 결정된다.

### Layout Procedure

1. 부모 뷰는 자식 뷰에 사이즈를 제안
2. 자식은 부모의 크기 제안을 고려해서 자신의 사이즈를 결정한다.(무시도 가능)
3. 부모는 자식의 결정을 존중 후 자신의 좌표 공간 내에 자식을 위치한다.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/2975a946-00e3-49ff-aabf-293e11e4666f/deb0de3e-8f09-4920-861a-d31d5f212c87/Untitled.png)

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello world!")
            .padding(20)
            .background(Color.red)
    }
}
```

Text에 modifier까지 붙어 있는 뷰를 통해 알아봅시다.

해당 코드의 흐름 구조는 

Root View 하위에 Text를 감싸고있는 Content View가 있고 Background(Color) → Padding → Text

이런 구조로 존재하고 있다.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/2975a946-00e3-49ff-aabf-293e11e4666f/9c724c1b-0925-460a-bc0c-2275a192ad46/Untitled.png)

1. Root View가 Content View라고 볼 때 layout 중립이기에 화면 전체에서 safe area를 제외한 전체 영역을 하위에 제공을 제안
2. Content View 또한 layout 중립이기에 크기를 결정하지 않고 하위에 결정권을 준다.
3. 그 다음 Text에 적용된 Modifier를 만난다.
4. 먼저 만나는 Background 또한 layout 중립이기에 그 다음 만나는 Padding에게 결정권을 넘겨준다.
5. Padding이 20만큼 정해져 있기에 하위 텍스트에게 전체 영역에서 20만큼 줄어든 영역을 제공한다.(Text의 side에 20포인트를 더할 것을 알고 있기에)
6. 그 다음 Text는 전달 받은 영역 전부를 사용할 수 있다. 하지만 Text에 다른 Frame이 잡혀있지 않다면 해당 Text에 나타날 글자만큼의 크기만 가져온다. 또한 별도의 위치를 잡아주지 않는다면 하위 뷰는 layout에서 중앙에 위치한다.
7. Text의 크기가 결정되었으니 해당 크기를 다시 Padding에게 반환한다.
8. padding은 각 side에 Text보다 20 더 큰 크기를 background에게 보고한다.
9. Background는 layout 중립이었으므로 Padding에게 보고 받은 크기를 그대로 사용한다. 상위에 보고하기 전에 secondary child, 즉 Color에도 같은 크기를 제공한다.
10. 그 다음 Content View에 크기를 보고하고 전과 같이 자식 뷰들을 자신의 중앙에 배치한다.
11. Root View도 동일.

---

기본적으로 SwifUI의 View Layout 결정 원리를 알아봤다.

코드를 여러번 작성하면서 느낌적, 본능적으로만 이해하고 사용하고 있었는데, 글로 정리 해보니 생각보다 쉽게 정리되지는 않았다..

기본적인 View Layout 결정 원리에 대해서 말로, 글로 설명하는 연습을 해야할 것같다.
