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
    var addedTime: String?
    
    internal init(totTitle: String? = nil, addedReps: String? = nil, totIbs: String? = nil, totTime: String? = nil, addedTime: String? = nil) {
        self.totTitle = totTitle
        self.addedReps = addedReps
        self.totIbs = totIbs
        self.totTime = totTime
        self.addedTime = addedTime
    }
    
}

class WorkSumSectionData {
    
    
    var movSecTitle: String?
    var timeModel = [TimeModel]()
    var movementModelArr = [MovementModel]()
    
    internal init(movSecTitle: String? = nil, timeModel: [TimeModel] = [], movementModelArr: [MovementModel] = []) {
        self.movSecTitle = movSecTitle
        self.timeModel = timeModel
        self.movementModelArr = movementModelArr
    }
    
}


class WorkSumModel {
  
    var id: Int?
    var viewTitle: String?
    var caption: String?
    var workSumSectionData = [WorkSumSectionData]()
    
    internal init(id:Int? = nil, viewTitle: String? = nil, caption: String? = nil, workSumSectionData: [WorkSumSectionData] = []) {
        self.id = id
        self.viewTitle = viewTitle
        self.caption = caption
        self.workSumSectionData = workSumSectionData
       
    }
}
