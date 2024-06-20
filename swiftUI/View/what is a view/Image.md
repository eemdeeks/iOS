# Image
공식문서 :
     A view that displays an image

간단하게 화면에 이미지를 보여주는 뷰이다.

## Declaration
```swift
@frozen struct Image
```

## Overview
```swift
Image("eemdeeks")
```
Image를 SwiftUI앱에서 보여줄 때 사용 할 수 있다.
- 앱의 asset library나 bundle에 있는 파일을 사용할 수 있다.(PNG,JPG,HEIC 등등 사용가능.)
- 

### resizable(capInsets:resizingMode:)
이미지의 크기를 조절할 수 있도록 해준다. 사용하지 않는 다면 이미지 원래의 크기에 고정된다.
```swift
Image("eemdeeks")
    .resizable()
```

### aspectRatio( :contentMode:)
이미지의 가로, 새로 비율을 고정하여 크기를 조정하게 도와준다.
ex)
```swift
Image("eemdeeks")
    .resizable()
    .aspectRatio(contentMode: .fit)
```

### renderingMode(_:)
Image의 rendering방식을 결정해준다.
```swift
Image("eemdeeks")
    .renderingMode(.original)
```
원본, 템플릿, 시스템 설정에 따라서 rendering방식을 결정해 줄 수 있다.

### scaledToFit()
Image가 상위 뷰 안에 완전히 들어갈 수 있도록 축소된다.(이 과정에서 가로,새로 비율이 유지된다.)
```swift
Image("eemdeeks")
    .scaledToFit()
```
### scaledToFill
Image가 상위 뷰를 완전히 채우며 들어간다.(필요한 경우 가로, 새로 비율의 변경이 가능하다.)
```swift
Image("eemdeeks")
    .scaledToFill()
```
***
- [애플 공식문서_Image](https://developer.apple.com/documentation/swiftui/image) 
