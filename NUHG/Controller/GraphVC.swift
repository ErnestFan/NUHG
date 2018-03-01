//
//  GraphVC.swift
//  NUHG
//
//  Created by Ernest Fan on 2018-02-21.
//  Copyright © 2018 ERF. All rights reserved.
//

import UIKit
import Charts

class GraphVC: UIViewController {

    @IBOutlet weak var lineChart: LineChartView!
    var sbValue = 0
    var hours = 0
    
    var sbP = [65.0, 80.0, 100.0, 115.0, 130.0, 145.0, 160.0, 175.0, 187.0, 200.0, 212.0, 223.0, 230.0, 233.0, 238.0, 242.0, 245.0, 251.0, 255.0, 255.0, 255.0]
    
    var sbET = [238.0, 246.0, 256.0, 270.0, 280.0, 292.0, 306.0, 316.0, 324.0, 331.0, 340.0, 349.0, 358.0, 366.0, 374.0, 378.0, 380.0, 380.0, 380.0, 380.0, 380.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let line1 = addLinePoints(sb: sbP)
        let line2 = addLinePoints(sb: sbET)
        let point = [ChartDataEntry(x: Double(hours), y: Double(sbValue))]
        
        let lineP = LineChartDataSet(values: line1, label: "Phototherapy")
        lineP.colors = [NSUIColor.blue]
        lineP.drawCirclesEnabled = false
        lineP.drawValuesEnabled = false
        lineP.drawVerticalHighlightIndicatorEnabled = false
        lineP.drawVerticalHighlightIndicatorEnabled = false
        
        let lineET = LineChartDataSet(values: line2, label: "Exchange Transfusion")
        lineET.colors = [NSUIColor.green]
        lineET.drawCirclesEnabled = false
        lineET.drawValuesEnabled = false
        lineET.drawVerticalHighlightIndicatorEnabled = false
        lineET.drawHorizontalHighlightIndicatorEnabled = false
        
        let linePoint = LineChartDataSet(values: point, label: "Patient")
        linePoint.circleColors = [NSUIColor.red]
        linePoint.circleHoleColor = NSUIColor.red
        linePoint.colors = [NSUIColor.red]
        linePoint.drawVerticalHighlightIndicatorEnabled = false
        linePoint.drawHorizontalHighlightIndicatorEnabled = false
        
        let data = LineChartData()
        data.addDataSet(lineP)
        data.addDataSet(lineET)
        data.addDataSet(linePoint)
        lineChart.data = data
        lineChart.dragEnabled = true
        lineChart.pinchZoomEnabled = true
        lineChart.xAxis.axisMaximum = 120.0
        lineChart.leftAxis.axisMaximum = 450.0
        lineChart.rightAxis.axisMaximum = 450.0
        lineChart.chartDescription?.text = "Neonatal Unconjugated Hyperbilirubinaemia"
//        lineChart.xAxis.granularityEnabled = true
//        lineChart.xAxis.granularity = 12.0
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.setLabelCount(11, force: true)
        lineChart.leftAxis.labelCount = 8
        lineChart.rightAxis.labelCount = 8
    }
    
    func addLinePoints(sb: [Double]) -> [ChartDataEntry] {
        var lineChartEntry = [ChartDataEntry]()
        for i in 0..<sb.count {
            let value = ChartDataEntry(x: Double(i) * 6.0, y: sb[i])
            lineChartEntry.append(value)
        }
        return lineChartEntry
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
