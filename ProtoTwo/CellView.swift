//
//  CellView.swift
//  ProtoTwo
//
//  Created by Don on 2016-07-04.
//  Copyright © 2016 Don. All rights reserved.
//

import Foundation
import JTAppleCalendar
import UIKit

class CellView: JTAppleDayCellView {
    
     var todayColor  = UIColor(hue: 0.5083, saturation: 1, brightness: 0.91, alpha: 1.0)
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var wolfImage: UIImageView!
    @IBOutlet weak var selectedView: AnimationView!
    
    var normalDayColor = UIColor.blackColor()
    var weekendDayColor = UIColor.grayColor()
    
    let testCalendar: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    
    
    //Uncertain about this stuff
    
    
    lazy var todayDate : String = {
        [weak self] in
        let aString = self!.c.stringFromDate(NSDate())
        return aString
        }()
    lazy var c : NSDateFormatter = {
        let f = NSDateFormatter()
        f.dateFormat = "yyyy-MM-dd"
        
        return f
    }()
    

    
    
    //Call other functions to customize cell
    func setupCellBeforeDisplay(cellState: CellState, date: NSDate) {
        
        //self.backgroundColor = UIColor(colorWithHexValue: 0x3A284C )
        
        wolfImage.hidden = true
        wolfImage.contentMode = UIViewContentMode.ScaleAspectFit
        
        // get images and set sizes
        //setWolfImages()
        
        // Setup Cell text
        dateLabel.text =  cellState.text
        //print(cellState.text)
        //dayLabel.text =  "!"
        
        
        // Setup text color
        configureTextColor(cellState)
        
        
        // Setup Cell Background color NOT WORKING PROPERLY
       //configureBackgroundColor(cellState, date: date)
       // self.backgroundColor = c.stringFromDate(date) == todayDate ? todayColor:normalDayColor
//        print("?????????????")
//        print(c.stringFromDate(date))
//        print(todayDate)
        // Setup cell selection status
        //configueViewIntoBubbleView(cellState)
        
        // Configure Visibility
        configureVisibility(cellState)
        
        //Configure events
        configureEvents(cellState)
    }
    
    func configureBackgroundColor(cellState: CellState, date: NSDate){
        let futureDate = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: 21,
            toDate: NSDate(),
            options: NSCalendarOptions(rawValue: 0))!
        
        if c.stringFromDate(date) == todayDate {
            print("Its a Hit!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            print(todayDate)
            self.backgroundColor = todayColor
            dateLabel.textColor = UIColor.blueColor()
        }
        
        if c.stringFromDate(date) == c.stringFromDate(futureDate) {
            print(date)
            print("this is the futuredate")
            self.backgroundColor = UIColor.yellowColor()
            dateLabel.textColor = UIColor.redColor()
        }
        
        //What is this doing?
        cellState.date == futureDate
        
    }
    
    func configureVisibility(cellState: CellState) {
        if
            cellState.dateBelongsTo == .ThisMonth ||
                cellState.dateBelongsTo == .PreviousMonthWithinBoundary ||
                cellState.dateBelongsTo == .FollowingMonthWithinBoundary {
            self.hidden = false
        } else {
            self.hidden = false
        }
    }
    
    func configureTextColor(cellState: CellState) {
        if cellState.dateBelongsTo == .ThisMonth {
            dateLabel.textColor = normalDayColor
        } else {
            dateLabel.textColor = weekendDayColor
        }
        
        
    }
    
    func cellSelectionChanged(cellState: CellState) {
        if cellState.isSelected == true {
            
            if selectedView.hidden == true {
                //configueViewIntoBubbleView(cellState)
                self.userInteractionEnabled = false
                selectedView.animateWithBounceEffect(withCompletionHandler: {
                    self.userInteractionEnabled = true
                })
            }
        } else {
            //configueViewIntoBubbleView(cellState, animateDeselection: true) ************************* THIS IS STILL A PROBLEM
        }
        
    }
    
    //Journal Wolf head stuff
    func configureEvents(cellState: CellState){
        var successCount = 0
        var failureCount = 0
        
        //figure out which image
        for event in Journal.sharedInstance.journalArray {
            if testCalendar.isDate(event.entryTime, inSameDayAsDate : cellState.date) {
                if event.title == "success"{
                    successCount += 1
                }else if event.title == "failure"{
                    failureCount += 1
                }
                
                
                
                
            }}
        // put image in
        for event in Journal.sharedInstance.journalArray {
            if testCalendar.isDate(event.entryTime, inSameDayAsDate : cellState.date) {
                if failureCount > successCount {
                    wolfImage.image = ImageBank.sharedInstance.badWolfHead
                    dateLabel.textColor = UIColor.cyanColor()
                } else {
                    wolfImage.image = ImageBank.sharedInstance.goodWolfHead
                    dateLabel.textColor = UIColor.brownColor()
                }
                if event.quitDayFlag {
                    wolfImage.image = ImageBank.sharedInstance.quitDayImage
                    dateLabel.textColor = UIColor.greenColor() /// Checking if its a problem with the image or with the loading // seems to be with the images
                }
                if event.title == "Former Quit Day" {
                    wolfImage.image = ImageBank.sharedInstance.quitDayImageGrey
                    dateLabel.textColor = UIColor.redColor()
                }
                
                wolfImage.hidden = false
            }
        }
        
        for item in AllCostBenefitSheets.sharedInstance.allSheetsArray{
            if testCalendar.isDate(item.dateMade, inSameDayAsDate : cellState.date){
                wolfImage.image = ImageBank.sharedInstance.costBen
                wolfImage.hidden = false
                dateLabel.textColor = UIColor.orangeColor()
            }
        }
        
    }
    @IBAction func handleLongPressOnCell () {
    print("Long Press On Cell")
    }
    
    
    func delayRunOnMainThread(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}
extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

class AnimationView: UIView {
    
    func animateWithFlipEffect(withCompletionHandler completionHandler:(()->Void)?) {
        AnimationClass.flipAnimation(self, completion: completionHandler)
    }
    func animateWithBounceEffect(withCompletionHandler completionHandler:(()->Void)?) {
        let viewAnimation = AnimationClass.BounceEffect()
        viewAnimation(self){ _ in
            completionHandler?()
        }
    }
    func animateWithFadeEffect(withCompletionHandler completionHandler:(()->Void)?) {
        let viewAnimation = AnimationClass.FadeOutEffect()
        viewAnimation(self) { _ in
            completionHandler?()
        }
    }
}