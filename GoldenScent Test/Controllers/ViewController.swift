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
    let categories      =   Category.getCategories()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    //Mark:-UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblCategories{
            return categories.count
        }else{
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell        =   tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        cell.configure(category: categories[indexPath.row])
        return cell
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
