# HStack
공식문서 :
     A view that arranges its subviews in a horizontal line.

수평으로 스택이 쌓이는 컴포넌트이다.

## Declaration
```swift
@MainActor @frozen @preconcurrency
struct HStack<Content> where Content : View
```
뷰 타입이라면 HStack에 들어가 수평적으로 배열이 될 수 있다.

## Overview

```swift
var body: some View {
    HStack(
        alignment: .top,
        spacing: 10
    ) {
        ForEach(
            1...5,
            id: \.self
        ) {
            Text("Item \($0)")
        }
    }
}
```
해당 코드가 돌아간다면 Item1 부터 Item5까지 수평적으로 나열 된 화면을 볼 수 있을 것이다.

LazyHStack과는 다르게 안에 들어있는 배열이 한번에 렌더링 된다. 그래서 주로 lazy하게 쓰고싶지 않거나, 적은양의 content를 담을 때 사용한다.

### HStack에 존재하는 3가지 인자
- alignment: VerticalAlignment
    - HStack에 쌓일 때 수직적으로는 어떤 정렬 기준을 갖고 정렬되는지 정의한다.
    - 기본값으로는 Center이고 원한다면 top, bottom으로 지정할 수 있다.
- spacing: CGFloat?
    - 각 서브뷰의 간격을 결정한다.
    - 기본값으로는 nil
    - CGFloat값을 넣어서 정해줄 수 있다.
- @ViewBuilder content: () -> Content
    - 실제 뷰타입의 contents를 넣을 수 있다.
    - @ViewBuilder를 채택하고 있기에 여러 contents들을 블럭으로 쌓고 담아서 하나의 뷰로 구성할 수 있다.


***
- [애플 공식문서_HStack](https://developer.apple.com/documentation/swiftui/HStack) 
