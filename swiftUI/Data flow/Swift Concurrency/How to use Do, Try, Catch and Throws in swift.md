# How to use Do, Try, Catch and Throws in swift
동시성에 대해 공부하기 전에 동시성 프로그래밍 때 많이 사용하는 Do, Try, Catch, Throws에 대해서 공부해보자.

특히 사용하는 이유에 대해서 더 집중해서 살펴보자.

예를 들어 데이터를 가져올 때, 무엇인가 문자열을 얻어온다고 생각해보자.

실제로는 문자열을 제대로 가져올 수도, 못할 수도 있다. 오류가 발생 할 수 있을 경우를 대비해서 코드를 짜본다면 아래와 같을 것이다.

### 튜플을 사용해서 Error 반환하기

```swift
func getTitle() -> (title: String?, error: Error?) {
    if isActive {
        return ("New Text!!", nil)
    } else {
        return (nil, URLError(.badURL))
    }
}
```

```swift
let returnedValue = manager.getTitle()
if let newTitle = returnedValue.title {
    self.text = newTitle
} else if let error = returnedValue.error {
    self.text = error.localizedDescription
}
```

실제로 api를 사용하진 않았기에 URLError()를 사용해서 표현 했다.

위 코드 처럼 title을 얻어 올 때 얻어 왔을 경우와 실패했을 경우를 튜플을 통해 메소드에서 제공할 수 있다. 

하지만 성공, 실패 모든 경우에 타이틀과 에러 모든 데이터를 살펴보게 된다.

### Result<Any, Error> 사용하기

튜플 대신 Swift에서 제공해주는 Result<Any, Error>을 사용하면 더 명확하고, 편하게 코드를 짤 수 있다.

```swift
func getTitle2() -> Result<String, Error> {
    if isActive {
        return .success("New Text!!")
    } else {
        return .failure(URLError(.appTransportSecurityRequiresSecureConnection))
    }
}
```

```swift
let result = manager.getTitle2()

switch result {
case .success(let newTitle):
    self.text = newTitle
case .failure(let error):
    self.text = error.localizedDescription
}
```

Result<Any, Error>를 사용한다면 switch case 문을 통해서 Error를 구분할 수 있다.

이제 다른 개발자가 코드를 봤을 때, 성공 상태나 실패 상태 중 하나를 제공할 것이라는 것이 튜플을 사용 했을 때보다 더 분명해 졌다.

확실히 성공인지, 실패인지를 확인 할 수 있게 되었다.

getTitle메소드에서는 성공이나 실패를 돌려받을 것이라는 것을 이제는 알고 있을 수 있다. 그렇다면 이 함수가 우리에게 결과를 알려주는 대신 둘 중 하나만 반환하게 한다면 더 좋지 않을까?

### throws, do-catch, try 사용하기

```swift
func getTitle3() throws -> String {
    if isActive {
        return "New Text!!"
    } else {
        throw URLError(.badServerResponse)
    }
}
```

```swift
do {
    let newText = try manager.getTitle3()
    self.text = newTitle
} catch {
    self.text = error.localizedDescription
}
```

메소드에 throws를 사용해서 String만 반환하는 메소드에서 error를 던질 수 있도록 해보았다.

throws를 사용한다면 try를 통해서 메소드를 사용해야하고, try를 사용해도 throw된 error를 처리하기위해서는 do-catch문을 위 코드처럼 사용해야 한다.

위 코드처럼 구성한다면 String값을 반환하는 메소드로 더 명확해졌고, throws를 통해 error를 던질 수 있다는 것 또한 확인 할 수 있게 되었다.

Result를 사용해서 결과를 반환하고, error를 확인하는 것보다 throws문을 통해 결과를 반환하도록 시도하고, 실패했다면 error를 던진다는 것으로 더 명확해 졌다.

### do-catch문의 사용

do-catch문에서는 위 처럼 try를 한번 뿐 아니라 여러번 사용할 수도 있다.

```swift
do {
    let newTitle = try manager.getTitle3()
        self.text = newTitle

    let finalText = try manager.getTitle4()
    self.text = finalText
} catch {
    self.text = error.localizedDescription
}
```

