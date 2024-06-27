# ScrollView
공식문서 :
     A scrollable view.

말 그대로 스크롤 가능한 뷰이다.

## Declaration
```swift
@MainActor @preconcurrency
struct ScrollView<Content> where Content : View
```
하위 컨텐츠를 함유할 수 있는데, 컨텐츠는 View형식이어야 한다.

## Overview
스크롤 뷰는 스크롤 가능한 영역 내에 콘텐츠를 표시한다. 스크롤을 통해 사용자가 원하는 뷰를 볼 수 있도록 조정할 수 있다.

가로, 세로 또는 둘 다로 스크롤을 할 수 있찌만 확대나 축소 기능은 제공하지 않는다.

Content에 View를 추가해 원하는 뷰를 스크롤 뷰에 올릴 수 있다.

매개변수 axes를 통해 어떤 방향으로 스크롤 할 건지를 정해줄 수 있다.

마지막으로 showIndicators는 스크롤 뷰의 막대바를 노출 시켜 줄 것인지 아닌지를 결정할 수 있다.

```swift
var body: some View {
    ScrollView(
        .vertical,
        showsIndicator: true
    ) {
        VStack(alignment: .leading) {
            ForEach(0..<100) {
                Text("Row \($0)")
            }
        }
    }
}
```
위 예시는 막대바를 보여주고, 세로 방향으로 스크롤 할 수 있는 뷰이며 Text 100개를 포함하고 있는 세로방향 스크롤뷰이다.


***
- [애플 공식문서_ScrollView](https://developer.apple.com/documentation/swiftui/scrollview) 
