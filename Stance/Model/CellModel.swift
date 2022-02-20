//
//  CellModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import Foundation
import Charts

enum ChartType{
    case barGraph
    case lineGraph
}

class CellModel {
    
    
    var exeLabel: String?
    var addedReps: String?
    var reps: String?
    var graphType: ChartType?
    
    internal init(exeLabel: String? = nil, addedReps: String? = nil, reps: String? = nil, graphType: ChartType? = nil) {
        self.exeLabel = exeLabel
        self.addedReps = addedReps
        self.reps = reps
        self.graphType = graphType
    }
    
}
