//
//  SecondViewController.swift
//  BarChartExample
//
//  Created by Camilo Santos on 16/04/21.
//
import Charts
import UIKit

class SecondViewController: UIViewController, ChartViewDelegate {
    var lineChart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineChart.delegate = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lineChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        var entries = [ChartDataEntry]()
        for x in 0..<10 {
            entries.append(ChartDataEntry(x: Double(x), y: Double.random(in: 0...1000)))
        }
        let set = LineChartDataSet(entries: entries, label: "Cost")
        set.colors = [NSUIColor(red: 70/255.0, green: 128/255.0, blue: 255/255.0,alpha: 0.9)]
        let data = LineChartData(dataSet: set)
        lineChart.data = data
    }
    
}
