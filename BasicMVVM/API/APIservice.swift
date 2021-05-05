//
//  APIservice.swift
//  BasicMVVM
//
//  Created by artjoms.vorona on 05/05/2021.
//

import Foundation

class APIservice {
    func getUserPosts(urlComponents: URLComponents, completion: @escaping ((Result<[Post], Error>) -> Void)) {
        let request = self.makeRequest(url: urlComponents.url!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("APIservice error: ", error)
                completion(.failure(error))
            }
            
            guard let data = data else { return }
            
            if let Posts = try? self.parseResponse(data: data) {
                completion(.success(Posts))
            }
        }.resume()
    }
    
    func makeRequest(url: URL) -> URLRequest {
        return URLRequest(url: url)
    }
    
    func parseResponse(data: Data) throws -> [Post]? {
        do {
            let Posts = try JSONDecoder().decode([Post].self, from: data)
            return Posts
        } catch {
            print("APIService parsing error :", error)
            return nil
        }
    }
}
