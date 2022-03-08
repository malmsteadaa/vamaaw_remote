//
//  TheUser+CoreDataProperties.swift
//  vamaaw
//
//  Created by admin on 3/8/22.
//
//

import Foundation
import CoreData


extension TheUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TheUser> {
        return NSFetchRequest<TheUser>(entityName: "TheUser")
    }

    @NSManaged public var dob: Date?
    @NSManaged public var name: String?
    @NSManaged public var pw: String?
    @NSManaged public var un: String?
    @NSManaged public var reviews: NSSet?

}

// MARK: Generated accessors for reviews
extension TheUser {

    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: TheReviews)

    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: TheReviews)

    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSSet)

    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSSet)

}

extension TheUser : Identifiable {

}
