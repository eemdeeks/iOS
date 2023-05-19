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


