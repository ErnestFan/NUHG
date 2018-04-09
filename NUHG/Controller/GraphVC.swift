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
        let lineET = LineChartDataSet(values: line2, label: "Exchange Transfusion")
        let linePoint = LineChartDataSet(values: point, label: "Patient")
        
        let data = LineChartData()
        
//
//
//        lineP.colors = [NSUIColor.blue]
//        lineP.drawCirclesEnabled = false
//        lineP.drawValuesEnabled = false
//        lineP.drawVerticalHighlightIndicatorEnabled = false
//        lineP.drawVerticalHighlightIndicatorEnabled = false
//
//
//        lineET.colors = [NSUIColor.green]
//        lineET.drawCirclesEnabled = false
//        lineET.drawValuesEnabled = false
//        lineET.drawVerticalHighlightIndicatorEnabled = false
//        lineET.drawHorizontalHighlightIndicatorEnabled = false
//
//
//        linePoint.circleColors = [NSUIColor.black]
//        linePoint.circleHoleColor = NSUIColor.black
//        linePoint.colors = [NSUIColor.red]
//        linePoint.drawVerticalHighlightIndicatorEnabled = false
//        linePoint.drawHorizontalHighlightIndicatorEnabled = false
//        linePoint.circleRadius = 5.0
//
//
//        data.addDataSet(lineP)
//        data.addDataSet(lineET)
//        data.addDataSet(linePoint)
//
        setupLine(line: lineP, data: data)
        setupLine(line: lineET, data: data)
        setupLine(line: linePoint, data: data)
        
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
        lineChart.chartDescription?.font = UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.thin)
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.setLabelCount(11, force: true)
        lineChart.leftAxis.setLabelCount(10, force: true)
        lineChart.rightAxis.setLabelCount(10, force: true)
    }
    
    func addLinePoints(sb: [Double], age: [Double]) -> [ChartDataEntry] {
        var lineChartEntry = [ChartDataEntry]()
        for i in 0..<sb.count {
            let value = ChartDataEntry(x: age[i], y: sb[i])
            lineChartEntry.append(value)
        }
        return lineChartEntry
    }
    
    func setupLine(line: LineChartDataSet, data: LineChartData) {
        if line.label == "Phototherapy" {
            line.colors = [NSUIColor.blue]
            line.drawCirclesEnabled = false
            line.drawValuesEnabled = false
        } else if line.label == "Exchange Transfusion" {
            line.colors = [NSUIColor.green]
            line.drawCirclesEnabled = false
            line.drawValuesEnabled = false
        } else {
            line.circleColors = [NSUIColor.black]
            line.circleHoleColor = NSUIColor.black
            line.colors = [NSUIColor.red]
            line.circleRadius = 5.0
        }
        line.drawVerticalHighlightIndicatorEnabled = false
        line.drawHorizontalHighlightIndicatorEnabled = false
        
        data.addDataSet(line)
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
