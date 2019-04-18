//
//  ViewController.swift
//  GoldenScent Test
//
//  Created by Raees on 17/04/19.
//  Copyright © 2019 Raees. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblCategories: UITableView!
    @IBOutlet weak var tblSubCategories: UITableView!
    @IBOutlet weak var imgBanner: UIImageView!
    
    let categories      =   Category.getCategories()
    var selectedCategory:Category!
    
    var bestSellerVcs   =   [BestSellersTableViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCategory        =   categories.first
        updateSubcategoryDetails()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let besetSellerVc    =   segue.destination as? BestSellersTableViewController{
            
            if segue.identifier == "bestsellers_1"{
                bestSellerVcs.insert(besetSellerVc, at: 0)
            }else  if segue.identifier == "bestsellers_2"{
                bestSellerVcs.insert(besetSellerVc, at: 1)
            }else if segue.identifier == "bestsellers_3"{
                bestSellerVcs.insert(besetSellerVc, at: 2)
            }
        }
        
    }
    
    //Mark:- custom functions
    
    /// Update banner, best sellers and sub categories when category selected
    func updateSubcategoryDetails(){
        imgBanner.image     =   selectedCategory.banner
        for index in 0...2{
            bestSellerVcs[index].products   =   selectedCategory.besSellers[index]
        }
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    //Mark:-UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblCategories{
            return categories.count
        }else{
            return selectedCategory.subCategories.count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblCategories{
            let cell        =   tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
            cell.configure(category: categories[indexPath.row])
            return cell
        }else{
            let cell        =   tableView.dequeueReusableCell(withIdentifier: "SubcategoryTableViewCell", for: indexPath) as! SubcategoryTableViewCell
            cell.configure(category: categories[indexPath.row])
            return cell
        }
        
    }
    
    //Mark:-UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewIndicator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle      =   .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imgIcon.alpha           =   selected == true ? 1.0 : 0.5
        lblName.font            =   selected == true ? UIFont.systemFont(ofSize: 15, weight: .medium) : UIFont.systemFont(ofSize: 15, weight: .thin)
        viewIndicator.isHidden  =   !selected
    }
    
    //Mark:- custom functions
    
    /// configure the cell
    ///
    /// - Parameter category: category to configure
    func configure(category:Category){
        imgIcon.image       =   category.icon
        lblName.text        =   category.name
        
    }
}
class SubcategoryTableViewCell: UITableViewCell {
    
    func configure(category:Category){
        
    }
}

