//
//  FeelingFunnnelViewController.swift
//  ProtoTwo
//
//  Created by Don on 2016-10-03.
//  Copyright © 2016 Don. All rights reserved.
//

import UIKit

protocol FeelingFunnelViewControllerDelegate : class {
    
    func feelingFunnelVCDismissed(feeling : String?)
}

class FeelingFunnnelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var feelingTextField: UITextField!
  

    
    
    // MARK: Properties

    var fullCellArray = [FeelingCellDataModel]()
    var cellDescriptors = [AnyObject]()
    
    
//    var topLevelIndex = [Int]()
//    var midLevelArray = [Int]()
//    var bottomLevelArray = [Int]()
//    var checkCellArray = [FeelingCellDataModel]()
    //var visibilityBools = [Bool]()
    
    //
//    var sloppyCounter = 0
//    var firstLoadCheck = true
    
    //if Im right this will fix everything /// It did NOT fix everything
//    var feelingsToShow = [String]()
//    
//    var clearTableBool = false

    
    //Colours
    var blue = UIColor.blueColor()
    let green = UIColor.greenColor()
    let orange = UIColor.orangeColor()
    
   
    weak var delegate : FeelingFunnelViewControllerDelegate?
    
    var currentFeeling : String? {
        didSet {
            updateCurrentFeeling()
        }
    }
    var freshLoad = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCellDescriptors()
        readPList()
        //setUpVisibilityBools()
        //updateFeelingsToShow()
        configureTableView()
//        print(fullCellArray.count)
//        print("This many cells total!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        
 
        self.freshLoad = true
        print("View did load called")
        //print(tableView)
        //sloppyCounter += 1
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //configureTableView()
        

        print("view will appear called")
        //Trying to make it the right size
        self.presentingViewController!.presentedViewController!.preferredContentSize = CGSize(width: 320, height: 500);
    }

    
//    func updateFeelingsToShow(){
//        feelingsToShow.removeAll()
//        for item in fullCellArray{
//            if item.isVisible == 1{
//                feelingsToShow.append(item.feeling)
//            }
//            
//        }
//    
//    
//    }
    
    //TableView Stuff
    
    func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self

        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        
        tableView.registerNib(UINib(nibName: "firstLevelCell", bundle: nil), forCellReuseIdentifier: "firstLevelCell")
        tableView.registerNib(UINib(nibName: "secondLevelCell", bundle: nil), forCellReuseIdentifier: "secondLevelCell")
        tableView.registerNib(UINib(nibName: "thirdLevelCell", bundle: nil), forCellReuseIdentifier: "thirdLevelCell")
        
    }
    
 
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("fromm number Rows count is: \(fullCellArray.count)")
        //return feelingsToShow.count
        return fullCellArray.count
    
    }
//    func updateTableView(passRows: Int, startIndex: Int) {
//        
//                feelingsToShow.removeAll()
//                updateFeelingsToShow()
//        self.tableView.reloadData()
//        self.tableView.beginUpdates()
////        self.tableView.reloadData()
//        self.tableView.endUpdates()
//        //self.tableView.reloadData()
//    }
    
        
//        var silly = [NSIndexPath]()
//        var i = 0
//        while i < passRows {
//        silly.append(NSIndexPath(forRow: startIndex + i, inSection: 0))
//        i++
//        }
//        for item in silly {
//        
//            print(item)
//        }
//        
//        //I Feel Dirty
//        //clearTableBool = true
//        feelingsToShow.removeAll()
//        updateFeelingsToShow()
//        //dispatch_async(dispatch_get_main_queue(), { () -> Void in
//        //self.tableView.reloadData()
//        self.tableView.insertRowsAtIndexPaths(silly, withRowAnimation: .None)
//        //})
//        print("Before begining")
//        self.tableView.beginUpdates()
//        print("In The Middle")
////        self.tableView.insertRowsAtIndexPaths(silly, withRowAnimation: .None)
//        tableView.endUpdates()
//        print("After the end")
//        
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .None)
//        })
//        
        
        
//        updateFeelingsToShow()
//        self.tableView.reloadData()
//        self.tableView.beginUpdates()
//        self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .None)
//        self.tableView.endUpdates()
    
        

    
    func updateTableView() {
        
        //I Feel Dirty
        //clearTableBool = true
        //feelingsToShow.removeAll()
      
        //dispatch_async(dispatch_get_main_queue(), { () -> Void in
          //  self.tableView.reloadData()
        //})
//        print("Before begining")
//        self.tableView.beginUpdates()
//        print("In The Middle")
//        self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .None)
//        tableView.endUpdates()
//        print("After the end")
//        
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .None)
//        })

        
        
        //updateFeelingsToShow()
        self.tableView.reloadData()
        self.tableView.beginUpdates()
       // self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .None)
        self.tableView.endUpdates()
        
        
        
        
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            self.tableView.reloadData()
//        })
        
