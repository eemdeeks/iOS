# NavigationStack
공식문서 :
     A view that displays a root view and enables you to present additional views over the root view.

root뷰 를 표시하고 root뷰 위에 추가적인 뷰를 표시할 수 있도록 해준다. 스택처럼 뷰를 쌓아서 보여준다고 보면 된다.

## Declaration
```swift
@MainActor @preconcurrency
struct NavigationStack<Data, Root> where Root : View
```

Data와 Root를 매개변수로 받는다.

Data는 NavigationStack에 관련된 데이터를 나타내기 위해 사용한다. 각 뷰에 대한 매타데이터나 상태정보를 나타낸다.

Root는 이 스택의 root뷰를 나타낸다. Root는 View프로토콜을 준수 해야 한다.

@MainActor가 붙어 있는 걸 보면 화면 전환은 메인 쓰레드에서 일어난다는 것을 알 수 있다. 

- 기본적으로 iOS에서의 UI변경은 메인쓰레드에서 일어나고 일어나야 한다는 것은 기본 상식이라고 볼 수 있다.

## Overview
iOS 16버전부터 도입되기 시작했다. 기존에는 NavigationView를 사용했지만 NavigationStack을 통해 좀 더 편리하고 효율적으로 관리할 수 있다.

```swift
NavigationStack {
    NavigationLink("Go to Child View", value: "10")
        .navigationDestination(for: String.self) { value in
            Text("Child Number is \(value)")
        }
}
```
NavigationLink를 이용해서 root뷰 위에 뷰를 표시할 수 있다. 표시한 뷰는 back버튼이나 swipe제스쳐를 통해서 스택을 제거 할 수 있다. 하지만 가장 하위에 있는 root뷰는 제거할 수 없다.

NavigationLink를 클릭 해서 뷰를 쌓을 때 navigationDestination(for:destination:) modifier를 이용해서 하위 뷰로 이동할 때 데이터를 연결 할 수도 있다.

위 예시에서는 Go to Child View라는 텍스트를 가진 NavigationLink를 클릭하면 NavigationDestination을 통해서 Child Number is 10이라는 텍스트로 화면이 전환된다.

```swift
NavigationStack {
    List(parks) { park in
        NavigationLink(park.name, value: park)
    }
    .navigationDestination(for: Park.self) { park in
        ParkDetails(park: park)
    }
}
```
위 예시에서는 List뷰가 Root뷰 역할을 하며 항상 존재한다. 또한 navigationDestination에 Park.self를 인자로 보내주면서 새로 쌓을 뷰에 리스트에서 클릭한 park값을 연결 시켜줄 수 있다.


### NavigationStack 상태 관리하기
Navigation으로 전환되는 뷰는 Stack으로 쌓이기에 이를 컨트롤하여 원하는 뷰로 전환이 가능하다.

```swift
struct ContentView: View {
    @State var stack = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stack) {
            NavigationLink("Go to Child View", value "10")
                .navigationDestination(for: String.self) { value in
                    VStack {
                        NavigationLink("Go to Child's Child View", value: "20")
                        
                        Text("Child Number is \(value)")
                        
                        Button("Go to Parent View") {
                            stack.removeLast()
                            
                        }
                        
                        Button("Go to Root View") {
                            stack = .init()
                        }
                    }
                
                }
        }
    }
}
```
위 코드를 보면 NavigationStack에 stack이라는 상태변수를 인자로 주어서 스택을 관리할 수도 있다.

NavigationLink를 통해 뷰를 스택에 쌓아 올리고, 또 쌓아 올릴 수 있는데, "Go to Parent View" 버튼의 stack.removeLast()를 통해 스택에서 하나를 지워 이 전 뷰로 이동할 수도 있다.

또한 "Go to Root View"의 stack = .init()을 통해 스택을 초기화 해 root뷰로 이동할 수도 있다.


***
- [애플 공식문서_NavigationStack](https://developer.apple.com/documentation/swiftui/navigationStack) 
