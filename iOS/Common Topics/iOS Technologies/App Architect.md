# App Architect
iOS 앱의 계층은 하드웨어와 코코아 터치 계층으로 이루어져 있다.
<img width="343" alt="image" src="https://user-images.githubusercontent.com/87136217/226355341-edc309c4-531d-4c48-8f29-e74616f60c34.png">

<img width="388" alt="image" src="https://user-images.githubusercontent.com/87136217/226355172-3a9d8cc4-1b38-4e47-9e44-b6ba3119bb08.png">
상위 계층으로 갈 수록 유저, iOS Application과 가깝고, 하위 계층일수록 하드웨어에 가깝다.

## Cocoa touch
[코코아 터치](https://github.com/eemdeeks/iOS/blob/main/iOS/Getting%20Deeper/System%20Framework/Cocoa%20Touch.md)는 나중에 [Cocoa Touch 부분](https://github.com/eemdeeks/iOS/blob/main/iOS/Getting%20Deeper/System%20Framework/Cocoa%20Touch.md)에서 설명하겠습니다.

## Media
- 그래픽, 오디오, 비디오 등 멀티미디어 관련 계층
- Quartz, Core Animation, Open GL ES, Core Audio, OpenAL

## Core Services
- 데이터 집합관리, 네트워크, 문자열 처리
- 내부 데이터, 파일 입출력, 소켓, 위치 센서
- Core Foundation, CFNetwork, Core Location, SQLite, XML

## Core OS
- 커널, 파일 시스템, 네트워크 등 운영체제 핵심
- 메모리, 프로세서 관리 등 시스템 프로그래밍
- 하드웨어와 가장 근접한 Low level 계층

***

### 참고
- [velog_김상우](https://velog.io/@heyksw)
