//
//  TextView.swift
//  SwiftUILearning
//
//  Created by Erik on 31.12.2022.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundColor(.brown)
            .bold()
            .font(.system(.largeTitle))
            .fontWeight(.heavy)
            .italic()
            .shadow(color: .black, radius: 10, x: 0, y: 10)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
