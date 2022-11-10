//
//  FoodTableViewCell.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 09/11/2022.
//

import UIKit
import SDWebImage

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    @IBOutlet weak var brandLabel: UILabel?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var tagLabel: UILabel?
    @IBOutlet weak var favoriteCountLabel: UILabel?
    
    func populate(_ food: Food) {
        if let url = URL.init(string: food.imageUrl) {
            imgView?.sd_setImage(with: url, completed: {_,_,_,_ in
                DispatchQueue.main.async {
                    self.activityIndicator?.stopAnimating()
                }
            })
        }
        brandLabel?.text = food.brand.uppercased()
        titleLabel?.text = food.title
        tagLabel?.text = food.tags
        favoriteCountLabel?.text = "\(food.favoriteCount)"
    }
}

