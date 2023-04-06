# onChange(of:perform:)
공식문서 :
    Performs an action when a specified value changes.

## Declaration
```swift
func onChange<V>(
    of value: V,
    perform action: @escaping (V) -> Void
) -> some View where V : Equatable
```

## Parameters
### value
- 클로저의 실행 여부를 결정할 때 확인할 값.
- value는 Equatable 프로토콜을 준수해야한다.

### action
- 값이 변경될 때 실행할 클로저이다.
- 클로저는 업데이트된 값을 나타내는 newValue 파라미터가 사용된다.

## Return Value
지정한 값이 변경될 때 action을 실행한 뷰를 반환한다.

## Overview
onChange()는 Environment값이나 바인딩된 값이 변경될 때 실행할 클로저이다.

ex) 뷰가 background로 이동하는 것을 발견할 경우 캐시를 지우는 코드 
```swift
struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var cache = DataCache()

    var body: some View {
        MyView()
            .onChange(of: scenePhase) { newScenePhase in
                if newScenePhase == .background {
                    cache.empty()
                }
            }
    }
}
```

onChange()에서 SwiftUI는 새 값을 클로저에 전달하며, 이전 값을 캡쳐하여 새 값과 비교도 할 수 있다.

ex) Player View가 이전 값과 새 값 모두 모델에게 전달하는 코드이다.

```swift
struct PlayerView: View {
    var episode: Episode
    @State private var playState: PlayState = .paused

    var body: some View {
        VStack {
            Text(episode.title)
            Text(episode.showTitle)
            PlayButton(playState: $playState)
        }
        .onChange(of: playState) { [playState] newState in
            model.playStateDidChange(from: playState, to: newState)
        }
    }
}
```
위 코드에서 playState는 oldValue, newState는 newValue라고 생각하면 된다.

## 추가
- 필요시 UI를 업데이트한다.

- onChange는 메인 스레드에서 호출된다.
    -> 메인 스레드에서 긴 작업을 실행 금지.( ex. 서버와의 통신)
    
- 값 변경에 대한 응답으로 긴 작업을 실행해야하는 경우 백그라운드 큐로 Dispatch해야한다.

- 이전 값을 캡쳐한다. 

***

### 공식문서
- [애플공식문서_onChange(of:perform:)](https://developer.apple.com/documentation/swiftui/menu/onchange(of:perform:))