do-catch문에 여러번 try를 하게 되었을 때 하나라도 오류로 인해 throw를 한다면 바로 catch문으로 들어가게 된다.

```swift
let isActive = true

func getTitle3() throws -> String {
//    if isActive {
//        return "New Text!!"
//    } else {
      throw URLError(.badServerResponse)
//    }
}

func getTitle4() throws -> String {
    if isActive {
        return "Final Text!!"
    } else {
        throw URLError(.badServerResponse)
    }
}
```

이 메소드를 통해 위 do-catch문에 들어간다면 catch문에 들어가게 돼서 self.text는 error.localizedDescription를 나타내게 될 것이다.

### try?, try!의 사용

try?와 try!를 사용할 수도 있다.

```swift
let newTitle = try? manager.getTitle3()

if let newTitle = newTitle {
    self.text = newTitle
}
```

try?를 사용할 경우에는 throw를 한다면 nil값을 return하게 된다.

고로 newTitle는 String?을 띄게 된다. 그래서 옵셔널 바인딩을 통해 사용할 수 있게 된다.

또한 try?를 사용하게 된다면 throw에 대한 오류처리를 하지 않아도 되기에 do-catch문 없이도 사용이 가능하게 된다.

만약 do-catch문 안에서 사용하게 된다면 어떻게 될까?

```swift
do {
    let newTitle = try? manager.getTitle3()
    if let newTitle = newTitle {
        self.text = newTitle
    }

    let finalText = try manager.getTitle4()
    self.text = finalText
} catch {
    self.text = error.localizedDescription
}
```

위 코드를 실행 시킨다면 self.text에는 결국 finalText값이 들어가게 될것이다. 

try?문에서 throw를 한다고 하더라도 catch문으로 들어가지 않게 된다는 것이다.

try!는 어떨까?

```swift
let newTitle = try! manager.getTitle3()
self.text = newTitle
```

try!를 사용한다면 newTitle은 String을 띄게 된다. 

하지만 모두가 말하듯 강제언래핑은 쓰지 않은 것이 좋다. 만약 getTitle3에서 오류 발생으로 throw를 하게 된다면 Crash가 발생하게 될것이기 때문이다.

---

오늘은 동시성 프로그래밍 공부를 하기 전에 동시성에서 무조건 사용하게 되는 do-catch, try, throw에 대해서 공부를 하고 왜 사용하는지에 대해서 알아봤다.

do,try, catch, throw를 사용하지 않을 때부터, 사용하는 단계까지 순차적으로 알아보니 이해하는데 도움이 되었고, 사용하는 이유에 대해서도 알아볼 수 있게 되었다.

다음에는 Async/Await, @escaping, Combine에 대해서 알아보자..

## +

### Enum으로 Error 정의하기

enum을 이용해서 error를 정의해서 사용할 수 있다.

```swift
enum MyError: Error {
    case divideByZero
}
```

```swift
func devide(with inputNumber: Float) throws -> Float {
    var result: Float = 0
    if inputNumber == 0 {
        throw MyError.divideByZero
    } else {
        result = 10 / inputNumber
    }
    return result
}
```

devide 메소드에서 사용한 것 처럼 내가 정의한 에러를 던질 수 있게 된다. 이를 사용하면 catch문에서 해당 에러만 따로 예외처리를 할 수 있게 된다.

```swift
do {
    let divideNumber = try devide(with: (Float(inputNumber) ?? 1.0))
} catch MyError.divideByZero {
        print("0으로 나눔.")
} catch {
        print(error.localizedDescription)
}
```

위 코드를 보면 try devide에서 직접 지정한 에러를 던지는데 해당 에러만 따로 catch문을 통해 예외처리가 가능하게 된다. 또한 해당 catch문에 걸리게 된다면 밑에 catch문에는 걸리지 않게 된다.

이를 사용하면 여러가지 error를 직접 정의해서 error마다 예외처리를 원하는대로 해줄 수 있게 될것이다.
