#  입출력 시간 초과
백준 알고리즘을 Swift로 풀면서 시간 초과로 머리 아픈 경우가 많았다.

아무리 생각해도 맞는 알고리즘을 사용하고, 시간초과에 걸릴 이유가 없는데 시간 초과로 문제 정답을 받지 못하는 경우가 많아 머리빠질 지경이었다.

그러다 구글링 중 [라이오](https://github.com/JCSooHwanCho)님의 파일 입출력으로 스위프트에서 기본으로 제공해주는 readline()을 대신 할 수 있다는 점을 알았다.

## 코드
### 입력
```swift
import Foundation

final class FileIO {
    private let buffer: Data
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        guard index < buffer.count else { return 0 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }


    @inline(__always) func readString() -> String {
            var str = ""
            var now = read()

            while now == 10
                    || now == 32 { now = read() } // 공백과 줄바꿈 무시

            while now != 10
                    && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
            }

            return str
    }
}
```

위의 클래스를 사용한다면 파일입출력으로 readline()을 대체할 수 있다고 한다.

아직 제대로 코드를 뜯어보며 이해하진 못했지만 차차 해볼 수 있기를..

### 출력
```swift
var result = ""
var resultArr = [Int]()
func foo(num: Int) -> Int{
  //특정함수
}

for i in 0..<1000000 {
    resultArr.append(foo(num: i)) //일반적인 방법
    result.write(String(foo(num: i)) + "\n") //write 이용방법
}

//1. 일반적인 출력
for i in 0..<resultArr.count {
    print(resultArr[i])
}

//2. string 출력
print(result)
```

생각보다 print()도 시간초과에 영향을 미친다고 한다. 

위의 코드는 비교를 위해 간단하게 만든 것인데 중요한 점은 그 때 마다의 결과값을 String화 하여(대게 Int결과값이 많다.) string 변수에 write를 하는 것이다. 변수에 += 보다 write()를 사용했을 때 시간을 줄일 수 있다. 이 점도 파일입출력에 관련된 것 같다.

***

이 점 때문에 스위프트로 알고리즘을 푸는 것을 그만해야 될까 고민도 많이 했다...

위 코드를 공부 하여 잘 사용할 수 있도록 해보기

    or

백준에서 swift에 대한 시간초과 시간을 늘려줄 때까지 기다리던지..

아마 위 코드를 당분간 공부할 것 같다.
