//
//  Category.swift
//  GoldenScent Test
//
//  Created by Raees on 17/04/19.
//  Copyright © 2019 Raees. All rights reserved.
//

import UIKit

class Category: NSObject {

    var name:String!
    var icon:UIImage!
    var banner:UIImage!
    var besSellers:[[Product]]!
    var subCategories:[Category]!
    
    
    //Mark:- custom functions
    
    /// To get dummy categories
    ///
    /// - Returns: array of categories
    class func getCategories()->[Category]{
        
        let makeup              =   Category()
        makeup.name             =   "Makeup"
        makeup.icon             =   UIImage(named: "icon_makeup")
        makeup.banner           =   UIImage(named: "banner_makeup")
        
        let prada               =   Product()
        prada.name              =   "PRADA"
        prada.info              =   "Candy"
        prada.icon              =   UIImage(named: "icon_prada")
        prada.offerPrice        =   "320 SR"
        prada.originalPrice     =   "356 SR"
        
        let dolce               =   Product()
        dolce.name              =   "DOLCE & GABBANA"
        dolce.info              =   "The One and text goes until it"
        dolce.icon              =   UIImage(named: "icon_dolce")
        dolce.offerPrice        =   "356 SR"
        
        let aigner              =   Product()
        aigner.name             =   "AIGNER"
        aigner.info             =   "N. I"
        aigner.icon             =   UIImage(named: "icon_aigner")
        aigner.offerPrice       =   "356 SR"
        
        var besSellers          =   [[Product]]()
        for _ in 0...3{
            besSellers.append([prada,dolce,aigner])
        }
        makeup.besSellers       =   besSellers
        
        let pencil              =   Category()
        pencil.name             =   "Pencils"
        pencil.icon             =   UIImage(named: "icon_pencil")
        
        let lipstick            =   Category()
        lipstick.name           =   "Lipstick"
        lipstick.icon           =   UIImage(named: "icon_lipstic")
        
        let lipgloss            =   Category()
        lipgloss.name               =   "Lipgloss"
        lipgloss.icon           =   UIImage(named: "icon_lipgloss")
        
        let lipbalm             =   Category()
        lipbalm.name            =   "Lip Balm"
        lipbalm.icon            =   UIImage(named: "icon_lipbalm")
        
        let treatment           =   Category()
        treatment.name          =   "Treatment"
        treatment.icon          =   UIImage(named: "icon_treatment")
        
        let palette             =   Category()
        palette.name            =   "Palette"
        palette.icon            =   UIImage(named: "icon_palette")
        
        let lips                =   Category()
        lips.name               =   "Lips"
        lips.subCategories      =   [pencil,lipstick,lipgloss,lipbalm,treatment,palette]
        
        let face                =   Category()
        face.name               =   "Face"
        face.subCategories      =   [pencil,lipstick,lipgloss,lipbalm,treatment,palette]
        
        let nails               =   Category()
        nails.name              =   "Nails"
        nails.subCategories     =   [pencil,lipstick,lipgloss,lipbalm,treatment,palette]
        
        makeup.subCategories    =   [lips,face,nails]
        
        
        let skinCare            =   Category()
        skinCare.name           =   "Skincare"
        skinCare.icon           =   UIImage(named: "icon_skincare")
        skinCare.banner         =   UIImage(named: "banner_makeup")
        skinCare.besSellers     =   besSellers
        skinCare.subCategories  =   [lips,face,nails]
        
        let hairCare            =   Category()
        hairCare.name           =   "Haircare"
        hairCare.icon           =   UIImage(named: "icon_haircare")
        hairCare.banner         =   UIImage(named: "banner_makeup")
        hairCare.besSellers     =   besSellers
        hairCare.subCategories  =   [lips,face,nails]
        
        let beautyTools         =   Category()
        beautyTools.name        =   "Beauty Tools"
        beautyTools.icon        =   UIImage(named: "icon_beautytools")
        beautyTools.banner      =   UIImage(named: "banner_makeup")
        beautyTools.besSellers  =   besSellers
        beautyTools.subCategories  =   [lips,face,nails]
        
        let homeFrag            =   Category()
        homeFrag.name           =   "Home Fragrances"
        homeFrag.icon           =   UIImage(named: "icon_homefrag")
        homeFrag.banner         =   UIImage(named: "banner_makeup")
        homeFrag.besSellers     =   besSellers
        homeFrag.subCategories  =   [lips,face,nails]
        
        let gift                =   Category()
        gift.name               =   "Gift"
        gift.icon               =   UIImage(named: "icon_gifts")
        gift.banner             =   UIImage(named: "banner_makeup")
        gift.besSellers         =   besSellers
        gift.subCategories      =   [lips,face,nails]
        
        let men                 =   Category()
        men.name                =   "Men"
        men.icon                =   UIImage(named: "icon_men")
        men.banner              =   UIImage(named: "banner_makeup")
        men.besSellers          =   besSellers
        men.subCategories       =   [lips,face,nails]
        
        return [makeup,skinCare,hairCare,beautyTools,homeFrag,gift,men]
    }
}
