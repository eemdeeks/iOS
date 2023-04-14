//
//  EnglishView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/11.
//

import SwiftUI

struct EnglishView: View {
    
    @ObservedObject var viewModel: EnglishViewModel

    let alpha = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
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
                                viewModel.inputEnglish(text: alpha[index])
                            }label: {
                                EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[index],text: alpha[index])
                            }
                        }
                    }
                }
                HStack{
                    Button{
                        viewModel.inputEnglish(text: "u")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[20], text: "u")
                    }
                    Button{
                        viewModel.inputEnglish(text: "v")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[21], text: "v")
                    }
                    Button{
                        viewModel.inputEnglish(text: "w")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[22], text: "w")
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
                    
                    // MARK: - 입력한 답 모두 지우기 (clear)
                    Button{
                        viewModel.cleanText()
                    } label: {
                        Image(systemName: "clear")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.size.width/12, height: UIScreen.main.bounds.size.width/12)
                    }
                    
                }
                HStack{
                    Button{
                        viewModel.inputEnglish(text: "x")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[23], text: "x")
                    }
                    Button{
                        viewModel.inputEnglish(text: "y")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[24], text: "y")
                    }
                    Button{
                        viewModel.inputEnglish(text: "z")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[25], text: "z")
                    }
                    // MARK: - 확인 버튼 (return)
                    Button{
                        viewModel.compareAnswer()
                    } label: {
                        Image(systemName: "return")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.size.width/12, height: UIScreen.main.bounds.size.width/12)
                    }
                    .alert("Good job!",isPresented: $viewModel.answerBool) {
                        Button("OK", role: .cancel){}
                    }
                    .alert(isPresented: $viewModel.wrongBool){
                        Alert(title: Text("You're wrong!!"), message: Text("The answer is \"\(viewModel.myAnswer.answer.answerString)\"!!"),
                              dismissButton: .default(Text("OK")))
                    }
                    
                    // MARK: - 모두 초기화 (refresh)
                    Button {
                        viewModel.refreshBtn()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.size.width/12, height: UIScreen.main.bounds.size.width/12)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.size.width/2)
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
    var frameSize : CGFloat = UIScreen.main.bounds.size.width/12
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                //.scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(width: frameSize, height: frameSize)
            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 40))
        }
    }
}
