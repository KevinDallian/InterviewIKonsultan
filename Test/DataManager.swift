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
                  let decoder = JSONDecoder()
                  do {
                      let jsonData = try decoder.decode([User].self, from: data)
                      completion(.success(jsonData))
                  }catch let error{
                      completion(.failure(error))
                  }
              }
        }.resume()	
    }
}
