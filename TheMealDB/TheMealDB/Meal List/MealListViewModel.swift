//
//  MealListViewModel.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/18/22.
//

import Foundation

protocol MealListViewModelDelegate: AnyObject {
    func fetchMealListSuccessfully()
}

class MealListViewModel: APIDataProvidable {
    var mealList: [Meals] = []
    let catString: String
    let dataProvider: MealListFetchDataProvidable
    weak var delegate: MealListViewModelDelegate?
    
    init(catString: String,
         delegate: MealListViewModelDelegate,
         dataProvider: MealListFetchDataProvidable = MealListDataProvider()) {
        self.catString = catString
        self.delegate = delegate
        self.dataProvider = dataProvider
    }

    func fetchMealList() {
        dataProvider.fetchMealList(from: catString) { [weak self] result in
            switch result {
            case .success(let mealList):
                self?.mealList = mealList.sorted(by: { $0.name < $1.name })
                self?.delegate?.fetchMealListSuccessfully()
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---/n \(error)")
            }
        }
    }
}
