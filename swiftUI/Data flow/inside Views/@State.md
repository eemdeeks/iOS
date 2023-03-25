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

## 추가
SwiftUI에서 View(구조체)안에 선언된 프로퍼티 값을 구조체 내에서 변경하려고 하면 오류가 난다.

Swift의 구조체에서 mutating으로 선언되지 않은 프로퍼티는 구조체 내에서 그 값의 변경이 불가하다.

그렇다고 연산 프로퍼티인 body를 mutating으로 선언해 주어도 안된다.

-> View프로토콜의 body 프로퍼티는 {get}으로 선언되어 있으며, 이는 nonmutating으로 구현을 요구한다.

그렇다면 어떻게 프로퍼티 값을 변경할 수 있을까?

이 때 @State를 사용하면 프로퍼티 값을 강제로 변경할 수 있게 된다.

하지만 @State를 사용한다고 해도 컴파일 에러는 피할 수 있지만 실행 화면에서는 변경이 안된 것을 확인 할 수 있다.

-> @State 속성의 프로퍼티 값은 사실 재 할당하여 값을 바꿀 수 없다.

@Binding을 사용해야만 변경이 가능하다.

@Binding에 대해서는 해당 글에서 다루겠다.

***
### 공식문서
- [애플공식문서_@State](https://developer.apple.com/documentation/swiftui/state)
