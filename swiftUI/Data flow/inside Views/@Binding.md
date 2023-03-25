# @Binding
공식문서 :
    A property wrapper type that can read and write a value owned by a source of truth.

## Declaration
```swift
@frozen @propertyWrapper @dynamicMemberLookup struct Binding<Value>
```

## Overview
@Binding을 사용하여 프로퍼티의 값을 표시하고 변경할 수 있으며, 뷰와 뷰 사이에서 양방향 연결을 만들어 준다.

한마디로 값의 변경을 통해 다른 뷰에서도 바인딩 되어 함께 변경해 준다.

ex)
```swift
struct PlayButton: View {
    @Binding var isPlaying: Bool

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
    }
}

struct PlayerView: View {
    var episode: Episode
    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            Text(episode.title)
                .foregroundStyle(isPlaying ? .primary : .secondary)
            PlayButton(isPlaying: $isPlaying) // Pass a binding.
        }
    }
}
```
isPlaying 프로퍼티를 @Binding을 통해 뷰(구조체)사이를 연결하여, PlayButton과 PlayerView사이에서 값이 바인딩 된다.

해석하자면 PlayButton은 토글형식으로 버튼 클릭시 마다 PlayerView의 Text에서 재생 상태를 업데이트 한다.

이 때 isPlaying은 $를 사용하여 값이 반환되는 것을 볼 수 있다.

## 추가
@Binding과 @State는 연결되어 있다고 생각하면 쉽다.

@State 프로퍼티를 주가되는 뷰에 한번 선언하고, 이 후에 사용되는 뷰들에서 @Binding을 사용하여 해당 프로퍼티를 다른 뷰들에서 사용이 가능하다.

뷰 UI에서 특정 동작을 통해 프로퍼티 값을 변경하고 싶을 때는 $를 붙여주고, 코드 내에서 해당 값을 출력하여 UI에서 보여주고 싶을 때는 $없이 사용한다.

***
### 공식문서
- [애플공식문서_@Binding](https://developer.apple.com/documentation/swiftui/binding)
