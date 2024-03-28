//
//  DetailViewModel.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import Foundation

class DetailViewModel : ObservableObject {
    let user : User
    
    init(user: User) {
        self.user = user
    }
}
