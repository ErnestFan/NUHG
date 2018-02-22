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
    
    var age: [Double] = [0.0, 6.0, 12.0, 18.0, 24.0, 30.0, 36.0, 42.0, 48.0, 54.0, 60.0]
    var sb: [Double] = [65.0, 80.0, 100.0, 115.0, 130.0, 145.0, 160.0, 175.0, 187.0, 200.0, 212.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let line = addLinePoints(sb: sb, age: age)
        
        let lineP = LineChartDataSet(values: line, label: "Phototherapy")
        lineP.colors = [NSUIColor.blue]
        let data = LineChartData()
        data.addDataSet(lineP)
        lineChart.data = data
        lineChart.dragEnabled = true
        lineChart.setScaleEnabled(true)
        lineChart.pinchZoomEnabled = true
        
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
