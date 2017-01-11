//
//  CalendarViewController.swift
//  ProtoTwo
//
//  Created by Don on 2016-07-04.
//  Copyright © 2016 Don. All rights reserved.
//

import Foundation
import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    let testCalendar: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    var passCellDate = NSDate()
    var passQuitDate: NSDate!
    
    var data = [JournalEntry]()
    
    @IBOutlet weak var quitDayButton: UIButton!
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
      let formatter = NSDateFormatter()
    
    // date picker stuff
    
    var popDatePicker : PopDatePicker?
    //var sharedJournal = Journal.sharedInstance.journalArray
    
    @IBOutlet weak var quitDayLabel: UILabel!

    @IBOutlet weak var quitDayTextField: UITextField!
    
    
    //Images for cell
    
    let blankImage = ImageBank.sharedInstance.blankImage
    let badWolfImage = ImageBank.sharedInstance.badWolfHead
    let goodWolfImage = ImageBank.sharedInstance.goodWolfHead
    
    
    let quitDayImage = ImageBank.sharedInstance.quitDayImage
    let quitDayImageGrey = ImageBank.sharedInstance.quitDayImageGrey
    let costBenImage = ImageBank.sharedInstance.costBen

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //clearJournalEntries()
        //clearCostBenSheeets()
        //clearQuitDay()
        
        self.calendarView.dataSource = self
       
        self.calendarView.delegate = self
        //self.calendarView.registerCellViewXib(fileName: "CellView")
        self.calendarView.registerCellViewXib(fileName: "CellGraphView")
        //self.calendarView.registerCellViewXib(fileName: "CalendarHeaderView")
        
        let tempDate = NSDate()
        calendarView.scrollToDate(tempDate, triggerScrollToDateDelegate: true)
        
        calendarView.backgroundColor = UIColor.blackColor()
        calendarView.cellInset = CGPoint(x: 1, y: 1)
        
        
        //Pciker Stuff
        popDatePicker = PopDatePicker(forTextField: quitDayTextField)
        
        quitDayTextField.delegate = self
        quitDayTextField.addTarget(self, action: #selector(CalendarViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingDidEnd)
        if getQuitDayFromJournal() {
            quitDayLabel.text! = "Your Quitting Day:"
        }
    }
    
    
