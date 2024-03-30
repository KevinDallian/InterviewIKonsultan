//
//  User.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import Foundation

struct User : Codable, Identifiable {
    let userId: Int
    let id : Int
    let title : String
    let body : String
}
