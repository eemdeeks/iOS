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
                ForEach(1..<7) { level in
                    let num = level * 4
                    HStack{
                        ForEach(num-4..<num, id: \.self) { index in
                            Button{
                                viewModel.inputKorean(text: hangle[index])
                            }label: {
                                KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[index],text: hangle[index])
                            }
                        }
                    }
                }
                
                HStack{
                    // MARK: - 확인 버튼
                    Button{
                        viewModel.compareAnswer()
                    } label: {
                        ZStack{
                            Image("blank")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.size.width/5, height: UIScreen.main.bounds.size.width/10)
                            Text("OK")
                        }
                    }
                    .alert("Good job!",isPresented: $viewModel.answerBool) {
                        Button("OK", role: .cancel){}
                    }
                    .alert(isPresented: $viewModel.wrongBool){
                        Alert(title: Text("You're wrong!!"), message: Text("The answer is \"\(viewModel.myAnswer.answer.answerString)\"!!"),
                              dismissButton: .default(Text("OK")))
                    }
                    // MARK: - 삭제 버튼
                    Button{
                        viewModel.deleteAnswer()
                    } label: {
                        ZStack{
                            Image("blank")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.size.width/5, height: UIScreen.main.bounds.size.width/10)
                            Text("delete")
                        }
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
    var frameSize : CGFloat = UIScreen.main.bounds.size.width/10
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
            Text(text)
                .foregroundColor(.black)
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
        }
    }
}
