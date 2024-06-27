# alert(_:isPresented:presenting:actions:message:)

공식문서 :
     Presents an alert with a message using the given data to produce the alert’s content and a string variable as a title.

사용자에게 메시지를 전달하거나 사용자로부터 간단한 입력을 받을 때 사용하는 모달 대화창이다.

## Declaration
```swift
nonisolated
func alert<S, A, M, T>(
    _ title: S,
    isPresented: Binding<Bool>,
    presenting data: T?,
    @ViewBuilder actions: (T) -> A,
    @ViewBuilder message: (T) -> M
) -> some View where S : StringProtocol, A : View, M : View
```

## Overview
```swift
struct SaveDetails: Identifiable {
    let name: String
    let error: String
    let id = UUID()
}


struct SaveButton: View {
    @State private var didError = false
    @State private var details: SaveDetails?
    let alertTitle: String = "Save failed."


    var body: some View {
        Button("Save") {
            details = model.save(didError: $didError)
        }
        .alert(
            alertTitle,
            isPresented: $didError,
            presenting: details
        ) { details in
            Button(role: .destructive) {
                // Handle the deletion.
            } label: {
                Text("Delete \(details.name)")
            }
            Button("Retry") {
                // Handle the retry action.
            }
        } message: { details in
            Text(details.error)
        }
    }
}
```
alert는 띄울지 말지를 결정하는 State변수를 필요로 한다. 위 예시를 보자.
didError라는 State변수와 details라는 identifiable한 값을 State로 선언 해 주었다.

버튼("save")를 누른다면 details는 model.save()를 통해 true 또는 false를 갖게 된다. 이 때 details가 true값을 갖게 되면 alert를 띄우게 되는 것이다. 이처럼 isPresented: 에 바인딩 변수를 넣어 주어서 alert를 띄우는 시점을 결정 할 수 있다.

다음으로 presenting은 identifiable한 값을 넣어 줌으로써 alert가 떴을 때, 나오는 메시지나 버튼에 값을 보내줄 수 있다.

alertTitle은 alert에 표시할 타이틀로 StringProtocol을 따라야한다.

alert에는 Button으로 인한 액션과 메시지를 추가할 수 있다. 버튼은 role을 통해 역할을 지정해 줄 수 있고 위에 예시처럼 .destructive만 존재한다면 alert에는 cancle버튼이 자동으로 추가되게 된다.

***
- [애플 공식문서_alert()](https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:presenting:actions:message:)-8584l) 
