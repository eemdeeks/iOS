//
//  FirstView.swift
//  testMC1
//
//  Created by 박승찬 on 2023/03/25.
//

import SwiftUI

struct FirstView: View {
    var name: [String] = ["ddan2","byo","theo"]
    var name2: [String] = ["ddan2","byo","theo"].reversed()
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ForEach(name2, id: \.self) { name in
                        NavigationLink{
                            SecondView()
                        } label:{
                            CharatView(name: name)
                        }
                    }
                }
                HStack{
                    ForEach(name, id: \.self) { name in
                        NavigationLink{
                            SecondView()
                        } label:{
                            CharatView(name: name)
                        }
                    }
                }
                Image("ADA MAP")
                    .resizable()
                    //.frame(height: UIScreen.main.bounds.height+50)
                    .offset(y: 50)
            }
        }
        
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
