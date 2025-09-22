# Recursive function
Recursive function 즉, 재귀 함수는 자신을 호출하는 함수이다.

ex)
```swift
func recurse() {
    recurse()
}

recurse()
```

위 예시에서 보듯 recurse()함수는 계속해서 자기자신을 호출한다.

## Stopping condition for Recursion
재귀 함수를 호출할 경우에는 중단하는 조건을 반드시 넣어줘야한다.

그 이유는 만약, 중단 조건이 없다면 재귀 함수는 무한적으로 자신을 호출하게 된다.

대부분 if...else 구문(or similar approach)를 사용하여 중단합니다.

일반적으로 재귀함수는 두가지 분귀를 갖습니다.
1. 재귀 호출용
2. 특정 조건에서 재귀 호출 중단 용

## For example
```Swift
func recurse() {
    if (condition) {
        //break recursive call
        recurse()
    }
    else {
        //recursive call
        recurse()
    }
}
recurse()
```

### Factorial
```Swift
func factorial(_ n: Int) -> Int {
    if n == 0 || n == 1 { return 1 }
    return n * factorial(n - 1)
}
```


### 전위 중위 후위
이진트리의 순회 방법으로는 세가지가 있다.
1. 전위 (preorder)
2. 중위 (inorder)
3. 후위 (postorder)

1. 전위 (preorder)
- root를 방문후 왼쪽 오른쪽 자식 노드 방문

2. 중위 (inorder)
- 왼쪽 노드 방문 후 root 방문, 마지막으로 오른쪽 자식 노드 방문

3. 후위 (postorder)
- 왼쪽 노드, 오른쪽 노드 방문 후 root방문

이진트리의 순회 방법을 재귀함수를 통해서 구현할 수 있습니다.

ex)
```Swift
class Node {
    var key: Int
    var left: Node?
    var right: Node?
    init(key: Int) {
        self.key = key
    }
}

let node = Node(key : 16)
node.left = Node(key: 9)
node.right = Node(key: 18)

node.left?.left = Node(key: 8)
node.left?.right = Node(key: 12)

node.right?.left = Node(key: 17)
node.right?.right = Node(key: 20)
```
참고로 Swift의 struct타입은 재귀적 값 타입을 허용하지 않기 때문에 class로 구현해야한다.

코딩테스트에서 또한 위처럼 구현하는 것이 아니라 배열이 주어진다면 이진트리가 구현되게끔 작성해야하기에 더 어려울 수 있다.

여기서는 재귀함수의 동작을 이해하기 위함이기에 간단하게 가보겠다.

- 전위
```swift
func printPreorder(node : Node? ) {
    
    if node == nil { return }
    
    print(node!.key,terminator:" " )
    
    printPreorder(node: node!.left)
    printPreorder(node: node!.right)
}
// 16 9 8 12 18 17 20 
```

- 중위
```swift
func printInorder(node : Node?) {
    if node == nil { return }
    
    printInorder(node: node!.left)
    print(node!.key,terminator:" ")
    printInorder(node: node!.right)
}
//8 9 12 16 17 18 20
```

- 후위
```swift
func printPostorder(node: Node?) {
    if node == nil { return }
    
    printPostorder(node: node!.left)
    printPostorder(node: node!.right)
    print(node!.key, terminator: " " )
}
//8 12 9 17 20 18 16 
```
