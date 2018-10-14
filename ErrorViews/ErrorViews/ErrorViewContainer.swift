//
//  ErrorViewContainer.swift
//  ErrorViews
//
//  Created by ryoku on 2018/10/14.
//  Copyright © 2018 ryokuhei_sato. All rights reserved.
//

import Foundation
import UIKit

class ErrorViewContainer {
    
    var currentErrors: [Int: ErrorView] = [:]
    
    func showError(message: String, from view: UIView) {
        
        let errorView = ErrorView.instantiate()
        self.currentErrors.updateValue(errorView, forKey: self.currentErrors.count)
        
        self.currentErrors.forEach { (key, currentErrorView) in
            self.moveDown(target: currentErrorView, y: errorView.frame.minY)
            
        }
        
        errorView.showError(message: message, from: view, waitSec: 5.0, completion: {
            self.currentErrors.removeValue(forKey: self.currentErrors.count)
        })

//        self.currentErrors.forEach { (key, errorView) in
//            errorView.showError(at: view, message: message, waitSec: 2, completion: {
//                self.currentErrors.removeValue(forKey: key)
//            })
//        }
    }
    
    func moveDown(target view: ErrorView, y: CGFloat) {
        UIView.animate(withDuration: 1.0, animations: {
            view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.width + y)
        })
    }

}
