# 삽입 정렬(Insertion Sort)

한줄 정리: 현재 위치에서, 정렬된 배열들을 비교하여 자신이 들어갈 위치를 찾아, 위치에 삽입하는 배열 알고리즘이다.

## 기본 로직

1. 두 번째 인덱스부터 시작한다.
2. 바로 앞에 있는 요소부터 비교하여, 자신보다 큰 값들은 한칸씩 뒤로 밀어낸다.
3. 자기가 들어갈 자리에 삽입한다.

이 과정을 전체 배열에 대해 반복하면 정렬이 완료된다.

```swift
func insertionSort(_ array: inout [Int]) {
    for index in 1..<array.count {
        var insertionIndex = index
        let value = array[index]
        while insertionIndex > 0 && array[insertionIndex - 1] > value {
                array[insertionIndex] = array[insertionIndex - 1]
                insertionIndex -= 1
        }
        array[insertionIndex] = value
    }
}
```

## 시간 복잡도

- **O(n^2)**
    - 이미 정렬된 상황(최선)에서 삽입 할 경우에는 삽입할 값을 통한 전체 배열 한번만 훑으면 되기 때문에 O(n)
    - 평균, 최악 모두 비교, 이동 반복하기 때문에 **O(n^2)**
        - n(n-1)/2
    - 거의 정렬된 데이터에 매우 효율적이다.
    

## 공간 복잡도

- **O(n)**
    
    추가적인 메모리를 거의 사용하지 않기 때문
    

## 특징

- 작은 데이터나 거의 정렬된 경우에 아주 효율적이다.
- 대량의 데이터에 비효율적이다. O(n^2)
