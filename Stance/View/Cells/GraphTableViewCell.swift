//
//  GraphTableViewCell.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 19/02/2022.
//

import UIKit
import Charts

class GraphTableViewCell: UITableViewCell {
    
    var barChart = BarChartView()
//    var lineChart = LineChartView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(){
        barChart(self.contentView)
    }

}

extension GraphTableViewCell {
    
    func barChart(_ view: UIView) {
        barChart.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height-10)
        barChart.center = view.center
        view.addSubview(barChart)
        
        var entries = [BarChartDataEntry]()
        
        for i in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(i), y: Double(i)))
        }
        
        
        
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        let data = BarChartData(dataSet: set)
        barChart.data = data
    }
}

