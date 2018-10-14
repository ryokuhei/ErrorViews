//
//  ViewController.swift
//  ErrorViews
//
//  Created by ryoku on 2018/10/13.
//  Copyright © 2018 ryokuhei_sato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var insetView: UIView!
    
    var errorViews = ErrorViewContainer()
    var errorViews2 = ErrorViewContainer()
    
    @IBAction func tappedInsetButton(_ sender: UIButton) {
        ErrorView.instantiate().showError(message: "test", from: self.insetView)
//        errorViews2.showError(message: "Error \(errorViews2.currentErrors.count)", from: self.insetView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tappedButton(_ sender: Any) {
        
        errorViews.showError(message: "Error \(errorViews.currentErrors.count)", from: self.view)

    }
}

