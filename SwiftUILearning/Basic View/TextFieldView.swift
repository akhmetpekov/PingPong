//
//  TextFieldView.swift
//  SwiftUILearning
//
//  Created by Erik on 31.12.2022.
//

import SwiftUI

struct TextFieldView: View {
    @State var name: String = ""
    var body: some View {
        TextField(text: $name, prompt: Text("Required").foregroundColor(.blue)) {
            Text("Username")
        }
        .textFieldStyle(.roundedBorder)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
