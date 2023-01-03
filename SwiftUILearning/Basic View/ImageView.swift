//
//  ImageView.swift
//  SwiftUILearning
//
//  Created by Erik on 31.12.2022.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack() {
            Image(systemName: "apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .HAlign(.trailing)
        }
        .VAlign(.top)
        .HAlign(.leading)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}

extension View {
    func HAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func VAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}
