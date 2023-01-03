//
//  ListView.swift
//  SwiftUILearning
//
//  Created by Erik on 01.01.2023.
//

import SwiftUI

struct ListView: View {
    @State var position = CGPoint(x: 100, y: 100)
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.purple)
            .frame(width: 150, height: 150)
            .position(position)
            .gesture(
                DragGesture()
                    .onChanged({ pos in
                        self.position = pos.location
                    })
            )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
