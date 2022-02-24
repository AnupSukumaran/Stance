//
//  RepCounterViewModel.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 24/02/2022.
//

import UIKit

class RepCounterViewModel: NSObject {
    
    let shapelayer = CAShapeLayer()
    var point:CGFloat = 0
    var count = 0
    var questTimer = Timer()
    var timerHandler: ((String) -> Void)?
    
    var curvedPath:( (UIView) -> UIBezierPath) = { contView in
        return UIBezierPath(roundedRect: contView.bounds, cornerRadius: contView.frame.height/2)
    }
    
    func getCurvedPath(view: UIView) -> UIBezierPath {
        return UIBezierPath(roundedRect: view.bounds, cornerRadius: view.frame.height/2)
    }
    
    //MARK func timer layout
    func graytrack(view: UIView, path: UIBezierPath) ->  CAShapeLayer{
        let trackLayer = CAShapeLayer()
        trackLayer.frame = view.bounds
        trackLayer.path = path.cgPath
        trackLayer.lineCap = .round
        trackLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        trackLayer.strokeColor = #colorLiteral(red: 0.9215685725, green: 0.9215685725, blue: 0.9215685725, alpha: 1)
        trackLayer.lineWidth = 8
        
        trackLayer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        trackLayer.shadowOffset = CGSize(width: 0.0, height: 2.8)
        trackLayer.shadowOpacity = 0.5
        trackLayer.shadowRadius = 0.5
        trackLayer.shouldRasterize = true
    
    
        return trackLayer
    }
    
    func redTrack(view: UIView, path: UIBezierPath) ->  CAShapeLayer {
        shapelayer.frame = view.bounds
        shapelayer.path = path.cgPath
        shapelayer.lineCap = .round
        shapelayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        shapelayer.strokeColor = #colorLiteral(red: 0.3771784306, green: 0.2968975902, blue: 0.9689617753, alpha: 1)
        shapelayer.lineWidth = 8
        shapelayer.strokeEnd = point
        
        shapelayer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        shapelayer.shadowOffset = CGSize(width: 0.0, height: 2.8)
        shapelayer.shadowOpacity = 0.5
        shapelayer.shadowRadius = 0.5
        shapelayer.shouldRasterize = true
        
        return shapelayer
    }
    
    func givingValuesToTimerLabel() -> String {
        count += 1
        let x: CGFloat =  CGFloat(CGFloat(count)/CGFloat(15))
        let z: CGFloat = round(1000 * x)
        point = CGFloat( z / 1000)
        shapelayer.strokeEnd = point
        return String(format: "%01i" , count)
    }
    
    func questTimer(isPaused: Bool) {
        
        switch isPaused {
            
        case true:
            questTimer.invalidate()
            
        case false:
            
            questTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counterAction), userInfo: nil, repeats: true)
            
        }
        
    }
    
    @objc func counterAction() {
        timerHandler?(givingValuesToTimerLabel())
        guard count >= 15 else {return}
        questTimer(isPaused: true)
    }
    

}