//    init? (title: String, entryTime: NSDate, displayTime: String, note: String, quitDayFlag: Bool, cravingRating: Int, feelingOne: String, feelingTwo: String, latt: Double, long: Double, didSmoke: Bool ){
//        self.title = title
//        self.entryTime = entryTime // As an NSDate
//        self.displayTime = displayTime // As String
//        self.note = note
//        self.quitDayFlag = quitDayFlag
//        self.cravingRating = cravingRating
//        self.feelingOne = feelingOne
//        self.feelingTwo = feelingTwo
//        self.latt = latt
//        self.long = long
//        self.coordinate = CLLocationCoordinate2D(latitude: latt, longitude: long)
//        self.radius = 10
//        self.didSmoke = didSmoke
//        
//        super.init()
//        
//        if title.isEmpty {
//            return nil
//        }
    
    func clearQuitDay(){
        for e in Journal.sharedInstance.journalArray {
            if e.title == "Quit Day"{
                let index = Journal.sharedInstance.journalArray.indexOf(e)
                Journal.sharedInstance.journalArray.removeAtIndex(index!)
                Journal.sharedInstance.saveJournalEntries()
                print("Clearing quit day")
            }
        }
    
    }
    
    func randomStringWithLength (len : Int) -> NSString {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let randomString : NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString
    }

    
    func createDummyJournalEntries(){
        
        var i = 0
        let tempLatt = 39.6482957
        let tempLong = -123.876598
       
        
        while i <= 100 {
            let entryTime = NSDate(timeIntervalSinceNow: NSTimeInterval((86400/2) * i))

         let tempEntry = JournalEntry(title: randomStringWithLength(7) as String, entryTime: entryTime, displayTime: String(entryTime), note: randomStringWithLength(7) as String, quitDayFlag: false, cravingRating: ((i%5) + 1), feelingOne: "Great", feelingTwo: "Greater", latt: (tempLatt * (Double(i)/10.0)), long: tempLong * (Double(i)/10.0), didSmoke: Bool(i%2))
            Journal.sharedInstance.journalArray.append(tempEntry!)
            Journal.sharedInstance.saveJournalEntries()
            i++
        }
    
    
    }
    
    func writeDummyToPlist(){
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let path = paths.stringByAppendingPathComponent("data.plist")
       let fileManager = NSFileManager.defaultManager()
        if (!(fileManager.fileExistsAtPath(path)))
        {
            let bundle : NSString = NSBundle.mainBundle().pathForResource("data", ofType: "plist")!
            do
            { try fileManager.copyItemAtPath(bundle as String, toPath: path)
                
            }catch {
                print("Carzyyyyyyy")
            }
        }
//        data.setObject(object, forKey: "object")
//        data.writeToFile(path, atomically: true)
    
    
    }
    
    func getQuitDayFromJournal() -> Bool {
        
        var returnBool = false
        for e in Journal.sharedInstance.journalArray {
            if e.title == "Quit Day"{
                quitDayTextField.text = (e.entryTime.ToDateMediumString() ?? "?") as String
                print("????????????????????????????????????????????")
                print("Found Quit Day")
                returnBool = true
            }
        }
        return  returnBool
    }
    
    func clearJournalEntries(){
        for e in Journal.sharedInstance.journalArray {
            // if e.title == "Quit Day"{
            let index = Journal.sharedInstance.journalArray.indexOf(e)
            Journal.sharedInstance.journalArray.removeAtIndex(index!)
            Journal.sharedInstance.saveJournalEntries()
            // }
        }
    }
    
    func clearCostBenSheeets(){
        for e in AllCostBenefitSheets.sharedInstance.allSheetsArray {
            // if e.title == "Quit Day"{
            let index = AllCostBenefitSheets.sharedInstance.allSheetsArray.indexOf(e)
            AllCostBenefitSheets.sharedInstance.allSheetsArray.removeAtIndex(index!)
            AllCostBenefitSheets.sharedInstance.saveCostBenSheets()
            // }
        }
    }
    
    func textFieldDidChange(textField: UITextField) {
        print("QuitDay Chosen")
    }
    

    // PopUp Date Picker Stuff
    
    func resign() {
        
        quitDayTextField.resignFirstResponder()
        
    }
    
    func setQuitDayOnCalendar(newDate: NSDate){
        //Check if there is a previous quit day
        for e in Journal.sharedInstance.journalArray {
            if e.quitDayFlag && !testCalendar.isDate(e.entryTime as NSDate, inSameDayAsDate : newDate){
                e.quitDayFlag = false
                e.title = "Former Quit Day"
                e.note = "This was the day!"
            }
        }
        
        //Try making quitDay a type of Journal Entry
        let title = "Quit Day"
        let entryTime = newDate
        let displayTime = formatDate(entryTime)
        let note = "This is the day!"
        let quitDayFlag = true
        let cravingRating = 0
        let feelingOne = ""
        let feelingTwo = ""
        let latt = 0.0
        let long = 0.0
        let didSmoke = false
        
        let tempEntry = JournalEntry(title: title, entryTime: entryTime, displayTime: displayTime, note: note, quitDayFlag: quitDayFlag, cravingRating: cravingRating, feelingOne: feelingOne, feelingTwo: feelingTwo, latt: latt, long: long, didSmoke: didSmoke)
        Journal.sharedInstance.journalArray.append(tempEntry!)
        Journal.sharedInstance.saveJournalEntries()

        
        
        
        //self.setNeedsDisplay()
        calendarView.reloadData()
        
        
    }
    // Should put in some kind of utilities file
    func formatDate (date: NSDate) -> String{
        let dateFormatter = NSDateFormatter()
        //dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy: HH:mm"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        let timeStamp = dateFormatter.stringFromDate(date)
        return timeStamp
        
    }
    
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if (textField === quitDayTextField) {
            resign()
            let formatter = NSDateFormatter()
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .NoStyle
            let initDate : NSDate? = formatter.dateFromString(quitDayTextField.text!)
            
            let dataChangedCallback : PopDatePicker.PopDatePickerCallback = { (newDate : NSDate, forTextField : UITextField) -> () in
                
                // here we don't use self (no retain cycle)
                forTextField.text = (newDate.ToDateMediumString() ?? "?") as String
                print("Help Me!!")
                print(newDate)
                self.setQuitDayOnCalendar(newDate)
            }
            
            popDatePicker!.pick(self, initDate: initDate, dataChanged: dataChangedCallback)
            
            ////////////////////////////////////////////////////////////////////////////////////////////////////////
             calendarView.reloadData()
            
            return false
        }
        else {
            return true
        }
       
    }
    
    func getCellInfo(cellState: CellState) -> (Int, Int, UIImage){
    
        var didSmoke = 0
        var didNotSmoke = 0
        var image = blankImage
//        var title = ""
//        var quitDayFlag = false
        
        for e in Journal.sharedInstance.journalArray {
            if testCalendar.isDate(e.entryTime as NSDate, inSameDayAsDate : passCellDate){
                if e.didSmoke!{
                    didSmoke += 1
                }
                if !e.didSmoke!{
                    didNotSmoke += 1
                }
//                if e.title == "Former Quit Day"{
//                    title = e.title!
//                }
//                if e.quitDayFlag{
//                    quitDayFlag = true
//                }
            }
       
        }
     
        for e in Journal.sharedInstance.journalArray {
            if testCalendar.isDate(e.entryTime as NSDate, inSameDayAsDate : passCellDate){

                if didSmoke > didNotSmoke {
                    image = badWolfImage
                } else if didNotSmoke >= didSmoke { ////Something is wrong here.....
                    image = goodWolfImage
                } else {
                    if e.quitDayFlag {
                        image = quitDayImage
                    }else{
                        image = blankImage
                    }
                }
        
              
        
                
                if e.title == "Former Quit Day" {
                    image = quitDayImageGrey
                    
                } 
            }
        }
        for item in AllCostBenefitSheets.sharedInstance.allSheetsArray{
            if testCalendar.isDate(item.dateMade, inSameDayAsDate : cellState.date){
                image = costBenImage
                
            }
        }
        
     
        
            let returnTuple = (didSmoke, didNotSmoke, image)
        
        return returnTuple
    
    }
    
    
   
    

    func getJournalEntriesForDay() -> [AnyObject]{
        var successCount = 0
        var failureCount = 0
        var passEvents : [AnyObject] = []
        
        for e in Journal.sharedInstance.journalArray {
            if testCalendar.isDate(e.entryTime as NSDate, inSameDayAsDate : passCellDate){
                if e.didSmoke == false{
                    successCount += 1
                    print("Counted Success")
                }else if e.didSmoke == true{
                    failureCount += 1
                    print("Counted Failure")
                }else if e.title == "Quit Day"{
                    quitDayTextField.text = (e.entryTime.ToDateMediumString() ?? "?") as String
                    print("????????????????????????????????????????????")
                    print("Found Quit Day")
                }
                
                passEvents.append(e)
                print("Doosdfhksjdfhks")
            }
            
          
        }
        for item in AllCostBenefitSheets.sharedInstance.allSheetsArray{
            print(AllCostBenefitSheets.sharedInstance.allSheetsArray.count)
            
            if let wholeSheet = item as? CostBenefitSheetModel{
                if testCalendar.isDate(wholeSheet.dateMade as NSDate, inSameDayAsDate : passCellDate){
                    passEvents.append(wholeSheet)
                    
                }
            }
            
            
        }
        
        return passEvents
    }
    



    func setupViewsOfCalendar(startDate: NSDate, endDate: NSDate) {
        
        let month = testCalendar.component(NSCalendarUnit.Month, fromDate: startDate)
        let monthName = NSDateFormatter().monthSymbols[(month-1) % 12] // 0 indexed array
        let year = NSCalendar.currentCalendar().component(NSCalendarUnit.Year, fromDate: startDate)
        self.title = monthName + " " + String(year)
    }
    // Prepare detaiViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Show Detail"{
            
