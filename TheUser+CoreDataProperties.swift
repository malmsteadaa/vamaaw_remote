//
//  TheUser+CoreDataProperties.swift
//  vamaaw
//
//  Created by admin on 3/10/22.
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
    public var wrappeddob:Date{
            dob ?? Date()
        }
        public var wrappedname:String{
            name ?? ""
        }
        public var wrappedpw:String{
            pw ?? ""
        }
        public var wrappendun:String{
            un ?? ""
        }
        
        public var reviewsArray:[TheReviews]{
            let set = reviews as? Set<TheReviews> ?? []
            return set.sorted{
                $0.wrappeddate < $1.wrappeddate
            }
        }
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
