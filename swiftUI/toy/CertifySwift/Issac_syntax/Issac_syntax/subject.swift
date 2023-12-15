//
//  subject1.swift
//  Issac_syntax
//
//  Created by 박승찬 on 11/7/23.
//

import SwiftUI

struct subject: View {
    @State var direction: Direction = .남
    enum Direction: String, CaseIterable {
        case 동 = "East"
        case 서 = "West"
        case 남 = "South"
        case 북 = "North"
    }

    @State var state: PostType = .글("글입니다")
    enum PostType {
        case 로딩중
        case 글(String)
        case 사진(Data)
        case 영상(URL)
        case 에러(Error)
    }
    var body: some View {
        VStack {
            Picker("Direction", selection: $direction) {
                ForEach(Direction.allCases, id: \.self) { direction in
                    Text(direction.rawValue)
                }
            }
            .onAppear{
                let url = URL(string: "curl https://api.unsplash.com/search/photos?query=poodle")
                var request = URLRequest(url: url ?? <#default value#>)

                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                  if let response = response {
                    print(response)

                    if let data = data, let body = String(data: data, encoding: .utf8) {
                      print(body)
                    }
                  } else {
                    print(error ?? "Unknown error")
                  }
                }

                task.resume()
            }
            switch state {
            case .로딩중:
                Text("로딩중입니다")
            case .글(let string):
                Text("\(string)")
            case .사진(let data):
                Text("사진 데이터: \(data)")
            case .영상(let url):
                Text("영상 url: \(url)")
            case .에러(let error):
                Text("에러: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    subject()
}
