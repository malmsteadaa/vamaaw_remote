//
//  TheReviews+CoreDataProperties.swift
//  vamaaw
//
//  Created by admin on 3/8/22.
//
//

import Foundation
import CoreData


extension TheReviews {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TheReviews> {
        return NSFetchRequest<TheReviews>(entityName: "TheReviews")
    }

    @NSManaged public var commets: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var rating: Int16
    @NSManaged public var tos: String?
    @NSManaged public var user: TheUser?

}

extension TheReviews : Identifiable {

}