//        tableView.beginUpdates()
//        tableView.endUpdates()
        //clearTableBool = false
        
//        print(tableView)
//        
//        updateFeelingsToShow()
//       tableView.reloadData()
//        tableView.beginUpdates()
//        tableView.endUpdates() //        print("")
//        print("Second \(tableView)")
        
    }
    
    func getCelModelFromString(feeling: String)-> FeelingCellDataModel{
        var temp = FeelingCellDataModel(feeling: "", isVisible: 0, isExpandable: 0, additionalRows: 0, cellIdentifier: "", arrayIndex: 0, isExpanded: 0)
        
        for item in fullCellArray{
            if item.feeling == feeling{
                temp = item
            }
        }
        
        return temp
    }

    ///
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var retCell = UITableViewCell()
        
        
        let tempCell = fullCellArray[indexPath.row]
        //let tempCell = getCelModelFromString(feelingsToShow[indexPath.row])
       
        
     if tempCell.cellIdentifier == "secondLevelCell" {
 
            let cell = tableView.dequeueReusableCellWithIdentifier("secondLevelCell", forIndexPath: indexPath) as! Feeling2CustomCell
            if tempCell.isVisible == 1 {
                cell.hidden = false
            }else{
                cell.hidden = true
            }
            cell.feelingLabel!.text = tempCell.feeling
            cell.backgroundColor = green.colorWithAlphaComponent(0.5)
            retCell = cell
        }else if tempCell.cellIdentifier == "thirdLevelCell" {

           
            let cell = tableView.dequeueReusableCellWithIdentifier("thirdLevelCell", forIndexPath: indexPath) as! Feeling3CustomCell
            if tempCell.isVisible == 1 {
                cell.hidden = false
            }else{
                cell.hidden = true
            }
            cell.feelingLabel!.text = tempCell.feeling
            cell.backgroundColor = orange.colorWithAlphaComponent(0.5)
            retCell = cell
        
        }
        else if tempCell.cellIdentifier != "secondLevelCell" && tempCell.cellIdentifier != "thirdLevelCell"{
 
            
            let cell = tableView.dequeueReusableCellWithIdentifier("firstLevelCell", forIndexPath: indexPath) as! FeelingCustomCell
            if tempCell.isVisible == 1 {
                cell.hidden = false
            }else{
                cell.hidden = true
            }
            cell.feelingLabel!.text = tempCell.feeling
            cell.backgroundColor = blue.colorWithAlphaComponent(0.5)
            retCell = cell
        
        }

        
        return retCell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath)-> CGFloat {
        let cellHeight:CGFloat = 44
        var height = cellHeight
        let cell = fullCellArray[indexPath.row]
       
        
        if cell.isVisible == 0{
            height = 0
        }

        return height
    }
    

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
     

        
        
        var selection = fullCellArray[indexPath.row]
        
        
        
        
        feelingTextField.text = selection.feeling
        
        print("feeling is \(selection.feeling)")
        print("identity is \(selection.cellIdentifier)")
        print("starting at: \(indexPath.row)")

        if selection.isExpandable == 1 {
           
            
            if selection.isExpanded == 0 {
                selection.isExpanded = 1
                print("SELECTION IS EXPANDED")
                
            }else {
                selection.isExpanded = 0
                print("SELECTION IS TOTALLY NOT EXPANDED")
                
            }
            
//            closeEverythingElse(selection)
            
            let startIndex = selection.arrayIndex
           
//            print("AdditionalRows \(selection.additionalRows)")
            
            if selection.cellIdentifier != "secondLevelCell" && selection.cellIdentifier != "thirdLevelCell"{
                ///start here
                if  selection.isExpanded == 1{
                    
                    print("Is expanded")
                
                
                loadCellDescriptors()
                readPList()
                updateTableView()
           
                let totalCellsToCheck = 3 * selection.additionalRows
                for item in fullCellArray{
                    
                    
                    switch item.arrayIndex {
                    
                        case startIndex...(startIndex + totalCellsToCheck):
                            if item.cellIdentifier == "secondLevelCell"{
//                                if item.isExpanded == 0{
//                                    
//                                
//                                }
                                item.isVisible = 1 /////// what?
                                
                            }
                        default:
                            break
                        }
                }
                }else if selection.isExpanded == 0{
                    for item in fullCellArray {
                        if item.cellIdentifier == "secondLevelCell" { ////this is where I left off not getting here
                            print("MADE IT TO SECOND CONTROL")
                            item.isExpanded = 0
                            item.isVisible = 0
                        }
                        if item.cellIdentifier == "thirdLevelCell"{
                            print("MADE IT TO THIRD CONTROL")
                            item.isVisible = 0
                            
                        }
                    }
                }
            }
            //}
            else if selection.cellIdentifier == "secondLevelCell"{
                let totalCellsToCheck = selection.additionalRows + 1
                
                for item in fullCellArray{
                    
                    if item.feeling != selection.feeling && item.isExpanded == 1{
                        item.isExpanded = 0
                    }
                   
                    switch item.arrayIndex { // make the cases cover all possibilities!!!!!!
                        
                    case 0...(startIndex - 1):
                        
                        if item.cellIdentifier == "thirdLevelCell"{
                            item.isVisible = 0
                        }
                    case startIndex...(startIndex + totalCellsToCheck):
                            if item.cellIdentifier == "thirdLevelCell" && selection.isExpanded == 1{
                            item.isVisible = 1
                            
                            } else if item.cellIdentifier == "thirdLevelCell" && selection.isExpanded == 0{
                                item.isVisible = 0
                        }
                    case (startIndex + totalCellsToCheck + 1)...fullCellArray.count - 1:
                        if item.cellIdentifier == "thirdLevelCell"{
                            item.isVisible = 0
                        }
                        
                        default:
                            break
                        }
                   
                    
                    }
                }
            else if selection.cellIdentifier == "thirdLevelCell"{
                print("It's cool bro!")
                
            }
            
        }
        //updateFeelingsToShow()
        //updateTableView(passRows, startIndex: passIndex)
        
        self.fullCellArray[indexPath.row] = selection
        updateTableView()
    }
    
    func findParentArray (feeling: String) -> String{
        var retString = ""
        let path = NSBundle.mainBundle().pathForResource("feelingList", ofType: "plist")
        
        let dict = NSDictionary(contentsOfFile:path!)
        //var arrayIndex = 0
        
        //print("Here goes nothing")
        let tempArray = dict!["TopFeelings"] as! Array<String>
            
        for item in tempArray {
            let tempArray2 = readPListForString(item)
            for i in tempArray2! {
                if i == feeling{
                    retString = item
                }
            }
        }
        
        
        
        
        
            //retArray.appendContentsOf(tempArray as [String])
            //objects.appendContentsOf(snows as [AnyObject])
            return retString
       
    
    }
    
    func closeEverythingElse(selection: FeelingCellDataModel){
    
        for item in fullCellArray {
        
            if item.feeling != selection.feeling && item.isExpanded == 1 {
                item.isExpanded = 0
                
                
            }
        }
    }
    
    
