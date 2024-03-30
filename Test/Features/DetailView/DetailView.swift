//
//  DetailView.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import SwiftUI

struct DetailView: View {
    var viewModel : DetailViewModel
    var body: some View {
        VStack{
            Text("User ID : \(viewModel.user.userId)")
            Text("Id : \(viewModel.user.id)")
            Text("Title : \(viewModel.user.title)")
                .multilineTextAlignment(.center)
            Text("Body : \(viewModel.user.body)")
                .multilineTextAlignment(.center)
        }.padding()
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(user: User(userId: 1, id: 1, title: "Title", body: "Body")))
}
