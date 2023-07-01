# WeatherKit


## 소개
- WeatherKit의 기본적인 기능 구현을 익히는 데에 도움을 주기
- WeatherKit에 어떤 날씨 데이터들이 포함되어 있는지 알 수 있습니다.
- WeatherKit을 처음 활용해 보는 경우, 이 프로젝트의 코드를 보면 도움이 됩니다.
- WeatherKit은 SwiftUI와 UIKit 모두에서 사용 가능하지만 이 프로젝트에서는 SwiftUI를 사용했습니다.


## WeatherKit이란?
일일 예보 및 시간별 날씨 상태에 대한 여러가지 데이터들을 포함한 날씨 정보를 제공하는 프레임워크입니다. 

## WeatherKit을 고안한 이유 
정확한 기상 데이터는 변화하는 기후에 영향을 받는 요즘 세상에 더욱 결정적인 요소가 되었습니다.

정확한 예보를 확보하는 일은 그 어느 때보다 지금 중요하기 때문에 고안했죠.

## 작동
- Powered by Apple Weather Service
- High-resolution weather models
- Machine learning and prediction algorithms
- Hyperlocal weather forecasts around the globe

## Available datasets
- Current weather
    현재 날씨 데이터는 요청 지역의 지금 날씨 상태를 알려줍니다.
    
    <details>
        <summary>ex) 포함된 날씨 데이터들</summary>
        
    - Apparent temperature
    - Cloud cover
    - Condition
    - Dew point
    - Humidity
    - Pressure
    - Pressure trend
    - Temperature
    - UV index
    - Visibility
    - Wind direction
    - Wind gust
    - Wind speed
    </details>
    
- Minute forecast
    다음 한 시간 동안 강수 상태가 1분단위로 알려줍니다.
    
    이 데이터는 외출할 때 우산을 챙겨 가야 하는지 결정하는 데 유용합니다.
    
    <details>
        <summary>ex)</summary>
        
    - Precipitation chance
    - Precipitation intensity
    </details>
    
- Hourly forecast
    최대 240시간에 대한 데이터를 제공하는 시간단위 예보입니다.
    
    <details>
        <summary>ex) 각 시간에 포함되는 날씨 데이터들</summary>
        
    - Apparent temperature
    - Cloud cover
    - Condition
    - Dew point
    - Humidity
    - Pressure
    - Pressure trend
    - Temperature
    - UV index
    - Visibility
    - Wind direction
    - Wind gust
    - Wind speed
    </details>
    
- Daily forecast
    10일간의 예보들이 포함되어 있는 일일 예보데이터입니다.
    
    <details>
        <summary>ex) 하루 전체의 정보를 아래의 데이터를 포함하여 제공합니다.</summary>
    
    - High temperature
    - Low temperature
    - Moon phase
    - Moonset
    - Precipitation amount
    - Snowfall amount
    - Sunrise
    - Sunset
    - Wind direction
    </details>
    
- Weather alerts
    해당 지역의 심각한 기상이변을 알려줍니다.
    
    <details>
        <summary>ex) 사용자들이 위험을 인식, 준비할 수 있게 해주는 정보들을 제공합니다.</summary>
        
    - Region
    - Severity
    - Source
    - Summary
    </details>
    
- Historical weather
    과거의 저장된 예보를 제공하여 기상정보의 동향을 살필 수 있습니다.
    
    매 시간과 일일 요청에 시작과 종료 일자를 지정하는 방식으로 접근할 수 있습니다.
    
    <details>
        <summary>ex) 중요하고 영향력이 강한 과거 날씨를 알면 중요하게 활용될 여지도 있습니다.</summary>
        
    - Apparent temperature
    - Cloud cover
    - Condition
    - Dew point
    - Humidity
    - Pressure
    - Pressure trend
    - Temperature
    - UV index
    - Visibility
    - Wind direction
    - Wind gust
    - Wind speed
    - High temperature
    - Low temperature
    - Moon phase
    - Moonset
    - Precipitation amount
    - Snowfall amount
    - Sunrise
    - Sunset
    - Wind direction
    ...
    </details>
    

- UV index
- Humidity
- pressure
- Moonset Precipitation chance
- 등등



## Privacy
정확한 기상 데이터는 지역 정보를 필요로 합니다. 그리고 그 데이터를 보호하는 일은 중요하죠.

WeahterKit은 사용자 정보를 안전하게 사용하여 근접지역의 예보를 전달하도록 설계되었습니다.

- Location used only for weather forecasts
- No personally identifying information
- Never shared or sold


## 핵심 코드
API를 통해 데이터들을 요청하는 방법을 확인하세요.

Apple Weather data는 네이티브 프레임워크와 Rest API를 통해 이용가능해요.

### 데이터에 접근하는 방식 (WeatherKit Native Framework)
```swift
// Request the weather

import WeatherKit
import CoreLocation

let weatherService = WeatherService()

let syracuse = CLLocation(latitude: 43, longitude: -76) // 위도와 경도를 이용해서 CLLocation 위치 따옵니다.

let weather = try! await weatherService.weather(for: syracuse) // weatherService에 weather(for:)을 불러와서 위의 위치를 전달합니다.

// weather를 호출 하고 나면 바로 날씨데이터에 접근할 수 있습니다.
let temperature = weather.currentWeather.temperature // 현재 기온
let uvIndex = weather.currentWeather.uvIndex // 자외선 지수
```

### API 접근으로 데이터 가져오기 (WeahterKit REST API)
API 접근을 하기 위해서는 인증 처리단계가 몇가지 필요합니다.

-> Developer 싸이트에서 활성화된 인증 키를 만드는 방식으로 인증을 해야합니다.

```swift
// Request weather alerts

// Request a token
const tokenResponse = await fetch('https://example.com/token');
const token = await tokenResponse.text();

// Get my weather object
const url = "https://weatherkit.apple.com/1/weather/en-US/41.029/-74.642?dataSets=weatherAlerts&country=US"
// URL 만들기
// 언어 설정/위도/경도?원하는 데이터 설정(복수형태도 가능하다. ,를 이용하여 분리)&요청국가번호

const wetherResponse = await fetch(url, {
    headers: {
        "Authorization": token  
    }
});
const weather = await weatherResponse.json();

// Check for active weahter alerts
const alerts = weather.weatherAlerts;
const detailsUrl = weather.weatherAlerts.detailsUrl;
```

## Publishing reguirements
배포를 하기위한 요건들
- Required for both Swift and REST API
- Display active link to attribution
- Display Apple Weather logo
- Provide link to Weather alert attribution

***
## 참고 문서
- [Meet WeatherKit_WWDC2022](https://developer.apple.com/videos/play/wwdc2022/10003/)
- [WeatherKit_AppleDocument](https://developer.apple.com/documentation/WeatherKit)
