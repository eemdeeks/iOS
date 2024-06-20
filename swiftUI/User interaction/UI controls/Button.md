# Button
공식문서 :
     A control that initiates an action.

특정 동작의 시작을 컨트롤할 수 있는 뷰로, 우리가 흔히 생각하는 버튼과 같다.

## Declaration
```swift
@MainActor @preconcurrency
struct Button<Label> where Label : View
```

## Overview
```swift
Button(action: signIn) {
    Text("Sign In")
}
```
action과 label을 통해 버튼을 만들 수 있다. 

action은 유저가 버튼을 클릭했을 때 이러나는 무엇인가를 정의하는 method나 closure property등이 들어가게 된다.

label에는 view가 들어가며 버튼의 모양을 지정해주는 어떠한 view도 들어갈 수 있다.

이 외에도
- LocalizedStringKey를 이용해 버튼 만들기.
- labelStyle(_:)
- List안에서 사용하기.
- contextMenu(_:)
- Assigning a role

등 여러가지 이용 방법이 많다.

***
- [애플 공식문서_Button](https://developer.apple.com/documentation/swiftui/button) 
