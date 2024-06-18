# Protocol

프로토콜은 코드를 설계하고 설계한대로 구현할 수 있게 해주는 역할을 한다.

- 지켜야하는 규약
- ex) 자동차가 지키는 프로토콜 → 바퀴가 있다, 창문이 있다.
    - 그렇기에 차를 만들 때는 브레이크와 창문열기 기능을 추가

```swift
protocol Driveable {
        var speed: Int { get set }
        func speedDown() -> () 
}
```

우리가 만든 Driveable 프로토콜을 체택하는 class를 만들어보자

```swift
class Kia: Driveable {

}
```

위 코드는 오류가 날 것이다.

그 이유는 Kia라는 클래스는 Driveable이라는 프로토콜을 채택했기 때문에 프로토콜에서 지정해준 프로퍼티와 메소드를 무조건적으로 가져야 하기 때문이다.

```swift
class Kia: Driveable {
        var speed: Int
    init(speed: Int) {
        self.speed = speed
    }

    func speedDown(with downSpeed: Int) {
        speed -= downSpeed
    }

}
```

이렇게 한다면 오류는 사라지게 된다.

이처럼 프로토콜을 만들어서 해당 프로토콜을 채택하는 것들이 무슨 역할을 하는지, 어떤 것들을 갖고있는지를 미리 계획하고 지정할 수 있는 것이다.

또한 해당 프로토콜을 채택하는 배열로 생성할 수 있다.

```swift
var cars: [Driveable] = [Kia(speed: 3), Hyundai(speed: 3)]
```

이렇게 된다면 해당 배열에 요소들이 어떤 역할을 하는지 이미 알고 있어 여러가지로 사용할 수 있다.

```swift
for car in cars {
    car.speedDown(with: 3)
}
```
