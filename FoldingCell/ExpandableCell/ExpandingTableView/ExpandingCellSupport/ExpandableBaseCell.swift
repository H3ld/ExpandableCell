//
//  FoldingTableViewCell.swift
//  FoldingCell-Demo
//
//  Created by Alexander Held on 08.08.18.
//  Copyright © 2018 Alex K. All rights reserved.
//

import UIKit

class ExpandableBaseCell: FoldingCell {

    @IBOutlet var foreground: ForegroundView!
    @IBOutlet var container: ContainerView!
    
    
    var number: Int = 0 {
        didSet {
            foreground.tripNumber.text = "# \(number)"
            container.tripNumber.text = "# \(number)"
        }
    }
    
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //check that there are no current subviews
        if self.subviews.count == 0 {
            self.setupNib()
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //check that there are no current subviews
        if self.subviews.count == 0 {
            self.setupNib()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        self.awakeFromNib()
    }
    
    func setupNib(){
        let bundle = Bundle(for: ExpandableBaseCell.self)
        guard let customView = bundle.loadNibNamed("ExpandableBaseCell",owner: self, options: nil)?.first as? ExpandableBaseCell else {
            return
        }
        customView.frame = self.bounds
        self.addSubview(customView)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.foregroundView.layer.cornerRadius = 10
        self.foregroundView.layer.masksToBounds = true
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.masksToBounds = true
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
}

