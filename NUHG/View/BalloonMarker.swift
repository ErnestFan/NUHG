//
//  BalloonMarker.swift
//  NUHG
//
//  Created by Ernest Fan on 2018-04-03.
//  Copyright © 2018 ERF. All rights reserved.
//

import Foundation
import UIKit
import Charts

open class XYMarkerView1: BalloonMarker
{
    open var xAxisValueFormatter: IAxisValueFormatter?
    open var yAxisValueFormatter: IAxisValueFormatter?
    fileprivate var yFormatter = NumberFormatter()
    
    public init(color: NSColor, font: NSFont, textColor: NSColor, insets: EdgeInsets, xAxisValueFormatter: IAxisValueFormatter, yAxisValueFormatter : IAxisValueFormatter)
    {
        super.init(color: color, font: font, textColor: textColor, insets: insets)
        self.xAxisValueFormatter = xAxisValueFormatter
        self.yAxisValueFormatter = yAxisValueFormatter
        yFormatter.minimumFractionDigits = 1
        yFormatter.maximumFractionDigits = 1
    }
    
    open override func refreshContent(entry: ChartDataEntry, highlight: Highlight)
    {
        let x = entry.x
        let y = entry.y
        
        setLabel("x: " + xAxisValueFormatter!.stringForValue(x, axis: nil) + ", y: " + yAxisValueFormatter!.stringForValue(y, axis: nil))
    }
}
