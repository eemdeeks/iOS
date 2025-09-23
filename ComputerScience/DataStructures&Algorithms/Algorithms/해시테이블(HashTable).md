# 해시 테이블(Hash Table)

해시 테이블은 탐색을 최대한 줄여주기 위해, input에 대한 key 값을 얻어내서 관리하는 방식이다.

참고: Swift에서는 대표적으로 해시로 동작하는 딕셔너리가 존재한다.

## 구조와 동작 형태

key - value 형태로 데이터를 저장하며, 내부적으로는 배열로 구현되어진다.

key값을 통해 value를 찾을 수 있는데, 이는 key값을 해시함수를 이용해 value 데이터가 저장된 해시 주소값을 찾을 수 있다는 것이다.

한마디로 key를 해시 함수를 이용해 해시 주소값(즉, 해시 테이블의 index)으로 바꾸어 이를 통해 해시 테이블에 접근하여 값을 가져오거나 저장하는 형태이다.

## 장점과 단점

보통 시간 복잡도와 공간 복잡도를 맞바꿨다고 표현한다.

빠른 속도를 자랑하지만 그만큼 저장 공간을 많이 필요로 하기 때문에.

저장, 검색, 삭제 등 `탐색`을 많이 하는 경우나 **`캐시`**를 구현할 때 많이 사용.

### 장점

- 해시 테이블을 이용해서, key에 해당하는 값을 확인만 하면 되기 때문에 시간이 매우 절약된다. 보통 O(1)로 표기
- 저장 및 읽기 속도가 빠르다.

### 단점

- 일반적으로 저장 공간이 많이 필요하다.
- 충돌 발생 시 해결하기 위한 별도의 자료구조가 필요하다.

## 구현

간단히 구현해보며 알아보자

### 1. 해시 테이블 및 해시 함수

```swift
var hashTable: [String?] = Array(repeating: nil, count: 4)
```

배열을 통해 해시테이블을 만든 후

```swift
func hash(key: String) -> Int? {
    guard let convertKey = UnicodeScalar(key)?.value else { return nil }
    return Int(convertKey) % 4
}
```

키를 받아 해쉬값으로 변경 해줄 해시 함수를 만들어 준다.

### 2. 해시 테이블에 저장하기

```swift
func updateValue(_ value: String, to key: String) {
    guard let hashAddress = hash(key: key) else { return }
    hashTable[hashAddress] = value
}
```

### 3. value를 얻는 함수

```swift
func getValue(with key: String) -> String? {
    guard let hashAddress = hash(key: key) else { return nil }
    return hashTable[hashAddress]
}
```

## 문제

해시에서도 살펴 봤듯이 해시 충돌로 인해 해시 테이블의 충돌이 발생할 수 있다.

해시 함수로 해시 주소값으로 매핑 해줄 때 같은 값으로 매핑될 경우가 있는데, 이를 무시하면 해시테이블이 덮어씌어지는 충돌 현상이 발생하게 된다.

이를 해결하기 위해서 주로 두가지 알고리즘을 사용 할 수 있다.

### Chaining

개방 해싱(Open Hashing) 이라고 불리며, 해시 테이블 저장공간 외의 공간을 활용하는 방법이다.

충돌이 일어날 경우, **연결 리스트**를 이용하여 데이터를 추가로 뒤에 연결 시켜서 저장하는 방법을 말한다.

하나의 해시 주소값에 2개 이상의 Value를 연결 리스트로 저장하는데, 이때 어떤 키에 대한 값을 찾는지 알기 위해서 key값을 value와 함께 해시테이블에 저장한다.

그러나 이는 더 많은 메모리를 요구하기에 메모리 문제가 생길 수 있다.

### Linear Probing

폐쇄 해싱(Close Hashing)이라고 불리는 방식으로, 해시 테이블 저장 공간 안에서 충돌 문제를 해결하는 방법이다.

충돌이 일어난 경우, 해당 해쉬 주소값부터 순회하여 가장 처음 나오는 빈공간에 저장하는 방법이다.

이 또한 해시함수만으로 저장된 값을 찾는다고 보장하기 힘들기 때문에 key와 value를 함께 저장한다.

이 방법은 Chaining에서 저장 공간의 문제점을 보완할 수 있는 방법으로 저장 공간의 활용도를 높일 수 있다.
