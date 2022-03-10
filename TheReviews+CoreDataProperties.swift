//
//  TheReviews+CoreDataProperties.swift
//  vamaaw
//
//  Created by admin on 3/10/22.
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
    @NSManaged public var rating: Int16
    @NSManaged public var title: String?
    @NSManaged public var tos: String?
    @NSManaged public var user: TheUser?
    public var wrappedcomments:String{
               commets ?? "Defualt Comments"
           }
           public var wrappeddate:Date{
               date ?? Date()
           }
           
           public var wrappedrating:Int16{
               rating
           }
           public var wrappedtos:String{
               tos ?? "type"
           }
       public var wrappedtitle:String{
           title ?? "SomeTitle"
       }
}

extension TheReviews : Identifiable {

}
