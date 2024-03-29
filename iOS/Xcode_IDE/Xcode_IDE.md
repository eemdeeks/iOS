# Xcode IDE
IDE (Integrated Development Environment) : 통합 개발 환경이란 공통된 개발자 툴을 하나의 그래픽 사용자 인터페이스(GUI)로 결합하는 애플리케이션을 구축하기 위한 소프트웨어 이다.
Xcode : iOS 개발을 위한 IDE

- Xcode는 Mac, iPhone, iPad, Apple TV, Apple Watch를 위한 애플리케이션을 만드는데 필요한 모든 것을 갖고있다.

## Version
### 현재 버전 14.2가 갖고있는 SDKs
- iOS 16.2
- iPadOS 16.2
- tvOS 16.1
- watchOS 9.1
- macOS Ventura 13.1

## Xcode 설치
- [Xcode 설치 링크](https://apps.apple.com/us/app/xcode/id497799835?mt=12)

## 프로젝트 생성
- Xcode를 실행하기.
<img width="802" alt="스크린샷 2022-11-22 오후 4 09 53" src="https://user-images.githubusercontent.com/87136217/203249283-4200e65f-e63c-4cfc-95a0-57e63891d147.png">
  
1. Xcode를 실행하면 보이는 화면.

"Welcome to Xcode" 창에서 "Create a new Xcode project"를 선택.

이미 다른 프로젝트가 실행중인 경우, 상단의 File > New > Project 메뉴를 선택하여 새로운 프로젝트를 생성가능하다.

**새로운 프로젝트 생성의 단축키는 Shift + Command + N**

<img width="761" alt="image" src="https://user-images.githubusercontent.com/87136217/203249675-45a1d375-946c-4296-93e0-046b876ee515.png">

2. 애플리케이션이 동작할 OS를 선택.

3. 원하는 템플릿(Template)을 선택하고 "Next"를 클릭.

주로 Single View App을 사용.

<img width="761" alt="image" src="https://user-images.githubusercontent.com/87136217/203250627-6f575e0c-6fdf-4509-8246-4914a7f578e9.png">

4. 빈 공간에 제품 이름(애플리케이션 이름)을 입력.
애플리케이션 이름은 공백없이 영문 대소문자로 지어주는 것이 좋다.

* 필수로 Product name, Organization Identifier, Organization Name을 입력해야 합니다.
만약 Organization Name이 없다면 사용자 이름을 입력해도 무방.

5. Team에 계정을 추가하려면 "Add account"를 클릭해 추가할 수 있다.

6. Language에서 프로그래밍 언어를 Swift로, User Interface는 Storyboard를 선택한 뒤 "Next"를 클릭합.
* iOS는 Swift, Objective-C 언어를 사용.
** 아래 체크박스들은 나중에 차차 사용.

<img width="771" alt="image" src="https://user-images.githubusercontent.com/87136217/203251431-4f64b227-9180-45b0-a959-38a98b2a886a.png">

7. 프로젝트를 저장할 위치를 선택하고 "Create"를 선택하면 새로운 프로젝트 생성이 완료된다.
* "Create Git repository on my Mac"을 체크하면 자동으로 git 로컬 저장소를 생성할 수 있다.

<img width="1307" alt="image" src="https://user-images.githubusercontent.com/87136217/203251698-f96deddd-7199-4859-a3f2-66f363719df6.png">

위 화면과 같이 새로운 프로젝트 생성이 완성된 것을 확인 할 수 있다.

## Xcode 기본 화면 및 메뉴 구성
### 왼쪽 탭
#### Navigation
- 파일 구조를 보여주는 역할을 한다.
- 파일 계층 구조를 확인 가능
<img width="270" alt="image" src="https://user-images.githubusercontent.com/87136217/226111488-8e031a8b-f41f-441c-ae66-319cda5956e3.png">

#### 버전관리
- 소스코드의 변화에 대해서 알려주는 역할을 한다.
- 소스코드 추가, 수정 등
<img width="293" alt="image" src="https://user-images.githubusercontent.com/87136217/226111691-90541e9b-b484-4324-b735-eed9218fd06f.png">

#### 검색기능
- 탐색 기능을 갖고 있다.
<img width="293" alt="image" src="https://user-images.githubusercontent.com/87136217/226111806-def37e5c-eb63-454a-bc94-b7ab6aca064a.png">

#### 에러 창
- 에러가 나거나 경고가 나왔을 때 알려주는 창
<img width="293" alt="image" src="https://user-images.githubusercontent.com/87136217/226111854-1eda5309-24f0-4b91-bdef-cf0001d8caaa.png">

#### 테스트 창
- 테스트를 확인할 수 있는 창
<img width="293" alt="image" src="https://user-images.githubusercontent.com/87136217/226111941-21521742-46ad-44c7-a6bb-0e928b14f7d3.png">

#### 성능 확인창
- 메모리, 디스크 사용량등을 알려주는 창
<img width="293" alt="image" src="https://user-images.githubusercontent.com/87136217/226112174-4ca285a7-9e19-4d35-a079-957fe060bc64.png">

#### 디버깅 창
- breakPoint에 따른 디버깅을 확인할 수 있는 창
<img width="293" alt="image" src="https://user-images.githubusercontent.com/87136217/226112131-371ce146-887b-4df6-a584-e8a40bcaf690.png">

#### 히스토리 창
- 앱 빌드 또는 실행에 의한 결과들을 기록해주는 창
<img width="293" alt="image" src="https://user-images.githubusercontent.com/87136217/226112208-7f5ebc49-18d3-4cb1-9651-74b39d337ba8.png">


### 오른쪽 탭
- 현재 보고 있는 파일또는 텍스트에 대한 정보를 보여준다.
<img width="263" alt="image" src="https://user-images.githubusercontent.com/87136217/226112469-0fd15b52-1222-47a9-8520-c937088ccba5.png">

### 가운데 탭
- 코드를 작성할 수 있는 탭
- SwiftUI를 사용할 경우 오른쪽에 시뮬레이터 실행 예시를 확인 할 수 있다.
- 스토리 보드 사용시 xib나 스토리보드
<img width="1144" alt="image" src="https://user-images.githubusercontent.com/87136217/226112676-bc75677e-6f9f-45c4-9088-881ceb756e9d.png">

### 상단 탭
- 사용하고 있거나 사용할 시뮬레이터를 선택할 수 있는 탭
- 빌드나 실행 로딩을 확인할 수 있는 창
<img width="1152" alt="image" src="https://user-images.githubusercontent.com/87136217/226112594-63572456-561b-4ef5-82d7-32de9cd277a4.png">

### 하단 탭
- 디버깅 도구들
- 콘솔 창
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/87136217/226112790-564ad1e3-b20d-4e89-89c7-bbdcfff59f34.png">


![img1](https://cphinf.pstatic.net/mooc/20171228_15/1514469479791JRuGK_PNG/44_1.png?type=w760)

프로젝트(Project)는 애플리케이션을 구성하는 데 필요한 파일 및 리소스를 제공합니다. 프로젝트를 생성하려면 템플릿(Template) 중 하나를 선택하여 프로젝트를 생성할 수 있으며, 생성한 프로젝트를 통해 원하는 애플리케이션을 제작해 나갈 수 있습니다.

![img2](https://cphinf.pstatic.net/mooc/20171228_140/1514469649694k3NzL_PNG/44_2.png?type=w760)

먼저 프로젝트를 생성하면 기본 창이 나타납니다. 이 창에서 프로젝트의 모든 부분을 보고 편집할 수 있습니다. 그리고 사용자 작업 스타일에 맞게 구성할 수도 있습니다.

![img3](https://cphinf.pstatic.net/mooc/20171229_147/1514526338819rkmfe_PNG/44_3_tip.png?type=w760)

Scheme 메뉴에서 실행 중인 대상(예: 시뮬레이터 또는 기기)을 선택할 수 있습니다. 툴바(Toolbar)를 표시하려면 View > Show Toolbar를 선택합니다. 툴바 오른쪽에 있는 Show/hide areas을 사용하여 메인 창의 다른 영역을 표시하고 숨길 수 있습니다.

![img4](https://cphinf.pstatic.net/mooc/20171229_29/1514526357101GhCDY_PNG/44_4.png?type=w760)

내비게이터 영역(Navigator Area)을 사용하여 프로젝트의 다른 부분에 신속하게 접근할 수 있습니다.
내비게이터 바(Navigator bar)에 있는 버튼을 클릭하면 내비게이터 모음 아래에 해당하는 내용이 표시됩니다. 내비게이터 영역(Navigator Area)의 단축키는 Command + 0, 내비게이터 바(Navigator bar)의 단축키는 Command + 1 ~ 9까지 순서대로 이동할 수 있습니다.

![img5](https://cphinf.pstatic.net/mooc/20171229_21/1514526371484GFTiS_PNG/44_5.png?type=w760)

내비게이터 영역(Navigator Area)에서 소스파일을 선택하여 해당 소스파일을 편집할 수 있습니다.

![img6](https://cphinf.pstatic.net/mooc/20171229_27/1514526402495FYc1M_PNG/44_6.png?type=w760)

프로젝트 내비게이터(Project Navigator)의 루트 파일(프로젝트 내비게이터의 최상위 파일)을 선택하여 프로젝트 편집기(Project Editor)를 엽니다. 이 편집기를 사용하여 프로젝트 및 기타 설정을 보고 편집할 수 있고 상단의 탭을 사용해서 다양한 설정이 가능합니다.

![img7_0](https://cphinf.pstatic.net/mooc/20171229_144/15145264229616HzoE_PNG/44_7_0.png?type=w760)

프로젝트 내비게이터(Project Navigator)에서 해당 파일을 선택 후 유틸리티 영역(Utilities)을 누르면 사용할 수 있는 리소스들과 객체의 정보들을 볼 수 있습니다. Library pane은 Xcode 10 버전 이후로 별도의 창으로 분리되었습니다. Xcode 창의 오른쪽 위의 Library 메뉴 버튼을 선택하면 볼 수 있습니다.

![img7](https://cphinf.pstatic.net/mooc/20171229_74/1514526437746nBDV8_PNG/44_7.png?type=w760)

![img](https://cphinf.pstatic.net/mooc/20191023_70/1571770370780vGGKI_PNG/librarybutton.png?type=w760)

**Xcode 오른쪽 상단에 위치한 Library 버튼**

![img_pane](https://cphinf.pstatic.net/mooc/20191023_38/1571770433302P9i9d_PNG/librarypane.png?type=w760)

**별도의 창으로 분리되어 나온 Library pane**

Tip : 유틸리티 영역 단축키는 Option + Command + 0 입니다.

![img8_0](https://cphinf.pstatic.net/mooc/20171229_100/1514526476472uRlMP_PNG/44_8_0.png?type=w760)

에디터 영역에서 인터페이스 객체 및 설정을 클릭하여 빠른 도움말(Quick Help)을 볼 수 있습니다. 좀 더 자세한 설명을 보려면 해당 링크를 클릭하면 됩니다.

![img8_1](https://cphinf.pstatic.net/mooc/20180329_65/1522326149034pkOLo_PNG/44_8_1.png?type=w760)

에디터 영역에서 빠른 도움말을 보기 원하는 요소의 텍스트를 키보드의 Option키를 누른 상태로 클릭하면 팝업창으로도 볼 수 있습니다.

***

### 프로젝트 실행하기
Xcode에서 생성한 프로젝트를 Mac에 연결된 장치나 시뮬레이터로 실행하는 방법에 대해 알아봅시다.

![img15](https://cphinf.pstatic.net/mooc/20171229_146/1514527480901QobwA_PNG/44_15.png?type=w760)

하나의 프로젝트에 여러 개의 대상(Target)이 있을 수 있습니다. (여기서 대상(Target)이란 iOS, macOS, tvOS, watchOS를 위한 애플리케이션과 같이 빌드할 제품을 말합니다.)

![img16](https://cphinf.pstatic.net/mooc/20171229_110/15145275029522MbX2_PNG/44_16.png?type=w760)

애플리케이션을 실행하려면 툴바(Toolbar)에서 스킴(Scheme)을 선택합니다. 스킴은(Scheme)은 대상(Target)의 빌드와 실행 가능한 환경을 지정하는 설정 모음입니다. 프로젝트를 생성할 때 기본 스킴이 설정됩니다.

![img17](https://cphinf.pstatic.net/mooc/20171229_144/1514527523004d333k_PNG/44_17.png?type=w760)

다음은 해당 프로젝트를 실행할 기기를 선택합니다. 실제 기기가 연결되어 있지 않은 경우에는 메뉴에서 시뮬레이터를 선택하면 됩니다.

iOS 기기에서 애플리케이션을 테스트하려면 프로젝트 설정 화면의 Team에 애플 개발자 계정을 추가해야 합니다. 무료 계정인 경우 기기에서 계속 테스트를 하려면 일주일에 한 번씩 빌드를 통해 애플리케이션을 갱신해야 합니다. 그렇지 않으면 애플리케이션을 테스트할 수 없습니다. 유료 계정은 그런 제약은 없으며, 시뮬레이터에서 테스트하는 경우 별도의 개발자 계정은 없어도 됩니다.

![img18](https://cphinf.pstatic.net/mooc/20171229_113/1514527550021f2POj_PNG/44_18.png?type=w760)

watchOS를 테스트 하려면 스킴(Scheme) 메뉴에서 WatchKit App을 선택하고 Apple Watch와 쌍을 이루는 iPhone 시뮬레이터를 선택하면 됩니다.

![img19](https://cphinf.pstatic.net/mooc/20171229_126/1514527561518XcXxv_PNG/44_19.png?type=w760)

애플리케이션 빌드에 성공하면 시뮬레이터가 실행되고 애플리케이션이 실행됩니다.
macOS 애플리케이션을 실행하는 경우 따로 시뮬레이터가 실행되지 않고 바로 해당 애플리케이션이 실행됩니다

![img20](https://cphinf.pstatic.net/mooc/20171229_106/1514527595706GcQ2C_PNG/44_20.png?type=w760)

그리고 시뮬레이터의 "Hardware"를 선택해서 실제 사용자 작업 (iOS 기기를 회전하거나 흔들기 등)을 시뮬레이션할 수 있습니다.

![img14](https://cphinf.pstatic.net/mooc/20171229_297/1514527443312FlehM_PNG/44_14.png?type=w760)

Wi-Fi를 통해서도 iOS 기기에서 애플리케이션을 실행할 수 있습니다.
먼저 케이블로 Mac과 iOS 기기를 연결하고 Xcode의 Window > Devices and Simulators 메뉴를 선택하거나 Command + Shift + 2 단축키를 입력하면 위의 창이 나옵니다. "Connect via network"를 체크 한 뒤 케이블 제거 후 실행하면 됩니다. 단, 동일한 네트워크 환경에서만 가능합니다.

애플리케이션이 성공적으로 시작되면, Xcode는 에디터(Editor) 아래의 디버그 영역(Debug area)에서 현재 상태를 볼 수 있습니다. 애플리케이션과 디버그를 종료하려면 툴바(Toolbar)에서 실행 버튼 옆에 있는 "Stop" 버튼을 클릭합니다.

***
### 공식문서 링크
- [애플공식문서_Xcode](https://developer.apple.com/xcode/)
- [애플공식문서_Xcode Help](https://help.apple.com/xcode/mac/current/)

### 참고
- [부스트코스](https://www.boostcourse.org/mo326?type=stay)
