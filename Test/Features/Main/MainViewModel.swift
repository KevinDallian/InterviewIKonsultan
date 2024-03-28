//
//  MainViewModel.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import Foundation

class MainViewModel: ObservableObject {
    var users : [User]
    @Published var filteredUser : [User] = []
    @Published var searchString : String = ""
    init(users: [User]) {
        self.users = users
        self.filteredUser = users
    }
    
    func searchUser() {
        if searchString == "" {
            filteredUser = users
        } else {
            filteredUser = users.filter({ user in
                user.title.contains(searchString)
            })
        }
        
    }
    
    func fetchData() {
        URLSession.shared.fetchData(at: URL(string: "https://jsonplaceholder.typicode.com/posts")!) { [self] result in
            switch result {
            case .success(let success):
                Task{
                    self.users = success
                    self.objectWillChange.send()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
