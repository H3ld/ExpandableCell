//
//  ContainerView.swift
//  FoldingCell-Demo
//
//  Created by Alexander Held on 08.08.18.
//  Copyright © 2018 Alex K. All rights reserved.
//

import UIKit
import MapKit

@IBDesignable
class ContainerView: UIView, NibLoadable {
    
    // MARK: - FIRST VIEW
    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var tripNumber: UILabel!
    @IBOutlet weak var openSlots: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var preferredPace: UILabel!
    
    // MARK: - SECOND VIEW
    
    // - AuthorDetails
    @IBOutlet weak var authorPicture: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var authorRating: UIImageView!
    // - TripDetails
    @IBOutlet weak var originDescription: UILabel!
    @IBOutlet weak var originCityZip: UILabel!
    @IBOutlet weak var destinationDescription: UILabel!
    @IBOutlet weak var destinationCityZip: UILabel!
    
    // MARK: - THIRD VIEW
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var startDate: UILabel!
    
    // MARK: - FOURTH VIEW
    @IBOutlet weak var map: MKMapView!
    
    // BOTTOM VIEW
    @IBOutlet weak var applyingDrivers: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
}