//    func configureVisibility(indexPath: NSIndexPath){
//        for item in visibilityBools{
//            if item == true {
//                tableView.cellForRowAtIndexPath(indexPath)!.hidden = false
//            }
//        }
//    
//    }
    func refreshArray(){
            var printCount = 0
        
        for i in fullCellArray {
            if i.isVisible == 1{
                printCount += 1
            }
            
        }
//                print("there should be this many visible cells \(printCount)")
//                DispatchQueue.main.async(execute: { () -> Void in
//                    self.tableView.reloadData()
//                })
    }

    
     convenience init() {
        self.init(nibName: "FeelingFunnelViewController", bundle: nil)
       
    }
    
    private func updateCurrentFeeling() {
        
//        if let _currentFeeling = self.currentFeeling {
//            if let _datePicker = self.datePicker {
//                _datePicker.date = _currentDate
//            }
//        }
    }
    
    @IBAction func okAction(sender: AnyObject) {
        print("OK PRESSED!!")
        self.dismissViewControllerAnimated(true) {
            
            let sendFeeling = self.feelingTextField.text// the text from the field
            self.delegate?.feelingFunnelVCDismissed(sendFeeling)
            
            
        }
    }
    
    @IBAction func resetAction(sender: UIButton){
        //fullCellArray.removeAll()
        
        loadCellDescriptors()
        readPList()
        updateTableView()
      
        
        print("reset")
        
        

        
        
    }
    
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func loadCellDescriptors() {
        if let path = NSBundle.mainBundle().pathForResource("CellDescriptor", ofType: "plist") {
            let tempCellDescriptors = NSMutableArray(contentsOfFile: path)
            
            for item in tempCellDescriptors!{
            cellDescriptors = item as! [AnyObject]
                print("Count is \(cellDescriptors.count)")
            }

        }
    }
    
    func getCellDescriptor(string: String) -> [String: AnyObject]{
      var returnDict = [String: AnyObject]()
        
        for item in cellDescriptors{
            if string == item["cellIdentifier"] as! String{
                returnDict = item as! [String : AnyObject]
            }
        
        }
        return returnDict
    }

    
 
    func readPList()-> [FeelingCellDataModel] {
        fullCellArray.removeAll()
        let path = NSBundle.mainBundle().pathForResource("feelingList", ofType: "plist")

        let dict = NSDictionary(contentsOfFile:path!)
        var arrayIndex = 0
        
        print("Here goes nothing")
        let tempArray = dict!["TopFeelings"] as! Array<String>
        
        for item in tempArray {
            
            let fullTopCell = createCellWithDescription(item, cellIdentifier: item, arrayIndex: arrayIndex)
            //print(fullTopCell)
            fullCellArray.append(fullTopCell)
            arrayIndex += 1
            let midLevel = readPListForString(fullTopCell.feeling)
            
                for midItem in midLevel! {

                    let fullMidCell = createCellWithDescription(midItem, cellIdentifier: "secondLevelCell", arrayIndex: arrayIndex)
                    fullCellArray.append(fullMidCell)
                    arrayIndex += 1
                    let bottomLevel = readPListForString(fullMidCell.feeling)
                    
                        for bottomItem in bottomLevel!{
                            let fullBotCell = createCellWithDescription(bottomItem, cellIdentifier: "thirdLevelCell", arrayIndex: arrayIndex)
                            fullCellArray.append(fullBotCell)
                            arrayIndex += 1
                        }
                }
            
        }
//        for i in fullCellArray{
//            checkCellArray.append(i)
//        }
//        print("This is the count")
//        print(fullCellArray.count)
//        for i in fullCellArray {
//            print(i.cellIdentifier)
//        }
        return fullCellArray
    }
