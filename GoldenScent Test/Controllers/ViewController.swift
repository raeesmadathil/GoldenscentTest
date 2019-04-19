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
            cell.configure(category: selectedCategory.subCategories[indexPath.row])
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
    
    @IBOutlet weak var constraintCollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintViewAllHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var collViewSubCategories: UICollectionView!
    @IBOutlet weak var btnViewAll: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle      =   .none
    }
    var category:Category!
    var itemPerRow      =   3
    var space:CGFloat   =   10
    var cellSize:CGSize{
        let width   =   (self.frame.width / CGFloat(itemPerRow)) - 2 * space
        let height  =   width + 30
        return CGSize(width: width, height: height)
    }
    
    //Mark:- custom functions
    
    /// Display the values to cell
    ///
    /// - Parameter category: category to display
    func configure(category:Category){
        
        self.category                       =   category
        lblName.text                        =   category.name
        
        btnViewAll.setTitle(("View All " + category.name ), for: .normal)
        
        let toatlItems                      =   CGFloat(category.subCategories.count)
        
        constraintCollViewHeight.constant   =   ((toatlItems / CGFloat(itemPerRow)) * cellSize.height) + ((toatlItems - 1 ) * space)
        contentView.updateConstraints()
        collViewSubCategories.reloadData()
        
    }
    
}

extension SubcategoryTableViewCell:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //Mark:-UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.subCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell    =   collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCollectionViewCell", for: indexPath) as! SubCategoryCollectionViewCell
        cell.configure(category: category.subCategories[indexPath.row])
        return cell
    }
    
    //Mark:-UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
}
class SubCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    //Mark:- custom functions
    
    /// Display the values to cell
    ///
    /// - Parameter category: category to display
    func configure(category:Category){
        lblName.text    =   category.name
        imgIcon.image   =   category.icon
    }
}
