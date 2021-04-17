//
//  ViewController.swift
//  BarChartExample
//
//  Created by Camilo Santos on 16/04/21.
//
import Charts //  https://github.com/danielgindi/Charts
import UIKit

class ViewController: UIViewController, ChartViewDelegate {
    
    var barChart = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        barChart.center = view.center
        view.addSubview(barChart)
        
        var entries = [BarChartDataEntry]()
        var entries2 = [BarChartDataEntry]()
        for x in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(x), y: Double.random(in: 0...1000)))
            entries2.append(BarChartDataEntry(x: Double(x), y: Double.random(in: 0...1000)))
        }
        let set = BarChartDataSet(entries: entries, label: "Cost")
        set.colors = [NSUIColor(red: 70/255.0, green: 128/255.0, blue: 255/255.0,alpha: 0.9)]
        let set2 = BarChartDataSet(entries: entries2, label: "Another value")
        set2.colors = [NSUIColor(red: 0/255.0, green: 84/255.0, blue: 203/255.0,alpha: 0.9)]
        let data = BarChartData(dataSets: [set,set2])
        barChart.data = data
    }
    
}

