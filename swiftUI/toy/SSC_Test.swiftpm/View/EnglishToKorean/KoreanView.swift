//
//  KoreanView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/05.
//

import SwiftUI

struct KoreanView: View {
    
    @ObservedObject var viewModel: KoreanViewModel
    
    let hangle1 = ["ㅂ","ㅈ","ㄷ","ㄱ","ㅅ","ㅛ","ㅕ","ㅑ"]
    let hangle2 = ["ㅁ","ㄴ","ㅇ","ㄹ","ㅎ","ㅗ","ㅓ","ㅏ","ㅣ"]
    let hangle3 = ["ㅋ","ㅌ","ㅊ","ㅍ","ㅠ","ㅜ","ㅡ"]
    
    var body: some View {
        ZStack{
            Image("line")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .offset(y:-130)
            // MARK: - 문제 나오는 뷰
            VStack{
                Text(viewModel.myAnswer.problem)
                    .font(.system(size: 100))
                // MARK: - 입력한 답이 나오는 뷰
                ForEach(0..<5) { level in
                    HStack{
                        ForEach(0..<6){ index in
                            BlankImage(imageName: viewModel.myAnswer.imageKey[level].key[index],text: viewModel.myAnswer.text[level].text[index])
                        }
                    }
                }
                Spacer()
            }
            VStack{
                Spacer()
                // MARK: - 답을 입력할 수 있는 키보드
                HStack{
                    ForEach(0..<hangle1.count, id: \.self) { index in
                        Button{
                            viewModel.inputKorean(text: hangle1[index])
                        }label: {
                            KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[index],text: hangle1[index])
                        }
                    }
                    // MARK: - 입력한 답 하나 지우기 (backspacebar)
                    Button {
                        viewModel.deleteText()
                    } label: {
                        Image("delete")
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.size.width/12)
                    }
                }
                HStack{
                    ForEach(0..<hangle2.count, id: \.self) { index in
                        Button{
                            viewModel.inputKorean(text: hangle2[index])
                        }label: {
                            KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[index+hangle1.count],text: hangle2[index])
                        }
                    }
                }
                HStack{
                    ForEach(0..<hangle3.count, id: \.self) { index in
                        Button{
                            viewModel.inputKorean(text: hangle3[index])
                        }label: {
                            KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[index+hangle2.count+hangle1.count],text: hangle3[index])
                        }
                    }
                    // MARK: - 확인 버튼
                    Button{
                        viewModel.compareAnswer()
                    } label: {
                        ZStack{
                            Image("enter")
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.size.width/12)
                            Text("Enter")
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
                HStack{
                    // MARK: - 모두 초기화 (refresh)
                    Button {
                        viewModel.refreshBtn()
                    } label: {
                        Image("refresh")
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.size.width/15)
                    }
                    // MARK: - 입력한 답 모두 지우기 (clear)
                    Button{
                        viewModel.cleanText()
                    } label: {
                        ZStack{
                            Image("deleteAll")
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.size.width/15)
                            Text("Delete All")
                        }
                    }
                }
            }
            .offset(y:-100)
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
    var frameSize : CGFloat = UIScreen.main.bounds.size.width/10
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
            Text(text)
                .font(.system(size: 40))
                .offset(x:-8,y:-8)
        }
    }
}