//            let navVC = segue.destinationViewController as! UINavigationController
//            let tableVC = navVC.viewControllers.first as! DetailViewController
            
            let detailViewController = segue.destinationViewController as! DetailViewController
            let displayEvents = getJournalEntriesForDay()
            
            //pass stuff over
            detailViewController.dayEvents = displayEvents
            
            
        }
    }
    
    
    @IBAction func prepareForUnwind(sender: UIStoryboardSegue) {
    }
    
 
    
}









extension CalendarViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate  {
    
    func configureCalendar(calendar: JTAppleCalendarView) -> (startDate: NSDate, endDate: NSDate, numberOfRows: Int,   calendar: NSCalendar) {
        
        // You can set your date using NSDate() or NSDateFormatter. Your choice.
        let firstDate = getStartAndEndDates(-6)
        let secondDate = getStartAndEndDates(6)
        let numberOfRowsDude = 6
        let aCalendar = testCalendar // Properly configure your calendar to your time zone here
        return (startDate: firstDate, endDate: secondDate, numberOfRows: numberOfRowsDude, calendar: aCalendar)
    }
    
    func getStartAndEndDates(offset: Int) -> NSDate{
        let newDate = testCalendar.dateByAddingUnit(.Month, value: offset, toDate: NSDate(), options: [])
        return newDate!
    }
    
    
    
