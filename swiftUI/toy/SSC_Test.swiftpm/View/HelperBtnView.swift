//
//  HelperBtnView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/20.
//

import SwiftUI

struct HelperBtnView: View {
    var body: some View {
        Text("")
        Text("About the Button")
            .font(.custom(.dovemayo, size: 60))
        ZStack{
            Image("enter")
            Text("Enter")
                .font(.custom(.dovemayo, size: 40))
                .foregroundColor(.black)
        }
    }
}

struct HelperBtnView_Previews: PreviewProvider {
    static var previews: some View {
        HelperBtnView()
    }
}
