//
//  CategoryTableViewCell.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/18/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryImageView: AsyncImageView!
    
    var category: Category? {
        didSet {
                guard let category = self.category else { return }
                self.categoryNameLabel.text = category.name
                self.fetchImage(with: category.categoryThumbnail)
        }
    }
    
    private func fetchImage(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.categoryImageView.setImage(using: url)
    }
}
