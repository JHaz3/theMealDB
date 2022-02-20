//
//  CatergoryTableViewController.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/17/22.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    // MARK: - Properties
    var viewModel: CategoryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CategoryViewModel(delegate: self)
        viewModel.fetch()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as?
                CategoryTableViewCell else { return UITableViewCell() }
        let category = viewModel.categories[indexPath.row]
        cell.category = category
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CategoryTableViewCell,
        let category = cell.category?.name else { return }
        
        goToMealList(for: category)
    }
    
    func goToMealList(for category: String) {
        let storyboard = UIStoryboard(name: "MealListTableViewController", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? MealListTableViewController else { return }
        vc.setViewModel(using: category)
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}// End of Class

extension CategoryTableViewController: CategoryViewModelDelegate {
    func fetchCategoriesSuccessfully() {
        tableView.reloadData()
    }
}
