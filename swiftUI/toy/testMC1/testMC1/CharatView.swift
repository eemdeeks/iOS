//
//  CharatView.swift
//  testMC1
//
//  Created by 박승찬 on 2023/03/25.
//

import SwiftUI

struct CharatView: View {
    var name: String
    var body: some View {
        
        Image(name).resizable().frame(width: 100, height: 100)
    }
}

struct CharatView_Previews: PreviewProvider {
    static var previews: some View {
        CharatView(name: "ddan")
    }
}
