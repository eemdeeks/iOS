#  DFS/BFS
Depth-First Search(DFS)와 Breadth-First Search(BFS)는 그래프 탐색 알고리즘이다.

이 알고리즘들은 그래프에서 노드 간의 최단 경로를 찾거나, 구성 노드를 탐색하는 등 다양한 그래프 문제를 해결하는데 사용된다.

## Depth-First Search(DFS)
DFS는 깊이 우선 탐색이라고 하며, 스택이나 재귀 함수를 사용하여 구현된다. 

DFS는 한 경로를 따라 끝까지 탐색한 후, 다음 경로를 찾는다. 한 노드에서 출발하여 가능한 한 멀리까지 탐색한 후, 다시 돌아와 다음 경로를 탐색한다.

그래프의 구성요소, 사이클, 위상 정렬 등을 찾는 데 유용한 알고리즘이다.

## Breadth-First Search(BFS)
BFS는 너비 우선 탐색이라고 하며, 큐를 사용하여 구현한다.

BFS는 한 노드에서 시작하여 인접한 노드를 모두 방문 후, 이어지는 모든 노드를 탐색하는 방식이다. 노드의 깊이가 낮은 것부터 탐색하며, 최단 경로 문제를 해결하는 데 사용된다.

## 이해 돕기
<img width="312" alt="image" src="https://github.com/eemdeeks/iOS/assets/87136217/5ca7f996-515e-403d-b6d7-9fa95b3ce080">
 
예를 들어 위의 그래프가 있다고 한다면,

### DFS
DFS 일 경우 A-B-D-E-C-F 순서로 노드들을 탐색한다.

### BFS
BFS 일 경우는 A-B-C-D-E-F 순서로 노드들을 탐색하게 된다.

## 코드
코드로 구현해보자
### DFS
ex) 재귀함수
```swift
func dfs(_ graph: [[Int]], _ startNode: Int, _ visited: inout [Bool]){
    visited[startNode] = true
    print(startNode, terminator: " ")

    for nextNode in graph[startNode] {
        if !visited[nextNode] {
            dfs(graph, nextNode, &visited)
        }
    }
}
```
ex) 반복문
```swift
func dfs(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitStack: [String] = [start]
    
    while !needVisitStack.isEmpty {
        let node: String = needVisitStack.removeLast()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitStack += graph[node] ?? []
    }
    
    return visitedQueue
} 
```

### BFS
```swift
func bfs(_ graph: [[Int]], _ startNode: Int, _ visited: inout [Bool]){
    var visited = [Bool](repeating: false, count: graph.count)
    var queue = [Int]()
    queue.append(startNode)

    while !queue.isEmpty {
        let node = queue.removeFirst()
        if !visited[node] {
            print(node, terminator: " ")
            visited[node] = true
            for neighbor in graph[node] {
                queue.append(neighbor)
            }
        }
    }
}
```

## 추가
- inout 파라미터

***
### 참고
- [마고자비 블로그](https://magomercy.com/)
- [개발자 소들이_tistory](https://babbab2.tistory.com/)
