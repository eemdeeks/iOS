# Rectangle
공식문서 :
     A rectangular shape aligned inside the frame of the view containing it.

포함하는 뷰 내에 정렬된 사각형 모양이다.

## Declaration
```swift
@MainActor @frozen @preconcurrency
struct Rectangle
```

## Overview
```swift
Rectangle()
    .fill(.green)
    .frame(height: 30)
```
shape 프로토콜을 따르기 때문에 frame을 변경할 수 있다.

또한 원한다면 Divider의 역할도 충분히 할 수 있다.

***
- [애플 공식문서_Rectangle](https://developer.apple.com/documentation/swiftui/rectangle) 
