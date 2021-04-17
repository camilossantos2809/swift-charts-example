//
//  SecondViewController.swift
//  BarChartExample
//
//  Created by Camilo Santos on 16/04/21.
//
import Charts
import TinyConstraints
import UIKit

class SecondViewController: UIViewController, ChartViewDelegate {
    var lineChart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineChart.delegate = self
        view.addSubview(lineChart)
        lineChart.centerInSuperview()
        lineChart.width(to: view)
        lineChart.heightToWidth(of: view)
        
        lineChart.backgroundColor = .white
//        lineChart.tintColor = NSUIColor(red: 70/255.0, green: 128/255.0, blue: 255/255.0,alpha: 0.9)
        
        lineChart.rightAxis.enabled = false
        let yAxis = lineChart.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 10)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .black
        yAxis.axisLineColor = .white
        let xAxis = lineChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .boldSystemFont(ofSize: 12)
        xAxis.setLabelCount(6, force: false)
        xAxis.labelTextColor = .black
        
        lineChart.animate(xAxisDuration: 1, easingOption: ChartEasingOption.easeInOutQuad)
        
        setData()
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    private func setData() {
        let set1 = LineChartDataSet(entries: buildEntries(qtd: 25), label: "set1")
        set1.drawCirclesEnabled = false
        set1.mode = .linear
        set1.lineWidth = 2
        set1.setColor(NSUIColor(red: 210/255.0, green: 20/255.0, blue: 25/255.0,alpha: 0.9))
        set1.fill = Fill(color: NSUIColor(red: 210/255.0, green: 20/255.0, blue: 25/255.0,alpha: 0.9))
        set1.fillAlpha = 0.5
        set1.drawFilledEnabled = true
        
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        lineChart.data = data
    }

    private func buildEntries(qtd: Int)-> [ChartDataEntry]{
        var entries = [ChartDataEntry]()
        for x in 0..<qtd {
            entries.append(ChartDataEntry(x: Double(x), y: Double.random(in: 0...1000)))
        }
        return entries
    }
}
