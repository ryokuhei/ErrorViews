//
//  ErrorView.swift
//  ErrorViews
//
//  Created by ryoku on 2018/10/13.
//  Copyright © 2018 ryokuhei_sato. All rights reserved.
//

import Foundation
import UIKit

class ErrorView: UIView {
    
//    static var currentErrors: [Int: ErrorView] = [:]
    var isCompleted: Bool = false
    
    var widthSpase: CGFloat = 4
    var height: CGFloat = 80
    
    @IBOutlet weak var message: UILabel!
    
    static func instantiate() -> ErrorView {
        
        let errorView = Bundle.main.loadNibNamed("ErrorView", owner: self, options: nil)?.first as! ErrorView
        return errorView
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setupView()
    }
    
    private func setupView() {
        self.isHidden = true
        self.layer.cornerRadius = 20
    }

    private func setFrame(target view: UIView) {
        view.clipsToBounds = true
        
        let topSafeArea = view.safeAreaInsets.top
        
        let x      = view.bounds.minX + widthSpase
        let y      = view.bounds.minY - self.height + topSafeArea
        let width  = view.bounds.width - (widthSpase * 2)
        let height = self.height
        
        self.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    func showError(message: String, from view: UIView, waitSec: TimeInterval = 5.0, completion: (() -> Void)? = nil) {
        
        view.addSubview(self)
        setFrame(target: view)

        self.message.text = message
        self.isHidden = false
        
//        ErrorView.currentErrors.updateValue(self, forKey: ErrorView.currentErrors.count)
        
//        ErrorView.currentErrors.forEach { (key, errorView) in
            
            // errorViewを指定位置へ移動
            UIView.animate(withDuration: 1.0, animations: {
//                errorView.center.y += errorView.bounds.height + 2
                self.center.y += self.bounds.height + 2
    
            }, completion: { _ in
    
                // errorViewを表示後、viewを上昇させ削除
                UIView.animate(withDuration: 1.0, delay: waitSec, options: UIView.AnimationOptions.curveEaseInOut, animations: {
//                    errorView.center.y -= errorView.bounds.height + 2
                    self.center.y -= self.bounds.height + 2
                }, completion: { _ in
    
                    self.isHidden = true
    
                    if self.isCompleted == false {
                        self.isCompleted = true
    
                        completion?()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                            self.removeFromSuperview()
                        })
                    }
                })
            })
            
//        } // end ForEach

    }
    
}
