//
//  MealListTableViewController.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/18/22.
//

import UIKit

class MealListTableViewController: UITableViewController {
    
    var viewModel: MealListViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchMealList()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.mealList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as? MealListTableViewCell else { return UITableViewCell() }
        let meal = viewModel.mealList[indexPath.row]
        cell.meal = meal
        
        return cell
    }
    
    // TODO: didSelectRowAt for our recipe detail view
    
    func setViewModel(using catString: String) {
        self.viewModel = MealListViewModel(catString: catString, delegate: self)
    }
    
}// End of Class

extension MealListTableViewController: MealListViewModelDelegate {
    func fetchMealListSuccessfully() {
        tableView.reloadData()
    }
}
