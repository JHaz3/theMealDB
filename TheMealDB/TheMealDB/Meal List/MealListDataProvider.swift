//
//  MealListDataProvider.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/18/22.
//

import Foundation

protocol MealListFetchDataProvidable {
    func fetchMealList(from category: String, completion: @escaping (Result<[Meals], NetworkError>) -> Void)
}

struct MealListDataProvider: APIDataProvidable, MealListFetchDataProvidable {

    func fetchMealList(from category: String, completion: @escaping (Result<[Meals], NetworkError>) -> Void) {
        guard let baseURL = URL.baseURL else { return }
        let filterURL = baseURL.appendingPathComponent("filter")
        let phpURL = filterURL.appendingPathExtension("php")
        
        guard var urlComponents = URLComponents(url: phpURL, resolvingAgainstBaseURL: true) else { return }
        urlComponents.queryItems = [ URLQueryItem(name: "c", value: category) ]
        guard let finalURL = urlComponents.url else { return }
        perform(URLRequest(url: finalURL)) { result in
            switch result {
            case.success(let data):
                do {
                    let mealList = try JSONDecoder().decode(MealList.self, from: data)
                    DispatchQueue.main.async { completion(.success(mealList.meals)) }
                    
                } catch {
                    DispatchQueue.main.async { completion(.failure(.errorDecoding(error))) }
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
