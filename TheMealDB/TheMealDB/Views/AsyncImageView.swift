//
//  AsynchImageView.swift
//  TheMealDB
//
//  Created by Jake Haslam on 2/18/22.
//

import UIKit

class AsyncImageView: UIImageView, APIDataProvidable {
    func setImage(using url: URL) {
        perform(URLRequest(url: url)) { [weak self] result in
            DispatchQueue.main.async {
                guard let data = try? result.get() else { return }
                self?.image = UIImage(data: data)
            }
        }
    }
}
