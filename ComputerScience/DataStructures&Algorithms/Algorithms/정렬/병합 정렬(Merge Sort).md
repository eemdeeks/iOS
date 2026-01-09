# 병합 정렬(Merge Sort)

분할 정복(Divide and Conquer) 알고리즘을 기반으로 한 정렬 알고리즘.

합병 정렬이라고도 부르며, 퀵 정렬과 함께 많이 언급되는 정렬 방식.

분할 정복이란 말 그대로 큰 문제를 나눌 수 없을 때까지 나누어서 풀고, 각각의 해답을 합쳐서 전체 문제를 해결하는 알고리즘 기법.

## 기본 로직

1. 배열을 절반으로 나눈다.
2. 이후 나온 배열들도 절반 씩 나눈다.
3. 1, 2를 반복하며 나눌 수 있을 때 까지(크기가 1 또는 0) 나눈다.
4. 이 후 나온 요소들을 2개 씩 병합하는데, 이 때 정렬(크기비교)를 하여 병합한다.
5. 4를 반복 병합하여 하나의 배열이 나올 때까지 반복한다.

### 코드

```swift
func mergeSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 { return array }
    let midIndex = array.count / 2
    let left = Array(array[0..<midIndex])
    let right = Array(array[midIndex..<array.count])

    return merge(mergeSort(left), mergeSort(right))
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result: [Int] = []
    var i = 0
    var j = 0

    while i < left.count && j < right.count {
        if left[i] <= right[j] {
            result.append(left[i])
            i += 1
        } else {
            result.append(right[j])
            j += 1
        }
    }

    while i < left.count {
        result.append(left[i])
        i += 1
    }

    while j < right.count {
        result.append(right[j])
        j += 1
    }

    return result
}

```

## 시간 복잡도

- **평균, 최선, 최악 모두의 경우 O(nlog₂n)**
    - 배열을 나누는 횟수, 합병(merge)하는 횟수 `(log₂n)`
        - 배열의 크기 n에 따라 2개로 나누어 깊어지기 때문에 일반화 할 경우 n = 2^k, k = log₂n 로 표현할 수 있다.
        - 이는 즉 순환 호출의 깊이, 순환 호출의 횟수이다.
    - 각 합병 단계의 비교 연산 `(n)`
        - 각 합병 단계에서 n/2 배열 1쌍을 n번 비교, n/4 배열 2쌍 n/2번 비교이기에 일반화 할 경우 n/2 * 2, n/4 * 4 즉 n으로 일반화 된다.
    - 총 `(log₂n)` + `(nlog₂n)` 으로 표현할 수 있는데, 이를 빅오표기법을 이용한다면 시간복잡도는 **`O(nlog₂n)`**이 된다.

## 특징

**합병 정렬은 LinkedList를 정렬할 대 사용하면 매우 효율적이다.**

LinkedList는 삽입, 삭제 연산에 유용하지만 접근 연산에는 비효율 적이다.

이에 합병정렬은 순차적인 비교로 정렬을 하기 때문에 효율적이지만,

`+` 

퀵정렬을 이용해 LinkedList를 정렬 한다면 성능이 좋지 않음.(순차 접근이 아니기 때문에)

임의 접근하는 퀵소트를 사용한다면 오버헤드 발생이 증가한다.

### 퀵정렬과의 차이점

- 퀵정렬: 피벗을 이용해 정렬 후  → 영역을 나눈다. → 그 이후 합친다.
- 병합정렬: 영역을 나눌 수 있을 만큼 나눈 후 → 정렬하면서 합친다.

### **장점**

- 안정 정렬이다.
- **LinkedList 정렬의 효과적이다.**
    - 이를 통해 in-place 정렬 구현할 수 있다.
    - 즉, **큰 용량의 데이터를 정렬할 경우 연결리스트와 함께 사용한다면, 매우 효과적이다.**

### 단점

- 배열로 구성할 경우 임시 배열이 필요해, in-place 정렬이 아니다.
- 데이터의 용량이 클 경우, 이동 횟수가 많아저 시간적 낭비가 일어난다.
