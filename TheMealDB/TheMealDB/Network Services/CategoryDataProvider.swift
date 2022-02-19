//
//  CategoryDataProvider.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/17/22.
//

import Foundation

protocol CategorySearchDataProvidable {
    func fetchCategory(completion: @escaping (Result<[Category], NetworkError>) -> Void)
}

struct CategorySearchDataProvider: APIDataProvidable, CategorySearchDataProvidable {
    func fetchCategory(completion: @escaping (Result<[Category], NetworkError>) -> Void) {
        guard let baseURL = URL.baseURL else { return }
        let categoryURL = baseURL.appendingPathComponent("categories.php")
        perform(URLRequest(url: categoryURL)) { result in
            switch result {
            case .success(let data):
                do {
                    let categoryList = try JSONDecoder().decode(CategoryList.self, from: data)
                    DispatchQueue.main.async { completion(.success(categoryList.categories)) }
                        
                } catch {
                    DispatchQueue.main.async { completion(.failure(.errorDecoding(error))) }
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
