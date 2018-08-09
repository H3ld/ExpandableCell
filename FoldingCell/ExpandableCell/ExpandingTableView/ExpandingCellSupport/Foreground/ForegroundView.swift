//
//  ForegroundView.swift
//  FoldingCell-Demo
//
//  Created by Alexander Held on 08.08.18.
//  Copyright © 2018 Alex K. All rights reserved.
//

import UIKit

@IBDesignable
class ForegroundView: RotatedView, NibLoadable {
        
    @IBOutlet var tripNumber: UILabel!
    
    @IBOutlet var origin: UILabel!
    @IBOutlet var destination: UILabel!
    
    @IBOutlet var distance: UILabel!
    @IBOutlet var estimatedPace: UILabel!
    @IBOutlet var openSpots: UILabel!
    
    @IBOutlet var day: UILabel!
    @IBOutlet var time: UILabel!

   
    
    override init(frame: CGRect) {
        // properties setup
        super.init(frame: frame)
        setupFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // properties setup
        super.init(coder: aDecoder)
        setupFromNib()
    }
}
