//
//  ChartsTestViewController.swift
//  ProtoTwo
//
//  Created by Don on 2017-01-10.
//  Copyright © 2017 Don. All rights reserved.
//

import Foundation
import UIKit
import Charts

class ChartsTestViewController: UIViewController {
    
    @IBOutlet weak var chartView: BarChartView!
    
    //properties
    var xAxis = ["Y","N"]
    var yAxis = [3.0,6.0]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart(xAxis, values: yAxis)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        print("The view was refreshed")
      
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
    
  
    
//    @IBAction func prepareForUnwindToHelp(sender: UIStoryboardSegue) {
//    }
//    
}

