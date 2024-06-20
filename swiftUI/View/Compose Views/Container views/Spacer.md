# Spacer
공식문서 :
     A flexible space that expands along the major axis of its containing stack layout, or on both axes if not contained in a stack.

stack에 포함된다면 stack 방향으로 확장되며, stack에 포함되지 않았을 경우 두 축 방향 모두로 확장되는 유현한 공간을 가진 컴포넌트이다. 

## Declaration
```swift
@MainActor @frozen @preconcurrency
struct Spacer
```

## Overview

```swift
struct ChecklistRow: View {
    let name: String


    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "checkmark")
            Text(name)
        }
        .border(Color.blue)
    }
}
```
예를 들어 HStack내에 배치된다면 Spacer는 스택이 허용하는 만큼과 같이 포함된 다른 뷰를 방해하지 않는만큼 수평으로 확장된다. 

위 예시에서는 Spacer, Image, Text가 수평적으로 배열되어야 한다. Spacer가 없었다면 Image와 Text가 HStack 중간에 위치하겠지만 위 코드에서는 Spacer가 두 뷰 앞에 있으므로 두 뷰를 가장 오른쪽으로 밀어낸 만큼 공간을 차지할 것이다.

만약 Spacer를 Image와 Text 중간에 위치한다면 이미지는 위치할 수 있는 가장 왼쪽에, Text는 가장 오른쪽에 위치하도록 중간에서 공간을 차지할 것이다.

Spacer를 처음과 끝에 배치하면 어떨까? 이 경우는 양쪽에 위치에 공평하게 공간을 차지할 것이므로 Image와 Text는 Spacer가 없는 것과 같게 배치될 것이다.

***
- [애플 공식문서_Spacer](https://developer.apple.com/documentation/swiftui/Spacer) 
