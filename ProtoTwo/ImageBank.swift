//
//  ImageBank.swift
//  ProtoTwo
//
//  Created by Don on 2016-07-04.
//  Copyright © 2016 Don. All rights reserved.
//

import Foundation
import UIKit

class ImageBank {
    
    //Making a singleton
    static let sharedInstance = ImageBank()

    var goodWolfHead = UIImage()
    var badWolfHead = UIImage()
    var nothingImage = UIImage()
    var quitDayImage = UIImage()
    var quitDayImageGrey = UIImage()
    var smokingNo = UIImage()
    var smokingYes = UIImage()
    var addButton = UIImage()
    var costBen = UIImage()
    var blankImage = UIImage()
    
    
    let wolfHeadSize = CGSize(width: 20,height: 20)
    let buttonSize = CGSize(width: 80,height: 80)
    let addButtonSize = CGSize(width: 20,height: 20)
    

   private init (){
        
        if let tempImage = UIImage(named:"badWolfHead"){
            self.badWolfHead = imageResize(tempImage, sizeChange: wolfHeadSize)
        }
        if let tempImage2 = UIImage(named:"goodWolfHead") {
            self.goodWolfHead = imageResize(tempImage2, sizeChange: wolfHeadSize)
        }
        if let tempImage3 = UIImage(named:"nothing"){
            self.nothingImage = imageResize(tempImage3, sizeChange: wolfHeadSize)
        }
        if let tempImage4 = UIImage(named:"quitDayImage"){
            self.quitDayImage  = imageResize(tempImage4, sizeChange: wolfHeadSize)
        }
        if let tempImage5 = UIImage(named:"quitDayImage-Grey"){
            self.quitDayImageGrey  = imageResize(tempImage5, sizeChange: wolfHeadSize)
        }
        if let tempImage6 = UIImage(named:"smokingYes"){
            self.smokingYes  = imageResize(tempImage6, sizeChange: buttonSize)
        }
        if let tempImage7 = UIImage(named:"smokingNo"){
            self.smokingNo  = imageResize(tempImage7, sizeChange: buttonSize)
        }
        if let tempImage8 = UIImage(named:"addButton"){
        self.addButton  = imageResize(tempImage8, sizeChange: addButtonSize)
        }
        if let tempImage9 = UIImage(named:"cost"){
        self.costBen = imageResize(tempImage9, sizeChange: wolfHeadSize)
        }
        if let tempImage10 = UIImage(named:"blankImage"){
            self.blankImage = imageResize(tempImage10, sizeChange: wolfHeadSize)
    }
    
    }
    func imageResize (image: UIImage, sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    

}
