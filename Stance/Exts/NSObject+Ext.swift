//
//  NSObject+Ext.swift
//  Stance
//
//  Created by Sukumar Anup Sukumaran on 20/02/2022.
//

import UIKit


extension NSObject {
    
    //MARK: Adapt view for iPhone only
    func adjustViewForIPhonesOnly2<T>( fourAndS: T, fiveAndS: T, sixSevenEight: T, forPlus: T, xAndxs: T, xr: T, xsMax: T ) -> T? {
        let screenType = UIDevice.current.screenType
        
        switch screenType {
        case .iPhones_4_4S:
            return fourAndS
            
        case .iPhones_5_5s_5c_SE:
            return fiveAndS
            
        case .iPhones_6_6s_7_8:
            return sixSevenEight
            
        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            return forPlus
            
        case .iPhones_X_XS:
            return xAndxs
            
        case .iPhone_XR:
            return xr
            
        case .iPhone_XSMax:
            return xsMax
            
        default:
            return T.self as? T
        }
        
    }
    
}
