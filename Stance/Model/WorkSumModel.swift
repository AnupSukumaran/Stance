//
//  WorkSumModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 25/02/2022.
//

import Foundation


class MovementModel {
    
    
    var excerciseTitle: String?
    var numSets: String?
    var reps: String?
    var ibs: String?
    
    internal init(excerciseTitle: String? = nil, numSets: String? = nil, reps: String? = nil, ibs: String? = nil) {
        self.excerciseTitle = excerciseTitle
        self.numSets = numSets
        self.reps = reps
        self.ibs = ibs
    }
    
}

class TimeModel {
    
    var totTitle: String?
    var addedReps: String?
    var totIbs: String?
    var totTime: String?
    
    internal init(totTitle: String? = nil, addedReps: String? = nil, totIbs: String? = nil, totTime: String? = nil) {
        self.totTitle = totTitle
        self.addedReps = addedReps
        self.totIbs = totIbs
        self.totTime = totTime
    }
    
}

class WorkSumModel {
  
    var dateStr: String?
    var timeStr: String?
    var caption: String?
    var timeModel = [TimeModel]()
    var movSecTitle: String?
    var movementModelArr = [MovementModel]()
    
    internal init(dateStr: String? = nil, timeStr: String? = nil, caption: String? = nil, timeModel: [TimeModel] = [TimeModel](), movSecTitle: String? = nil, movementModelArr: [MovementModel] = [MovementModel]()) {
        self.dateStr = dateStr
        self.timeStr = timeStr
        self.caption = caption
        self.timeModel = timeModel
        self.movSecTitle = movSecTitle
        self.movementModelArr = movementModelArr
    }
}
