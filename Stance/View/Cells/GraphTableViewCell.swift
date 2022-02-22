//
//  GraphTableViewCell.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 19/02/2022.
//

import UIKit
import Charts

class GraphTableViewCell: UITableViewCell {
    
    
//    @IBOutlet weak var infoLabelStack: UIStackView!
//    @IBOutlet weak var exeLabel: UILabel!
//    @IBOutlet weak var incRateLabel: UILabel!
//    @IBOutlet weak var repsLabels: UILabel!
    @IBOutlet weak var graphBaseView: UIView!
    
    
    var barChart = HorizontalBarChartView()
    var lineChart = LineChartView()
    var graphType: BarLineChartViewBase = BarChartView()
    var cellModel: CellModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func config(){
//        barChart(self.contentView)
//    }
    
    func configV2(chartType: ChartType){
//        infoLabelStack.isHidden = true
//        if let upLabel = cellModel.exeLabel, let addedRep = cellModel.addedReps, let reps = cellModel.reps {
//            exeLabel.text = upLabel
//            incRateLabel.text = addedRep
//            repsLabels.text = reps
//        } else {
//           // infoLabelStack.isHidden = true
//        }
        
       // guard let graph = cellModel.graphType.first else {return}
        
        
        switch chartType {
        case .barGraph:
            graphType = barChart
        case .lineGraph:
            graphType = lineChart
        }
        
        barChart_v2(graphBaseView, chartType: graphType, graphType: chartType)
    }
    
//    override func layoutSubviews() {
//        barChart_v2(graphBaseView, chartType: graphType)
//    }

}

extension GraphTableViewCell {
    
//    func barChart(_ view: UIView) {
//        barChart.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height-10)
//        barChart.center = view.center
//        view.addSubview(barChart)
//
//        var entries = [BarChartDataEntry]()
//
//        for i in 0..<10 {
//            entries.append(BarChartDataEntry(x: Double(i), y: Double(i)))
//        }
//
//        let set = BarChartDataSet(entries: entries)
//        set.colors = ChartColorTemplates.joyful()
//        let data = BarChartData(dataSet: set)
//        barChart.data = data
//    }
    
    func barChart_v2(_ view: UIView, chartType: BarLineChartViewBase?, graphType: ChartType) {
        
        guard let chart = chartType else {return}
        
        chart.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    
        chart.center = view.center
        view.addSubview(chart)
        
        var entries = [BarChartDataEntry]()
        
        for i in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(i), y: Double(i)))
        }
        
        
        switch graphType {
            case .barGraph:
                let set = BarChartDataSet(entries: entries)
                set.colors = ChartColorTemplates.joyful()
                chart.data = BarChartData(dataSet: set)
            
            case .lineGraph:
                let set = LineChartDataSet(entries: entries)
                set.colors = ChartColorTemplates.joyful()
                chart.data = LineChartData(dataSet: set)
        }
        
       
        
        
    
    }
}

