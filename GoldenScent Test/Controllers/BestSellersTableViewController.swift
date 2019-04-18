//
//  BestSellersTableViewController.swift
//  GoldenScent Test
//
//  Created by Raees on 18/04/19.
//  Copyright © 2019 Raees. All rights reserved.
//

import UIKit

class BestSellersTableViewController: UITableViewController {

    var products:[Product]!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BestSellersTableViewCell", for: indexPath) as! BestSellersTableViewCell
        cell.configure(product: products[indexPath.row])
        return cell
    }
}

class BestSellersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var lblOriginalPrice: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle      =   .none
    }
    
    //Mark:- custom functions
    
    /// display the values to cell
    ///
    /// - Parameter product: product
    func configure(product:Product){
        imgIcon.image           =   product.icon
        lblName.text            =   product.name
        lblInfo.text            =   product.info
        
        if let offerPrice = product.offerPrice, let originalPrice = product.originalPrice{
            let attributedString            =   NSMutableAttributedString(string: originalPrice)
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.single.rawValue), range: NSMakeRange(0, attributedString.length))
            attributedString.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor.lightGray, range: NSMakeRange(0, attributedString.length))
            lblOriginalPrice.attributedText =   attributedString
            lblOriginalPrice.textColor      =   UIColor.lightGray
            lblOfferPrice.text              =   offerPrice
        }else{
            lblOriginalPrice.text           =   product.originalPrice ?? product.offerPrice
            lblOfferPrice.text              =   nil
            lblOriginalPrice.textColor      =   UIColor.black
        }
    }
}
