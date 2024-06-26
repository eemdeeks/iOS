# ZStack
공식문서 :
     A view that overlays its subviews, aligning them in both axes.

하위 뷰를 겹쳐서 표시하며, 하위뷰들을 수평 및 수직축으로 정렬하는 뷰이다.

## Declaration
```swift
@MainActor @frozen @preconcurrency
struct ZStack<Content> where Content : View
```

VStack, HStack과 같이 View형식의 컨텐트를 제네릭하게 받는다.

## Overview
주로 한 화면에서 뷰를 겹쳐 표현할 때 사용한다.
```swift
let colors: [Color] =
    [.red, .orange, .yellow, .green, .blue, .purple]


var body: some View {
    ZStack {
        ForEach(0..<colors.count) {
            Rectangle()
                .fill(colors[$0])
                .frame(width: 100, height: 100)
                .offset(x: CGFloat($0) * 10.0,
                        y: CGFloat($0) * 10.0)
        }
    }
}
```
해당 예시에서는 반복문을 통해 사각형을 무지개색 순서로 채워서 ZStack에 얹어 두었다.

완전히 겹치면 알아 볼 수 없으니, offset을 조금 씩 변경해 주었으며, 해당 코드의 결과를 보면 무지개색 순서로 쌓여있는 사각형을 확인 할 수 있다.

### .zIndex()
zIndex 모디파이어를 통해서 ZStack안에서 올려지는 순서를 결정해 줄 수도 있다.
```swift
ZStack {
    Rectangle()
        .fll(Color.red)
        .frame(width: 100, height: 100)
        .zIndex(1)
    Rectangle()
        .fll(Color.green)
        .frame(width: 100, height: 100)
        .zIndex(1)
}

***
- [애플 공식문서_ZStack](https://developer.apple.com/documentation/swiftui/ZStack) 
