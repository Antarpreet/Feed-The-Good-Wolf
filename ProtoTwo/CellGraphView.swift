//
//  CellGraphView.swift
//  ProtoTwo
//
//  Created by Don on 2017-01-09.
//  Copyright © 2017 Don. All rights reserved.
//

import Foundation
import UIKit
import JTAppleCalendar
import Charts

class CellGraphView: JTAppleDayCellView {
   
    

    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var imageForCell: UIImageView!
    @IBOutlet weak var chartView: BarChartView!
    
    var normalDayColor = UIColor.blackColor()
    var weekendDayColor = UIColor.grayColor()
    
    var didSmokeCount = 0
    var didNotSmokeCount = 0
    //var imageToDisplay = UIImage()
    
    
    //properties
    var xAxis = ["Y","N"]
    var yAxis = [3.0,6.0]


    func setupCellBeforeDisplay(cellState: CellState, date: NSDate) {
        
        //self.backgroundColor = UIColor(colorWithHexValue: 0x3A284C )
        
        imageForCell.hidden = false
        imageForCell.contentMode = UIViewContentMode.ScaleAspectFit
        
        // get images and set sizes
        //setWolfImages()
        
        // Setup Cell text
        dateLabel.text =  cellState.text
        //print(cellState.text)
        //dayLabel.text =  "!"
        
        
        // Setup text color
        //configureTextColor(cellState)
        
      
        
        
        // Configure Visibility
        configureVisibility(cellState)
        
        configureImage()
        
        //Configure events
        configureGraph()
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
    
    func configureGraph(){
        setChart(xAxis, values: yAxis)
        
        
        
    }

    
    func setChart(dataPoints: [String], values: [Double]) {
        self.chartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "")
        let chartData = BarChartData(xVals: xAxis, dataSet: chartDataSet)
        
        //Just dubuggung
        chartDataSet.colors = ChartColorTemplates.colorful()
        
        chartView.data = chartData
        
        //chartView.xAxis.
        
        
        //chartView.drawGridBackgroundEnabled = false
      
        
        
        
    }
    
    func configureImage(){
        
    
    }
    
    func cellSelectionChanged(cellState: CellState) {
        if cellState.isSelected == true {
            
//            if selectedView.hidden == true {
//                //configueViewIntoBubbleView(cellState)
//                self.userInteractionEnabled = false
//                selectedView.animateWithBounceEffect(withCompletionHandler: {
//                    self.userInteractionEnabled = true
//                })
//            }
//        } else {
//            //configueViewIntoBubbleView(cellState, animateDeselection: true) ************************* THIS IS STILL A PROBLEM
//        }
        
    }
   
    }
}
