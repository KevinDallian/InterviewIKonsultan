//
//  MainView.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel(users: [User(userId: "1", id: "1", title: "Title 1", body: "Body"),
                                                       User(userId: "1", id: "2", title: "123", body: "Body"),
                                                       User(userId: "1", id: "3", title: "Ear", body: "Body")])
    var body: some View {
        VStack{
            SearchBar(searchString: $viewModel.searchString)
            ForEach(viewModel.filteredUser) { user in
                NavigationLink {
                    DetailView(viewModel: DetailViewModel(user: user))
                } label: {
                    ChildComponent(title: user.title)
                }
            }
            .onChange(of: viewModel.searchString) { _,_ in
                viewModel.searchUser()
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    MainView()
}
