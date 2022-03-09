//
//  File.swift
//  vamaaw
//
//  Created by admin on 3/9/22.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {

    let ID = UILabel()
    let labMessage = UILabel()
    let day = UILabel()
    let rate = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()


        ID.translatesAutoresizingMaskIntoConstraints = false
        labMessage.translatesAutoresizingMaskIntoConstraints = false
        day.translatesAutoresizingMaskIntoConstraints = false
        rate.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(rate)
        contentView.addSubview(ID)
        contentView.addSubview(labMessage)
        contentView.addSubview(day)

        let viewsDict = [
            "ID": ID,
            "message": labMessage,
            "day": day,
            "rate": rate
        ]
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[rate]", options: [], metrics: nil, views: viewsDict))

        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[day]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[ID]-[message]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[username]-[rate]-|", options: [], metrics: nil, views: viewsDict))

    
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[message]-[day]-|", options: [], metrics: nil, views: viewsDict))
    }

}
