# 퀵 정렬(Quick Sort)
분할 정복(Divide and Conquer) 알고리즘을 기반으로 한 정렬 알고리즘.

분할 정복이란 말 그대로 큰 문제를 나눌 수 없을 때까지 나누어서 풀고, 각각의 해답을 합쳐서 전체 문제를 해결하는 알고리즘 기법.

## 기본 로직

1. 배열에서 pivot(기준 값)을 하나 선택한다.
2. pivot을 기준으로 작은 값들은 왼쪽, 큰 값들은 오른쪽으로 분할한다.
3. 각 부분 배열에 대해 재귀적으로 반복한다.
4. 더 이상 나눌 수 없을 때 까지 반복하면 정렬이 완료된다. 

### 코드

```swift
func quickSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 { return array }
    
    let pivot = array[array.count / 2]   // 중앙값을 피벗으로 선택
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}
```

- 이 코드는 가독성은 좋지만 메모리를 더 사용한다.
- 최적화를 위해 in-place 방식인 기존 array내에서 swap을 통해 정렬하는게 더 효율적이다.

### 최적화 코드

```swift
// 정복(Conquer)
func quickSort(_ array: inout [Int], _ low: Int, _ high: Int) {
    if low >= high { return }
        
    // 분할(Divide)
    let pivot = partition(&array, low, high)
        
    // 피벗은 제외한 2개의 부분 배열을 대상으로 재귀 호출
    quickSort(&array, low, pivot - 1)   // 왼쪽 부분 배열 정렬
    quickSort(&array, pivot + 1, high)  // 오른쪽 부분 배열 정렬
}

// 분할(Divide)
func partition(_ array: inout [Int], _ low: Int, _ high: Int) -> Int {
    var pivot = array[low]
    var i = low
    var j = high
        
    while i < j {
        while pivot < array[j] {
            j -= 1
        }
        while i < j && pivot >= array[i] {
            i += 1
        }
        array.swapAt(i, j)
    }
    array[low] = array[i]
    array[i] = pivot   
     
    return i
}
```

## Quick Sort의 문제점과 개선

정렬하고자 하는 **배열이 정렬(오름차순, 내림차순)**되어 있다면 **O(n^2)의 시간복잡도**를 갖게되는 문제점이 있다.

partition함수에서 피벗 값이 최소나 최대값으로 지정되어 파티션이 나누어지지 않기 때문에, O(n^2)의 시간복잡도를 갖게 된다.

이를 확률적으로나마 시간복잡도를 개선하기 위해서는 배열의 가장 앞에 있는 값과 중간값을 교환해 주면 개선할 수 있다. 하지만, 이 방법 또한 퀵 정렬의 시간 복잡도가 최악인 경우 O(nlog₂n)이 되는 것은 아니다.

## 시간 복잡도

- **최선의 경우 O(nlog₂n)**
    - 비교 횟수 `(log₂n)`
        - 배열의 크기 n에 따라 2개로 나누어 깊어지기 때문에 일반화 할 경우 n = 2^k, k = log₂n 로 표현할 수 있다.
        - 이는 즉 순환 호출의 깊이, 순환 호출의 횟수이다.
    - 순환 호출 단계의 비교 연산 `(n)`
        - 각 순환 호출에서 pivot에 따라 레코드를 비교(전체 배열에 대하여)해야 하므로 평균 n번 정도의 비교가 이루어진다.
    - 따라서, 최선의 시간복잡도는 **`O(nlog₂n)`**이 된다.
- **최악의 경우 O(n^2)**
    - 위에서도 설명 했듯이 Quick Sort의 문제점으로 분할 단계인 비교 연산 시 배열이 정렬 되어 있는 경우가 문제가 된다.
    - **비교 횟수 `(n)`**
        - 분할로 나눌 때, 정렬되어 있는 경우 1 과 (n -1) 개로 나누어 지기 때문에 총 n번의 순환 호출이 이루어지게 된다.
    - 순환 호출 단계의 비교 연산 `(n)`
        - 최선의 경우처럼 생각하면 된다.
    - 따라서, 최악의 경우 시간복잡도가 **`O(n^2)`** 를 갖는다.
- 평균 O(nlog₂n)

## 공간 복잡도

- **O(n)**
    
    주어진 배열 안에서 이루어지기 때문에 O(n)이다.
    

## 특징

**18년도 전**까지 **swift의 sort() 메소드**에서 **퀵소트를 힙소트와 하이브리드 형태로 사용**한다.

### **장점**

- 시간 복잡도가 다른 정렬 알고리즘과 비교했을 경우 **매우 빠르다. O(nlog₂n)**
    - 불필요한 데이터의 이동을 줄이고, 먼 거리의 데이터를 교환.
    - 한 번 위치가 결정된 값들은 이 후 연산에서 제외된다.
- 배열 내에서 교환하는 방식으로 새로운 메모리 공간을 필요로 하지 않는다.

### 단점

- 정렬된 배열에 대해서는 오히려 수행시간이 더 많이 걸린다. (위의 문제점 예시)
- **불안정 정렬이다.**
