//
//  CircleImage.swift
//  Landmarks
//
//  Created by 박승찬 on 2023/03/21.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("eemdeeks")
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }.shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
