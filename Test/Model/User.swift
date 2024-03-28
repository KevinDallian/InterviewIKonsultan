//
//  User.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import Foundation

struct User : Codable, Identifiable {
    let userId: String
    let id : String
    let title : String
    let body : String
}
