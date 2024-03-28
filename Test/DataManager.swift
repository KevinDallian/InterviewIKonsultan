//
//  DataManager.swift
//  Test
//
//  Created by Kevin Dallian on 28/03/24.
//

import Foundation

extension URLSession {
    func fetchData(at url: URL, completion: @escaping (Result<[User], Error>) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
              if let error = error {
                completion(.failure(error))
              }

              if let data = data {
                do {
                    if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        var userArray : [User] = []
                        for post in jsonArray {
                            if let userId = post["userId"] as? String,
                               let title = post["title"] as? String,
                               let body = post["body"] as? String, let id = post["id"] as? String{
                                let user = User(userId: userId, id: id, title: title, body: body)
                                userArray.append(user)
                            }
                        }
                        completion(.success(userArray))
                    }
                } catch let decoderError {
                  completion(.failure(decoderError))
                }
              }
        }.resume()	
    }
}
