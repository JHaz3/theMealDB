//
//  MealListTableViewCell.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/19/22.
//

import UIKit

class MealListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealListImageView: AsyncImageView!
    @IBOutlet weak var mealListNameLabel: UILabel!
    
    var meal: Meals? {
        didSet {
            guard let meal = meal else { return }
            self.mealListNameLabel.text = meal.name
            self.fetchImage(with: meal.mealsThumbnail)
        }
    }
    
    private func fetchImage(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.mealListImageView.setImage(using: url)
    }
}
