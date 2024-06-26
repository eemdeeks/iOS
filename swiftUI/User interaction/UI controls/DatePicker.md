# DatePicker
공식문서 :
     A control for selecting an absolute date.

사용자가 특정 날짜를 선택할 수 있는 인터페이스이다.

## Declaration
```swift
@MainActor @preconcurrency
struct DatePicker<Label> where Label : View
```

## Overview
```swift
@State private var date = Date()

var body: some View {
    DatePicker(
        "Start Date",
        selection: $date,
        displayedComponents: [.date]
    )
}
```
Title을 String으로 지정해 줄 수 있으며, Date값을 갖는 State변수가 필요하다.

위 예시에서 "Start Date"라는 String을 DatePicker의 Title로 지정해 주었고, date라는 State변수를 매개변수로 받고 있다. DatePicker로 시간이나 날짜에 대해 선택하게 되면 date변수에 저장 되는 것이다.

diplayedComponents에 .date나 .hourAndMinute과 같은 값을 넣어 필요한 값들이 보이고 설정 할 수 있도록 할 수 있다.

### DatePickerStyle
총 6개의 datepickerStyle을 통해서 datepicker의 스타일을 정해줄 수 있다.
- compact
- graphical
- wheel
- automatic
- field(macOS)
- stepperField(macOS)

***
- [애플 공식문서_DatePicker](https://developer.apple.com/documentation/swiftui/datepicker) 
