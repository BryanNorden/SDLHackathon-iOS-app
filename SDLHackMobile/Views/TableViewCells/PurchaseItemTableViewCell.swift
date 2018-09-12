//
//  PurchaseItemTableViewCell.swift
//  SDLHackMobile
//
//  Created by Bryan Norden on 9/11/18.
//  Copyright © 2018 Bryan Norden. All rights reserved.
//

import UIKit

final class PurchaseItemTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var ticketView: UIView! {
        didSet {
            ticketView.layer.cornerRadius = 10
            ticketView.clipsToBounds = true
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    @IBOutlet private weak var ticketImageView: UIImageView!
    
    func configure(_ item: PurchaseItem) {
        titleLabel.text = item.title
        dateLabel.text = item.dateString
        locationLabel.text = item.location
        priceLabel.text = "$\(item.price)"
        
        ticketImageView?.image = item.image
    }

}

struct PurchaseItem {
    var title: String
    var dateString: String
    var location: String
    var price: Int
    var image: UIImage
}
