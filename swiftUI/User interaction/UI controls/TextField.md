# TextField
공식문서 :
     A control that displays an editable text interface.

사용자가 텍스트를 편집할 수 있는 인터페이스를 제공하는 컨트롤이다.

쉽게 말해 사용자가 텍스트를 수정할 수 있는 뷰인 것이다.

## Declaration
```swift
@MainActor @preconcurrency
struct TextField<Label> where Label : View
```

## Overview
```swift
@State private var username: String = ""
@FocusState private var emailFieldIsFocused: Bool = false


var body: some View {
    TextField(
        "User name (email address)",
        text: $username
    )
    .focused($emailFieldIsFocused)
    .onSubmit {
        validate(name: username)
    }
    .textInputAutocapitalization(.never)
    .disableAutocorrection(true)
    .border(.secondary)


    Text(username)
        .foregroundColor(emailFieldIsFocused ? .red : .blue)
}
```
TextField를 사용할 때는 텍스트가 없을 때 나타나는 플레이스홀더를 String값으로 지정할 수 있으며, 위에서 보이는 username과 같이 바인딩 된 state 변수가 필요하다.

바인딩으로 받은 username에는 텍스트필드에 입력한 값이 저장되며, 해당 변수를 다른 Text뷰에서도 사용할 수 있다.

위 예시에서는 .focused() modifier를 이용해서 텍스트 필드를 수정하고 있거나 아닐 때를 구분해 Text의 색상을 변경하고 있다.

또한 onSubmit modifier는 수정을 완료 했을 때 메소드를 불러올 수 있다. 위 예시에선 validate(name: username) 메소드를 텍스트필드 입력을 완료했을 때 실행하게된다.

***
- [애플 공식문서_TextField](https://developer.apple.com/documentation/swiftUI/textfield) 