//    func setUpVisibilityBools(){
//        visibilityBools.removeAll()
//        for item in fullCellArray{
//            print(item.arrayIndex)
//            
//            if item.isVisible == 0{
//                self.visibilityBools.append(false)
//            }
//            else if item.isVisible == 1{
//                self.visibilityBools.append(true)
//            }
//        }
//        print("visibility bools count is \(visibilityBools.count)")
//    }
    
    func readPListForString(feelingToFind: String)-> [String]? {
        let path = NSBundle.mainBundle().pathForResource("feelingList", ofType: "plist")
       
        let dict = NSDictionary(contentsOfFile:path!)
        
        let tempArray = dict![feelingToFind] as! Array<String>
        
        var retArray = [String]()
        retArray.appendContentsOf(tempArray as [String])
        //objects.appendContentsOf(snows as [AnyObject])
        return retArray
    }
//    func makeTopLevelVisible(){
//        for item in fullCellArray {
//        
//            if item.cellIdentifier != "secondLevelCell" && item.cellIdentifier != "thirdLevelCell"{
//            
//                item.isVisible = 1
//                //print(item.feeling)
//                //print("is now visible")
//            }
//        }
//    
//    }
    
    func createCellWithDescription(feeling: String, cellIdentifier: String , arrayIndex: Int) -> FeelingCellDataModel{
        let cellDescriptor = getCellDescriptor(cellIdentifier)
//        print("Cell descriptor in creation \(cellDescriptor)")
//        
//        print("this is the visible \(cellDescriptor["isVisible"])")
        
        let arrayIndex = arrayIndex
        var isVisible = cellDescriptor["isVisible"] as! Int
        let isExpandable = cellDescriptor["isExpandable"] as! Int
        let additionalRows = cellDescriptor["additionalRows"] as! Int
        let cellIdentifier = cellDescriptor["cellIdentifier"] as! String
        var isExpanded = cellDescriptor["isExpanded"] as! Int
        
      
        

        let prettyCell = FeelingCellDataModel(feeling: feeling, isVisible: isVisible, isExpandable: isExpandable, additionalRows: additionalRows, cellIdentifier: cellIdentifier, arrayIndex: arrayIndex, isExpanded: isExpanded)
        
        
        return prettyCell
    }
    


}
