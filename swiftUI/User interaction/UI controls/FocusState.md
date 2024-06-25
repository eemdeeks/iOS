# FocusState
공식문서 :
     A property wrapper type that can read and write a value that SwiftUI updates as the placement of focus within the scene changes.

씬 내 포커싱 위치가 변경됨에 따라 SwiftUI가 업데이트하는 값을 읽고 쓸 수 있도록 해주는 프로퍼티 래퍼이다.

## Declaration
```swift
@frozen @propertyWrapper
struct FocusState<Value> where Value : Hashable
```

## Overview
iOS15부터 사용 가능한 프로퍼티 래퍼이다.
```swift
struct LoginForm: View {
    enum Field: Hashable {
        case username
        case password
    }


    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?


    var body: some View {
        Form {
            TextField("Username", text: $username)
                .focused($focusedField, equals: .username)
                .onSubmit {
                    focusedField = .password
                }

            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)

            Button("Sign In") {
                if username.isEmpty {
                    focusedField = .username
                } else if password.isEmpty {
                    focusedField = .password
                } else {
                    handleLogin(username, password)
                }
            }
        }
    }
}
```
위 코드에서 LoginForm 뷰는 SwiftUI 뷰로 실행 화면을 본다면 로그인 화면을 떠올릴 수 있다.

간단한 로그인 화면에서 FocusState의 작동을 확인 할 수 있다. 

.focused() modifier를 이용해 씬의 초점 위치를 확인할 수 있으며 Hashable한 값을 통해서 해당 위치를 지정해 줄 수도 있다.

위 코드에서 username을 입력하는 창이 있고, password를 입력하는 창이 있다. Username을 입력 완료한다면 focusedField를 이용해서 비밀번호를 입력하는 텍스트필드로 바로 이동이 된다.

또한 Sign In 버튼을 눌렀을 때, Username 텍스트필드가 비어있다면 거기로 focus가 이동하고, Password 텍스트 필드가 비어있다면 거기로 이동할 것이다.

***
- [애플 공식문서_FocusState](https://developer.apple.com/documentation/swiftUI/focusstate) 