    func calendar(calendar: JTAppleCalendarView, isAboutToDisplayCell cell: JTAppleDayCellView, date: NSDate, cellState: CellState) {
        
        //Create a custom cell
        let myCell = cell as! CellGraphView
        
        //maybe this is dumb
        let cellInfo = getCellInfo(cellState)
        
        myCell.didSmokeCount = cellInfo.0
        myCell.didNotSmokeCount = cellInfo.1
        myCell.imageForCell.image = cellInfo.2
        
        //Trying to check if there are no journal entries, probably a bad spot
        if cellInfo.0 == 0 && cellInfo.1 == 0 {
            myCell.imageForCell.hidden = true
        }
        
        // Configure Cell
        //(cell as! CellView).setupCellBeforeDisplay(cellState, date: date)
        myCell.setupCellBeforeDisplay(cellState, date: date)
        //myCell.imageForCell.hidden = true
        
    }
    func calendar(calendar: JTAppleCalendarView, didDeselectDate date: NSDate, cell: JTAppleDayCellView?, cellState: CellState) {
        (cell as? CellGraphView)?.cellSelectionChanged(cellState)
    }
    
    func calendar(calendar: JTAppleCalendarView, didSelectDate date: NSDate, cell: JTAppleDayCellView?, cellState: CellState) {
        (cell as? CellGraphView)?.cellSelectionChanged(cellState)
        
        passCellDate = cellState.date
        self.performSegueWithIdentifier("Show Detail", sender: self)
        //printSelectedDates(cellState)
    }
    
    
    func calendar(calendar: JTAppleCalendarView, didScrollToDateSegmentStartingWithdate startDate: NSDate, endingWithDate endDate: NSDate) {
        setupViewsOfCalendar(startDate, endDate: endDate)
    }
    
    func calendar(calendar: JTAppleCalendarView, sectionHeaderIdentifierForDate date: (startDate: NSDate, endDate: NSDate)) -> String? {
        //let comp = testCalendar.component(.Month, fromDate: date.startDate)
        //if comp % 2 > 0{
        //  return "WhiteSectionHeaderView"
        //}
        //return "CalendarHeaderView"
       return "PinkSectionHeaderView"
    }
    
    func calendar(calendar: JTAppleCalendarView, sectionHeaderSizeForDate date: (startDate: NSDate, endDate: NSDate)) -> CGSize {
//        if testCalendar.component(.Month, fromDate: date.startDate) % 2 == 1 {
//            return CGSize(width: 200, height: 50)
//        } else {
            return CGSize(width: 200, height: 50) // Yes you can have different size headers
        //}
    }
    
    func calendar(calendar: JTAppleCalendarView, isAboutToDisplaySectionHeader header: JTAppleHeaderView, date: (startDate: NSDate, endDate: NSDate), identifier: String) {

        
        print("aboutToDisplaySectionHeader")
        //let headerCell = (header as? CalendarHeaderView)
        //let headerCell = (header as? PinkSectionHeaderView)
        
        
//                switch identifier {
//        case "CalendarHeaderView":
     //     let headerCell = (header as? CalendarHeaderView)
//         headerCell?.sun.text = "S"
//                    headerCell?.mon.text = "M"
//                    headerCell?.tue.text = "T"
//                    headerCell?.wed.text = "W"
//                    headerCell?.thur.text = "T"
//                    headerCell?.fri.text = "F"
//                    headerCell?.sat.text = "S"
//        default:
//         let headerCell = (header as? PinkSectionHeaderView)
//         headerCell?.title.text = "CRAZY!!!"
//        }
    }


}
extension String {
    func stringByAppendingPathComponent(path: String) -> String {
        let nsSt = self as NSString
        return nsSt.stringByAppendingPathComponent(path)
    }
}
