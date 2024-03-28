//
//  ChildComponent.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import SwiftUI

struct ChildComponent: View {
    var title : String
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    ChildComponent(title: "Hello World")
}
