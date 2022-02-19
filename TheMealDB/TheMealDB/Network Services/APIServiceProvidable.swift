//
//  APIServiceProvidable.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/17/22.
//

import Foundation

protocol APIDataProvidable {
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

extension APIDataProvidable {
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.requestError(error)))
            }
            /// Handling our response, this will let us know if our response is successful or if we have an issue and give us info on that failed response
            if let response = response as? HTTPURLResponse {
                dump(response)
            }
            guard let data = data else {
                completion(.failure(.couldNotUnwrap))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

extension Data {
    func decode<T: Decodable>(type: T.Type) -> T? {
        do {
            let object = try JSONDecoder().decode(type, from: self)
            return object
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

extension URL {
    static let baseURL = URL(string: "https://www.themealdb.com/api/json/v1/1")
}
