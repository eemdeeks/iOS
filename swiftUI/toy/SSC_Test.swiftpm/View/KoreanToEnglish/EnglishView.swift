//
//  EnglishView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/11.
//

import SwiftUI

struct EnglishView: View {
    
    @ObservedObject var viewModel: EnglishViewModel

    
    var body: some View {
        HStack{
            VStack{
                ZStack{
                    Image("blank")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width/14*6)
                    Text(viewModel.myAnswer.problem)
                        .font(.system(size: 100))
                }
                HStack{
                    ForEach(0..<6){ index in
                        BlankImage(imageName: viewModel.myAnswer.imageKey[0].key[index],text: viewModel.myAnswer.text[0].text[index])
                    }
                }
                HStack{
                    ForEach(0..<6){ index in
                        BlankImage(imageName: viewModel.myAnswer.imageKey[1].key[index],text: viewModel.myAnswer.text[1].text[index])
                    }
                }
                HStack{
                    ForEach(0..<6){ index in
                        BlankImage(imageName: viewModel.myAnswer.imageKey[2].key[index],text: viewModel.myAnswer.text[2].text[index])
                    }
                }
                HStack{
                    ForEach(0..<6){ index in
                        BlankImage(imageName: viewModel.myAnswer.imageKey[3].key[index],text: viewModel.myAnswer.text[3].text[index])
                    }
                }
                HStack{
                    ForEach(0..<6){ index in
                        BlankImage(imageName: viewModel.myAnswer.imageKey[4].key[index],text: viewModel.myAnswer.text[4].text[index])
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.size.width/2)
            VStack{
                HStack{
                    Button{
                        viewModel.inputEnglish(text: "a")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[0],text: "a")
                    }
                    Button{
                        viewModel.inputEnglish(text: "b")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[1], text: "b")
                    }
                    Button{
                        viewModel.inputEnglish(text: "c")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[2], text: "c")
                    }
                    Button{
                        viewModel.inputEnglish(text: "d")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[3], text: "d")
                    }
                    Button{
                        viewModel.inputEnglish(text: "e")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[4], text: "e")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputEnglish(text: "f")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[5],text: "f")
                    }
                    Button{
                        viewModel.inputEnglish(text: "g")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[6], text: "g")
                    }
                    Button{
                        viewModel.inputEnglish(text: "h")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[7], text: "h")
                    }
                    Button{
                        viewModel.inputEnglish(text: "i")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[8], text: "i")
                    }
                    Button{
                        viewModel.inputEnglish(text: "j")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[9], text: "j")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputEnglish(text: "k")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[10],text: "k")
                    }
                    Button{
                        viewModel.inputEnglish(text: "l")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[11], text: "l")
                    }
                    Button{
                        viewModel.inputEnglish(text: "m")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[12], text: "m")
                    }
                    Button{
                        viewModel.inputEnglish(text: "n")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[13], text: "n")
                    }
                    Button{
                        viewModel.inputEnglish(text: "o")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[14], text: "o")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputEnglish(text: "p")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[15],text: "p")
                    }
                    Button{
                        viewModel.inputEnglish(text: "q")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[16], text: "q")
                    }
                    Button{
                        viewModel.inputEnglish(text: "r")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[17], text: "r")
                    }
                    Button{
                        viewModel.inputEnglish(text: "s")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[18], text: "s")
                    }
                    Button{
                        viewModel.inputEnglish(text: "t")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[19], text: "t")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputEnglish(text: "u")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[20],text: "u")
                    }
                    Button{
                        viewModel.inputEnglish(text: "v")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[21], text: "v")
                    }
                    Button{
                        viewModel.inputEnglish(text: "w")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[2], text: "w")
                    }
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
                    
                }
                HStack{
                    Button{
                        viewModel.inputEnglish(text: "z")
                    }label: {
                        EnglishBtnImage(imageName: viewModel.myAnswer.imageKey[1].btnKey[25], text: "z")
                    }
                    
                    Button {
                        viewModel.refreshBtn()
                    } label: {
                        ZStack{
                            Image(systemName: "textField")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.size.width/12, height: UIScreen.main.bounds.size.width/12)
                            Image(systemName: "arrow.clockwise")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.size.width/16, height: UIScreen.main.bounds.size.width/16)
                        }
                    }
                }
                HStack{
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
                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
            Text(text)
                .foregroundColor(.black)
        }
    }
}
