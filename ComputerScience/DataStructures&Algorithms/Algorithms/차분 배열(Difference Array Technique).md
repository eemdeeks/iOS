# 차분 배열 (Difference Array Technique)

배열의 연속적인 부분 업데이트를 빠르게 수행 할 수 있는 기법이다.

변화의 시작과 끝만을 표시하여 O(1)시간에 업데이트를 수행 후 나온 차분 배열을 누적합을 통해 최종 변화량을 계산할 수 있다.

## 사용 이유

부분(n 길이) 업데이트 (m개)가 있을 경우 **`반복문`**을 통해 적용할 경우, **`O(n * m)`**의 시간 복잡도를 갖게 된다.

이를 **`차분 배열`**을 이용하여 부분 업데이트에 관한 시간 복잡도를 O(1)로 만들어 최종 **`O(n + m)`**의 시간복잡도로 줄일 수 있다.

## 구조와 동작 예시

1. 차분 배열을 선언하여, 업데이트 할 구간의 시작과 끝만 차분 배열을 업데이트한다.
    - 업데이트할 값 value에 대해서 시작 index에는 +value, 끝나는 index + 1 에 -value로 지정해준다.
2. 차분 배열에 모든 업데이트를 해준 다음 누적합을 해준다.
3. 누적합을 통해 원래의 배열을 업데이트 해준다.

### 예시 문제

- 정수 배열 arr과 [start, end, value] 형태의 query 배열 queries가 있다.
- arr에 대해서 start 인덱스 부터 end 인덱스 까지 value를 더한 배열을 return하는 함수를 완성 해보자.

### 반복문 사용

```swift
func solution(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
    var result = arr
        
    for query in queries {
        for index in query[0]...query[1] {
                result[index] += query[2]
        }
    }
        
    return result
}
```

반복문을 이용하면 위와 같이 간단하게 풀이 할 수 있다. 하지만 시간 복잡도를 계산해 보면, (queries의 길이) * (query 내부의 end - start) 의 시간 복잡도를 갖게 된다. **`O(n * m)`** 의 시간 복잡도를 갖게 되는 것이다.

### 차분 배열 사용

```swift
func solution(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
    var result = arr
    var diffArray = Array(repeating: 0, count: arr.count + 1)
        
    // 차분 배열 업데이트
    for query in queries {
        diffArray[query[0]] += query[2]
        diffArray[query[1] + 1] -= query[2]
    }
        
    // 차분 배열 누적 합
    var updateValue = 0
        
    for index in 0..<arr.count {
        updateValue += diffArray[index]
        result[index] += updateValue
    }
        
    return result
}
```

이와 같이 차분 배열을 이용할 경우, 차분 배열을 업데이트하는 시간 m과 누적합과 이를 이용하여 업데이트하는 시간 n이 걸리므로 **`O(n + m)`** 의 시간복잡도를 갖게 된다.

## 추천 백준 문제

- [(골드5)개똥벌레](https://www.acmicpc.net/problem/3020)
