//
//  talkView.swift
//  testMC1
//
//  Created by 박승찬 on 2023/03/25.
//

import SwiftUI

struct TalkView: View {
    @State var talkText = ["안녕 난 딴이야","만나서 반가워","그럼 다음에 또 만나"]
    @State var skipText = "> 클릭하여 대화 진행"
    @State var talkIndex = 0
    var body: some View {
        VStack{
                
            HStack{
                Spacer()
                Text(talkText[talkIndex])
                Spacer()
                Image("ddan").resizable().frame(width: 200, height: 200)
            }.border(Color.gray)
            HStack{
                Spacer()
                Text(skipText)
                    .font(.caption)
                    .padding(.horizontal)
            }
        
        }.padding()
            .onTapGesture {
                if talkIndex < 2{
                    talkIndex += 1
                }
                if talkIndex == 2{
                    skipText = "SKIP을 클릭해주세요"
                }
            }
    }
        
    
}

struct TalkView_Previews: PreviewProvider {
    static var previews: some View {
        TalkView()
    }
}
