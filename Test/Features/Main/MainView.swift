//
//  MainView.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel(users: [])
    var body: some View {
        VStack{
            if viewModel.isLoading {
                EmptyView()
            } else {
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
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    MainView()
}
