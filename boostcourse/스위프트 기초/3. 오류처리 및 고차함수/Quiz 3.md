# Quiz 3
## Q1. 스위프트 오류처리 퀴즈
### 아래 코드에 [빈칸] 5개에 적절한 표현을 순서대로 채워보세요

다음과 같이 "/"로 구분하고 빈칸 없이 입력해주세요.

ex) 빈칸1/빈칸2/빈칸3/빈칸4/빈칸5
```swift
enum VendingMachineError: _____빈칸1_____  {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

class VendingMachine {
    var deposited: Int = 0

    func receiveMoney(_ money: Int) throws {
        guard money > 0 else {
            _____빈칸2_____ VendingMachineError.invalidInput
        }
    self.deposited += money
    print("\(money)원 받음")
    }
}

let machine: VendingMachine = VendingMachine()

_____빈칸3_____  {
    _____빈칸4_____ machine.receiveMoney(0)
}  _____빈칸5_____ VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다")
}
```

## Q2. 스위프트 고차함수 퀴즈
### 아래 빈칸에 알맞은 코드를 채워보세요

다음과 같이 "/"로 구분하고 빈칸 없이 입력해주세요.

ex) 빈칸1/빈칸2
```swift
let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int] = numbers._____빈칸1_____  {
  $0 * 2
}
let evenNumbers: [Int] = numbers._____빈칸2_____  {
  $0.isMultiple(of: 2)
}
```
