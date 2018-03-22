//
//  GraphVC.swift
//  NUHG
//
//  Created by Ernest Fan on 2018-02-21.
//  Copyright © 2018 ERF. All rights reserved.
//

import UIKit
import Charts

@IBDesignable
class GraphVC: UIViewController {

    @IBOutlet weak var lineChart: LineChartView!
    var sbValue = 0
    var hours = 0
    
    var value = UserDataService.instance.getGraphData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let line1 = addLinePoints(sb: value.sbP, age: value.ageP)
        let line2 = addLinePoints(sb: value.sbET, age: value.ageET)
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
        
        setupChart()
    }
    
    func setupChart() {
        lineChart.dragEnabled = true
        lineChart.pinchZoomEnabled = true
        lineChart.xAxis.axisMaximum = 120.0
        lineChart.leftAxis.axisMaximum = 500.0
        lineChart.rightAxis.axisMaximum = 500.0
        lineChart.chartDescription?.text = "Neonatal Unconjugated Hyperbilirubinaemia"
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.setLabelCount(11, force: true)
        lineChart.leftAxis.labelCount = 10
        lineChart.rightAxis.labelCount = 10
    }
    
    func addLinePoints(sb: [Double], age: [Double]) -> [ChartDataEntry] {
        var lineChartEntry = [ChartDataEntry]()
        for i in 0..<sb.count {
            let value = ChartDataEntry(x: age[i], y: sb[i])
            lineChartEntry.append(value)
        }
        return lineChartEntry
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
