//
//  MainViewModel.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var users : [User]
    @Published var filteredUser : [User] = []
    @Published var searchString : String = ""
    @Published var isLoading : Bool = true
    
    init(users: [User]) {
        self.users = users
        self.filteredUser = users
    }
    
    func searchUser() {
        if searchString == "" {
            filteredUser = users
        } else {
            filteredUser = users.filter({ user in
                user.title.lowercased().contains(searchString.lowercased())
            })
        }
        
    }
    
    func fetchData() {
        self.isLoading = true
        URLSession.shared.fetchData(at: URL(string: "https://jsonplaceholder.typicode.com/posts")!) { [self] result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                    self.filteredUser = users
                    self.isLoading = false
                    self.objectWillChange.send()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
