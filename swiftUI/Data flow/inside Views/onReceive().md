# onReceive(_:perform:)
공식문서 :
    Adds an action to perform when this view detects data emitted by the given publisher.

## Declaration
```swift
func onReceive<P>(
    _ publisher: P,
    perform action: @escaping (P.Output) -> Void
) -> some View where P : Publisher, P.Failure == Never
```

## Parameters
### publisher
- The publisher to subscribe to.

### action
- The action to perform when an event is emitted by publisher. The event emitted by publisher is passed as a parameter to action.


쉽게 말해서 publisher는 말 그대로 구독할 publisher이며, 

action은 publisher가 이벤트 생성 시 수행할 작업이다.

## Return Value
A view that triggers action when publisher emits an event.

## Overview
onReceive()는 view에서 지정된 publisher가 emit한 데이터를 감지할 때 수행할 작업을 추가하는 것이다.

ex)
```swift
struct ContentView: View {
    @State var currentDate = Date.now
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(currentDate)")
            .onReceive(timer) { input in
                currentDate = input
            }
    }
}
```

위의 코드에서는 현재 시간을 받아 보여주는 코드이다.

currentDate에 현재 시간을 받는데, timer 변수로 매 초마다 현재 시간을 다시 받아 text를 업데이트 해주는 것을 볼 수 있다.

위처럼 어떤 publisher의 이벤트에 따라 뭔가 해주고 싶다면,

publisher를 만들고 onReceive에 넣어주면 사용할 수 있다.

위에서는 timer를 publisher로 사용한 모습..

***

### 공식문서
- [애플공식문서_onReceive(_:perform:)](https://developer.apple.com/documentation/swiftui/view/onreceive(_:perform:))
- [참고_HackingWithSwift](https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-a-timer-with-swiftui)
