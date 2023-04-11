# Text
공식문서 :
     A view that displays one or more lines of read-only text.

간단하게 화면에 텍스트를 보여주는 뷰이다.

## Declaration
```swift
@frozen struct Text
```

## Overview
```swift
Text("eemdeeks")
```
텍스트는 뷰의 body속성 안에 위에 처럼 선언 해주면 된다.

### font(_:)
텍스트는 여러 폰트로 지정할 수 있으며 font(_:)를 사용하여 지정할 수 있다.
```swift
Text("eemdeeks")
    .font(.title)
```
위 코드처럼 .font()에 파라미터로 .title이나 .caption등을 넣으면 기본적인 폰트를 사용할 수 있다.

또한 .title같은 기본적인 폰트 대신 .system()을 이용하여 폰트 사이즈, 굵기, 디자인등을 바꿀 수 있다.

ex)
```swift
Text("I'm eemdeeks")
    .font(.system(size: 12, weight: .light, design: .serif))
    .italic()
```

### lineLimit()
- lineLimit()를 이용하여 원하는 줄 개수만큼으로 제한을 둘 수 도 있다.
ex)
```swift
Text("Helo, my name is Ddan!!! Nice to meet you. I have three brother!!"
    .lineLimit(3)

Text("Helo, my name is Ddan!!! Nice to meet you. I have three brother!!"
    .lineLimit(nil)
```

줄 개수에 대한 제한을 주지 않고 싶다면 위에 처럼 nil을 두어도 된다.

- 긴 문장에 대해서는 truncationMode를 사용해서 일부를 생략할 수도 있다.
```swift
Text("Helo, my name is Ddan!!! Nice to meet you. I have three brother!!"
    .lineLimit(1)
    .truncationMode(.middle)
```

### foregroundColor
.foregroundColor를 이용해서 텍스트의 색상을 변경 할 수 있다.
```swift
Text("I'm eemdeeks")
    .foregroundColor(Color.red)
```

### background()
Text의 음영이나 배경의 색을 바꾸고 싶다면 background를 사용하면 된다.
```swift
Text("I'm eemdeeks")
    .background(Color.blue)
```
### 이외의 것들
- frame()
등등이 있다.

***
- [애플 공식문서_Text](https://developer.apple.com/documentation/swiftui/text) 
