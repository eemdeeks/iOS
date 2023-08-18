//
//  EnglishView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/11.
//

import SwiftUI

struct EnglishView: View {
    
    @ObservedObject var viewModel: EnglishViewModel

    let alpha1 = ["q","w","e","r","t","y","u","i","o","p"]
    let alpha2 = ["a","s","d","f","g","h","j","k","l"]
    let alpha3 = ["z","x","c","v","b","n","m"]
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("background2")
                    .resizable()
                    .ignoresSafeArea()
                // MARK: - 문제 나오는 뷰
                VStack{
                    Text(viewModel.myAnswer.problem)
                        .font(.custom(.dovemayo, size: 80))
                    // MARK: - 입력한 답이 나오는 뷰
                    ForEach(0..<5) { level in
                        HStack{
                            ForEach(0..<6){ index in
                                BlankImage(imageName: viewModel.myAnswer.imageKey[level].key[index],text: viewModel.myAnswer.text[level].text[index],frameSize: geo.size.width/10)
                            }
                        }
                    }
                    Spacer()
                    // MARK: - 답을 입력할 수 있는 키보드
                    HStack{
                        ForEach(0..<alpha1.count, id: \.self) { index in
                            Button{
                                viewModel.inputEnglish(text: alpha1[index])
                            }label: {
                                EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[index],text: alpha1[index], frameSize: geo.size.width/12)
                            }
                        }
                    }
                    HStack{
                        ForEach(0..<alpha2.count, id: \.self) { index in
                            Button{
                                viewModel.inputEnglish(text: alpha2[index])
                            }label: {
                                EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[index+alpha1.count],text: alpha2[index], frameSize: geo.size.width/12)
                            }
                        }
                        // MARK: - 입력한 답 하나 지우기 (backspacebar)
                        Button {
                            viewModel.deleteText()
                        } label: {
                            Image("delete")
                                .resizable()
                                .scaledToFit()
                                .frame(height: geo.size.width/12)
                        }
                    }
                    HStack{
                        ForEach(0..<alpha3.count, id: \.self) { index in
                            Button{
                                viewModel.inputEnglish(text: alpha3[index])
                            }label: {
                                EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[index+alpha2.count+alpha1.count],text: alpha3[index], frameSize: geo.size.width/12)
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
                                    .frame(height: geo.size.width/12)
                                Text("Enter")
                                    .font(.custom(.dovemayo, size: 40))
                                    .foregroundColor(.black)
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
                                .frame(height: geo.size.width/15)
                        }
                        // MARK: - 입력한 답 모두 지우기 (clear)
                        Button{
                            viewModel.cleanText()
                        } label: {
                            ZStack{
                                Image("deleteAll")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: geo.size.width/15)
                                Text("Delete All")
                                    .font(.custom(.dovemayo, size: 40))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct EnglishView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EnglishViewModel(myAnswer: .change)
        return EnglishView(viewModel: viewModel)
    }
}

struct EnglishBtnImage: View {
    var imageName: String
    var text: String
    var frameSize : CGFloat
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                //.scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(width: frameSize, height: frameSize)
            Text(text)
                .foregroundColor(.black)
                .font(.custom(.dovemayo, size: 40))
        }
    }
}
