//
//  SecureFieldView.swift
//  SwiftUILearning
//
//  Created by Erik on 31.12.2022.
//

import SwiftUI

struct SecureFieldView: View {
    @State var password: String = ""
    var body: some View {
        SecureField("Hello world", text: $password, prompt: Text("Bitch"))
    }
}

struct SecureFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldView()
    }
}
