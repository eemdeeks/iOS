//
//  HelperView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/19.
//

import SwiftUI

struct HelperView: View {
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                Group{
                    Text("How to Study")
                        .font(.custom(.dovemayo, size: 60))
                    Text("You have to guess the answer to the question.The question is like a vocabulary test.")
                        .font(.custom(.dovemayo, size: 25))
                    Spacer()
                    Text("If you select a problem from the list,")
                        .font(.custom(.dovemayo, size: 25))
                    Text("the problem is given in the largest letter at the top, for example :")
                        .font(.custom(.dovemayo, size: 25))
                    Text("봄")
                        .font(.custom(.dovemayo, size: 50))
                }
                
                
                HStack{
                    ForEach(0..<6){ _ in
                        BlankImage(imageName: "textField",text: "",frameSize: geo.size.width/10)
                    }
                }
                Text("When you type in the answer you have in mind,")
                    .font(.custom(.dovemayo, size: 25))
                Text("the color of the word box changes to show how close you are.")
                    .font(.custom(.dovemayo, size: 25))
                HStack{
                    BlankImage(imageName: "correct",text: "s",frameSize: geo.size.width/10)
                    BlankImage(imageName: "wrong",text: "u",frameSize: geo.size.width/10)
                    BlankImage(imageName: "wrong",text: "m",frameSize: geo.size.width/10)
                    BlankImage(imageName: "wrong",text: "m",frameSize: geo.size.width/10)
                    BlankImage(imageName: "wrong",text: "e",frameSize: geo.size.width/10)
                    BlankImage(imageName: "similar",text: "r",frameSize: geo.size.width/10)
                }
                ZStack{
                    Image("grayField")
                        .resizable()
                        .frame(width: geo.size.width*2/3,height: geo.size.width/4)
                    HStack{
                        Spacer()
                        Text("Scroll up!!")
                            .font(.custom(.dovemayo, size: 18))
                            .padding()
                    }
                    VStack{
                        HStack{
                            HelperImage(imageName: "wrong", text: "u",frameSize: geo.size.width/20)
                            Text(",")
                                .font(.custom(.dovemayo, size: 18))
                            HelperImage(imageName: "wrong", text: "m",frameSize: geo.size.width/20)
                            Text(",")
                                .font(.custom(.dovemayo, size: 18))
                            HelperImage(imageName: "wrong", text: "e",frameSize: geo.size.width/20)
                            Text("aren't in the correct answer word at all.")
                                .font(.custom(.dovemayo, size: 18))
                            Spacer()
                        }
                        HStack{
                            HelperImage(imageName: "similar", text: "r",frameSize: geo.size.width/20)
                            Text("is in the word but in the wrong spot.")
                                .font(.custom(.dovemayo, size: 18))
                            Spacer()
                        }
                        HStack{
                            HelperImage(imageName: "correct", text: "s",frameSize: geo.size.width/20)
                            Text("is in the word and in the correct spot.")
                                .font(.custom(.dovemayo, size: 18))
                            Spacer()
                        }
                    }
                    .offset(x: UIScreen.main.bounds.size.width/5)
                }
                
                Group{
                    Text("You have six chances to find the correct word.")
                        .font(.custom(.dovemayo, size: 25))
                    HStack{
                        BlankImage(imageName: "correct",text: "s",frameSize: geo.size.width/10)
                        BlankImage(imageName: "correct",text: "p",frameSize: geo.size.width/10)
                        BlankImage(imageName: "correct",text: "r",frameSize: geo.size.width/10)
                        BlankImage(imageName: "correct",text: "i",frameSize: geo.size.width/10)
                        BlankImage(imageName: "correct",text: "n",frameSize: geo.size.width/10)
                        BlankImage(imageName: "wrong",text: "t",frameSize: geo.size.width/10)
                    }
                    Text("So close!")
                        .font(.custom(.dovemayo, size: 25))
                    HStack{
                        BlankImage(imageName: "correct",text: "s",frameSize: geo.size.width/10)
                        BlankImage(imageName: "correct",text: "p",frameSize: geo.size.width/10)
                        BlankImage(imageName: "correct",text: "r",frameSize: geo.size.width/10)
                        BlankImage(imageName: "correct",text: "i",frameSize: geo.size.width/10)
                        BlankImage(imageName: "correct",text: "n",frameSize: geo.size.width/10)
                        BlankImage(imageName: "correct",text: "g",frameSize: geo.size.width/10)
                    }
                    Text("You are right!")
                        .font(.custom(.dovemayo, size: 30))
                    
                    Divider()
                }
                Group{
                    Text("About the Button")
                        .font(.custom(.dovemayo, size: 50))
                    ZStack{
                        Image("enter")
                        Text("Enter")
                            .font(.custom(.dovemayo, size: 40))
                            .foregroundColor(.black)
                    }
                    Text("Use this button to enter answers.")
                        .font(.custom(.dovemayo, size: 25))
                    Text("If there is a space in the answer, it cannot be used.")
                        .font(.custom(.dovemayo, size: 25))
                    
                    Image("delete")
                    Text("This button is backspace.")
                        .font(.custom(.dovemayo, size: 25))
                    Text("You can use this button if you want to erase only one word.")
                        .font(.custom(.dovemayo, size: 25))
                }
                Group{
                    ZStack{
                        Image("deleteAll")
                            .resizable()
                            .scaledToFit()
                            .frame(height: geo.size.width/15)
                        Text("Delete All")
                            .font(.custom(.dovemayo, size: 40))
                            .foregroundColor(.black)
                    }
                    Text("Use this button to clear answers.")
                        .font(.custom(.dovemayo, size: 25))
                    Text("Press this button to erase the answers you are writing.")
                        .font(.custom(.dovemayo, size: 25))
                    Image("refresh")
                    Text("This button is a refresh button.")
                        .font(.custom(.dovemayo, size: 25))
                    Text("Please press this button if you want to solve the problem again.")
                        .font(.custom(.dovemayo, size: 25))
                    Divider()
                    Text("Let's go solve the problem!")
                        .font(.custom(.dovemayo, size: 50))
                    Text("Please press the menu button at the top left.")
                        .font(.custom(.dovemayo, size: 30))
                         
                }
            }
            .padding()
        }
    }
}

struct HelperView_Previews: PreviewProvider {
    static var previews: some View {
        HelperView()
    }
}
struct HelperImage: View {
    var imageName: String
    var text: String
    var frameSize : CGFloat
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
            Text(text)
                .font(.custom(.dovemayo, size: 20))
                .offset(x:-4,y:-4)
                .foregroundColor(.black)
        }
    }
}
