//
//  CatergoryTableViewController.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/17/22.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}// End of Class

extension CategoryTableViewController: CategoryViewModelDelegate {
    func fetchCategoriesSuccessfully() {
        tableView.reloadData()
    }
    
    
}
