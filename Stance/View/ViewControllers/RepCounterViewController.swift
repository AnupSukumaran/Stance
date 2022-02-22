//
//  RepCounterViewController.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 22/02/2022.
//

import UIKit

class RepCounterViewController: UIViewController {

    @IBOutlet weak var counterView: UIView!
    @IBOutlet weak var countLB: UILabel!
    
    let shapelayer = CAShapeLayer()
    var point:CGFloat = 0
    var count = 10
    var questTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        creatingTimeLayout()
        questTimer(isPaused: false)
    }
    
    func creatingTimeLayout() {
        
        counterView.layer.cornerRadius = counterView.frame.height/2
        let curverPath = UIBezierPath(roundedRect: counterView.bounds, cornerRadius: counterView.frame.height/2)
        forTheTimerGraytrack(curverPath: curverPath)
        forTheTimerRedTrack(curverPath: curverPath)
        
    }
    
    //MARK func timer layout
    func forTheTimerGraytrack(curverPath: UIBezierPath) {
        let trackLayer = CAShapeLayer()
        trackLayer.frame = counterView.bounds
        trackLayer.path = curverPath.cgPath
        trackLayer.lineCap = .round
        trackLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        trackLayer.strokeColor = #colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1)
        trackLayer.lineWidth = 10
        counterView.layer.addSublayer(trackLayer)
    }
    
    //MARK func timer layout
    func forTheTimerRedTrack(curverPath: UIBezierPath) {
        shapelayer.frame = counterView.bounds
        shapelayer.path = curverPath.cgPath
        shapelayer.lineCap = .round
        shapelayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        shapelayer.strokeColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        shapelayer.lineWidth = 6
        shapelayer.strokeEnd = point
        counterView.layer.addSublayer(shapelayer)
    }
    
    func givingValuesToTimerLabel() {
       // print("givingValuesToTimerLabel")
        count -= 1
        point += 0.1
        shapelayer.strokeEnd = point
        countLB.text = String(format: "%02i" , count)
        updateQTimeLabel()
    }
    
    func questTimer(isPaused: Bool) {
        print("QuestTimer = \(isPaused)")
        switch isPaused {
            
        case true:
            questTimer.invalidate()
            
        case false:
            
            questTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counterAction), userInfo: nil, repeats: true)
            
        }
        
    }
    
    @objc func counterAction() {
        
        givingValuesToTimerLabel()
        
    }
    
    func updateQTimeLabel() {
 
        
        if(count > 6) {
    
            
        } else if (count <= 6 && count >= 1) {

           
            
        } else if (count == 0) {
            questTimer(isPaused: true)
            
        }
        
        
    }

}
