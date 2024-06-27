# Divider
공식문서 :
     A visual element that can be used to separate other content.

다른 컨텐츠를 구분할 수 있는 시각적 요소이다.

## Declaration
```swift
@MainActor @preconcurrency
struct Divider
```

## Overview
divider 즉 구분선은 스택에 포함 된 경우 스택의 보조 축을 가로질러 확장되며, 스택에 포함되지 않은 경우에는 수평적으로 확장된다.

```swift
VStack {
    Divider()
}
```
해당 Divider()는 가로축을 기준으로 확장 된다.

***
- [애플 공식문서_ScrollView](https://developer.apple.com/documentation/swiftui/scrollview) 
