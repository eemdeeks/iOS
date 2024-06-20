# TabView
공식문서 :
     A view that switches between multiple child views using interactive user interface elements.

사용자 인터페이스 요소를 통해 여러 하위 뷰 사이를 전환하는 뷰이다.

## Declaration
```swift
@MainActor @preconcurrency
struct TabView<SelectionValue, Content> where SelectionValue : Hashable, Content : View
```
selectionValue와 Content를 Generic하게 받으며 SelectionValue는 하위 뷰들을 전환시켜야 할 매개체이므로 Hashable해야한다. 또한 Content는 View타입들을 사용 가능하다.

## Overview

```swift
TabView {
    Tab("Received", systemImage: "tray.and.arrow.down.fill") {
        ReceivedView()
    }
    .badge(2)


    Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
        SentView()
    }


    Tab("Account", systemImage: "person.crop.circle.fill") {
        AccountView()
    }
    .badge("!")
}
```

위 코드는 3개의 탭이 있는 TabView이다. 해당 탭에 Badge를 포함시킬수도 있다.

첫번 째 Tab을 눌렀을 경우에는 ReceivedView()가, 두번째는 SentView()가, 세번째는 AccountView()가 화면에서 볼 수 있다.

해당 예시에서는 각 Tab(하위뷰)가 고유하기 때문에 SelectionValue가 따로 필요가 없다. 그러나 하위 탭을 클릭하지 않고도 어떠한 비지니스 로직을 통해서 다른 탭으로 이동해야 할 경우에 SelectionValue가 필요하다.

***
- [애플 공식문서_TabView](https://developer.apple.com/documentation/swiftui/TabView) 
