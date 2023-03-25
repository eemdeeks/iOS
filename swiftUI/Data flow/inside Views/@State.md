# @State
공식문서 :
    A property wrapper type that can read and write a value managed by SwiftUI.

## Declaration
```swift
@frozen @propertyWrapper struct State<Value>
```

## Overview
@State는 SwiftUI에서 해당 프로퍼티가 하고싶은 행동을 정의하는 타입이라고 한다.

이해해 보자면 @State로 선언된 변수들은 값이 변경되는 경우, View를 invalidate(무효화)하고 var body:some View 를 recompute 하게 한다.

@State 변수는 View 또는 View에서 호출된 메서드에서만 접근해야 한다. 한마디로 @State변수에 사용자가 직접적으로 접근하지 못하도록 쓰레드에서 변경하는 것이 안전하다.

그래서 주로 @State 변수를 Private과 함께 사용하며 해당 변수를 다른 View에 전달하고자 한다면, $를 이용하여 전달한다.

ex)
```swift
struct Landmark: view{
    @Binding var showFavoritesOnly : Bool
    
    var body: some View{
        Label("Toggle Favroite", systemImage: showFavoritesOnly ? "star.fill" : "star")
    }
}   

struct LandmarkList: view{
    @State private var showFavoritesOnly = false
    
    ...
    var body: some View{
        ...
        Toggle(isOn: $showFavoritesOnly){
            Text("Favorites only")
        }
    }
}
```
***
### 공식문서
- [애플공식문서_@State](https://developer.apple.com/documentation/swiftui/state#overview)
