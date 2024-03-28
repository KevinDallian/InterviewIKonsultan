//
//  ContentView.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                MainView()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
