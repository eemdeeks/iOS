# 버블 정렬(Bubble Sort)

한줄 정리: 인접한 두 값을 비교해서 큰 값을 지속적으로 뒤로 밀어내는 방식의 정렬 알고리즘

## 기본 로직

1. 가장 처음부터 시작하여 인접한 값을 비교한다.
2. 앞의 값이 더 크면 교환하고 다음 인덱스로 넘어간다.
    1. 앞의 값이 더 작으면 교환하지 않고 넘어간다.
3. n - 1 - i 까지 비교하여 교환한다.
4. 이 과정을 전체 배열에 대해 반복하면 정렬이 완료된다.

```swift
func bubbleSort(_ array: inout [Int]) {
    for i in 0..<array.count {
        var swapped: Bool = false
        for j in 0..<array.count - i - 1 {
            if array[j] > array[j + 1] { 
                array.swapAt(j, j + 1)
                swapped = true
            }
        }
               
        if !swapped { break }
    }
}
```

## 시간 복잡도

- **O(n^2)**
    - 평균, 최악(역순으로 다시 정렬하는 경우) **O(n^2)**의 시간복잡도를 갖는다.
    - 이미 정렬된 경우(최선) 위 코드처럼 최적화까지 한 경우 O(n)이 걸릴 수도 있다.

## 공간 복잡도

- **O(n)**
    
    추가적인 메모리를 거의 사용하지 않기 때문
    

## 특징

- 효율이 좋지 않아 실제로 쓰이지는 않는다. (너무 느림)
