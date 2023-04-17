//
//  KoreanView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/05.
//

import SwiftUI

struct KoreanView: View {
    
    @ObservedObject var viewModel: KoreanViewModel

    let hangle = ["ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ","ㅅ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ","ㅏ","ㅑ","ㅓ","ㅕ","ㅗ","ㅛ","ㅜ","ㅠ","ㅡ","ㅣ"]
    
    var body: some View {
        HStack{
            VStack{
                // MARK: - 문제 나오는 뷰
                ZStack{
                    Image("blank")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width/14*6)
                    Text(viewModel.myAnswer.problem)
                        .font(.system(size: 100))
                }
                // MARK: - 입력한 답이 나오는 뷰
                ForEach(0..<5) { level in
                    HStack{
                        ForEach(0..<6){ index in
                            BlankImage(imageName: viewModel.myAnswer.imageKey[level].key[index],text: viewModel.myAnswer.text[level].text[index])
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.size.width/2)
            // MARK: - 답을 입력할 수 있는 버튼
            VStack{
                ForEach(1..<5) { level in
                    let num = level * 5
                    HStack{
                        ForEach(num-5..<num, id: \.self) { index in
                            Button{
                                viewModel.inputKorean(text: hangle[index])
                            }label: {
                                KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[index],text: hangle[index])
                            }
                        }
                    }
                }
                
                HStack{
                    // MARK: - 입력한 답 모두 지우기 (clear)
                    Button{
                        viewModel.cleanText()
                    } label: {
                        ZStack{
                            Image(systemName: "clear")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.size.width/12, height: UIScreen.main.bounds.size.width/12)
                        }
                    }
                    Button{
                        viewModel.inputKorean(text: hangle[20])
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[20],text: hangle[20])
                    }
                    Button{
                        viewModel.inputKorean(text: hangle[21])
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[21],text: hangle[21])
                    }
                    // MARK: - 입력한 답 하나 지우기 (backspacebar)
                    Button {
                        viewModel.deleteText()
                    } label: {
                        Image(systemName: "delete.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.size.width/12, height: UIScreen.main.bounds.size.width/12)
                    }
                }
                HStack{
                    // MARK: - 모두 초기화 (refresh)
                    Button {
                        viewModel.refreshBtn()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.size.width/12, height: UIScreen.main.bounds.size.width/12)
                    }
                    Button{
                        viewModel.inputKorean(text: hangle[22])
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[22],text: hangle[22])
                    }
                    Button{
                        viewModel.inputKorean(text: hangle[23])
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[23],text: hangle[23])
                    }
                    // MARK: - 확인 버튼
                    Button{
                        viewModel.compareAnswer()
                    } label: {
                        ZStack{
                            Image(systemName: "return")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.size.width/12, height: UIScreen.main.bounds.size.width/12)
                        }
                    }
                    .alert("Good job!",isPresented: $viewModel.answerBool) {
                        Button("OK", role: .cancel){}
                    }
                    .alert(isPresented: $viewModel.wrongBool){
                        Alert(title: Text("You're wrong!!"), message: Text("The answer is \"\(viewModel.myAnswer.answer.answerString)\"!!"),
                              dismissButton: .default(Text("OK")))
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.size.width/2)
        }
    }
}

struct KoreanView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = KoreanViewModel(myAnswer: .story)
        return KoreanView(viewModel: viewModel)
    }
}
struct KoreanBtnImage: View {
    var imageName: String
    var text: String
    var frameSize : CGFloat = UIScreen.main.bounds.size.width/12
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 40))
        }
    }
}

struct BlankImage: View {
    var imageName: String
    var text: String
    var frameSize : CGFloat = UIScreen.main.bounds.size.width/14
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
            Text(text)
                .font(.system(size: 40))
        }
    }
}
