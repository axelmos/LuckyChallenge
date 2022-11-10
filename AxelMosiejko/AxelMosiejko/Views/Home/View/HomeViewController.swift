//
//  HomeViewController.swift
//  AxelMosiejko
//
//  Created by Axel Mosiejko on 08/11/2022.
//

import UIKit

class HomeViewController: UITableViewController {

    lazy var sectionsViewModel:SectionsProtocol = {
         return SectionsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cells
        let cellNib = UINib(nibName: "FoodTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "FoodTableViewCell")
        let headerNib = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        tableView.register(headerNib, forCellReuseIdentifier: "HeaderTableViewCell")
        
        // Navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(onSearchButtonTap))
        
        getOffers()
    }
    
    // MARK:- Class methods
    
    private func getOffers () {
        sectionsViewModel.getOffers {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } failure: { error in
            print(error)
        }
    }
    
    @objc private func onSearchButtonTap() {}

    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsViewModel.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsViewModel.sections[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as? FoodTableViewCell {
            cell.populate(sectionsViewModel.sections[indexPath.section].items[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell {
            cell.titleLabel?.text = sectionsViewModel.sections[section].title
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Layout.Home.cellHeight
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetailSegue", sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue"{
            let detailVC = segue.destination as! DetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                detailVC.detailUrl = sectionsViewModel.sections[indexPath.section].items[indexPath.row].detailUrl
            }
        }
    }
}
