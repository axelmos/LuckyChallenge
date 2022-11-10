//
//  DetailViewController.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 09/11/2022.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var detailViewModel:DetailProtocol = {
         return DetailViewModel()
    }()
    
    var detailUrl: String? // Not used in this example since the data is loaded by the local json
    
    @IBOutlet weak var imgView: UIImageView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    @IBOutlet weak var brandLabel: UILabel?
    @IBOutlet weak var descriptionTextView: UITextView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    @IBOutlet weak var discountLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var redemptionsLabel: UILabel?
    @IBOutlet weak var favoriteCountLabel: UILabel?
    @IBOutlet weak var favoriteView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation bar
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_btn"), style: .plain, target: self, action: #selector(onBackButtonTap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "fav_off"), style: .plain, target: self, action: #selector(onFavoriteButtonTap))
        
        getDetail()
    }
    
    // MARK:- Class methods
    
    private func getDetail () {
        detailViewModel.getDetail {
            
            if let url = URL.init(string: self.detailViewModel.result.imageUrl) {
                self.imgView?.sd_setImage(with: url, completed: {_,_,_,_ in
                    DispatchQueue.main.async {
                        self.activityIndicator?.stopAnimating()
                    }
                })
            }
            self.brandLabel?.text = self.detailViewModel.result.brand
            self.titleLabel?.text = self.detailViewModel.result.title
            self.favoriteCountLabel?.text = "\(self.detailViewModel.result.favoriteCount)"
            self.descriptionTextView?.text = self.detailViewModel.result.description
            self.priceLabel?.text = self.detailViewModel.result.price
            self.discountLabel?.attributedText = self.detailViewModel.result.discount.strikeThrough()
            self.dateLabel?.text = self.detailViewModel.result.date
            self.redemptionsLabel?.text = self.detailViewModel.result.redemptions
            
        } failure: { error in
            print(error)
        }

    }

    // MARK:- Class methods
    
    @objc private func onBackButtonTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func onFavoriteButtonTap() {
        if navigationItem.rightBarButtonItem?.image == UIImage(named: "fav_off") {
            navigationItem.rightBarButtonItem?.image = UIImage(named: "fav_on")
            animateHeart()
        } else {
            navigationItem.rightBarButtonItem?.image = UIImage(named: "fav_off")
        }
    }

    private func animateHeart() {
        favoriteView?.isHidden = false
        
        UIView.animate(withDuration: 0.1, animations: {
            self.favoriteView?.alpha = 1.0
            self.favoriteView?.transform = self.favoriteView?.transform.scaledBy(x: 0.8, y: 0.8) ?? CGAffineTransform(rotationAngle: .leastNormalMagnitude)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.favoriteView?.transform = CGAffineTransform.identity
            }, completion: { _ in
              UIView.animate(withDuration: 0.6, animations: {
                  self.favoriteView?.alpha = 0
              })
            })
        })
    }
}
