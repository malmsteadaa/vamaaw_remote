//
//  DBhelper.swift
//  vamaaw
//
//  Created by admin on 3/7/22.
//

import Foundation
import UIKit
import CoreData
class DBhelper{
    enum TypeOfSerevice: String, CaseIterable{
        case Food="Food"
        case Gym="Gym"
        case Room="Room"
    }
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    static var inst=DBhelper()
    func reset(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TheUser")
          fetchRequest.returnsObjectsAsFaults = false
          do {
              let results = try context?.fetch(fetchRequest) as! [TheUser]
              for object in results {
                  guard let objectData = object as? NSManagedObject else {continue}
                  context?.delete(objectData)
              }
          } catch let error {
              print("Detele all data in \("TheUser") error :", error)
          }
        let fetchRequest2 = NSFetchRequest<NSFetchRequestResult>(entityName: "TheReviews")
          fetchRequest2.returnsObjectsAsFaults = false
          do {
              let results = try context?.fetch(fetchRequest2) as! [TheReviews]
              for object in results {
                  guard let objectData = object as? NSManagedObject else {continue}
                  context?.delete(objectData)
              }
          } catch let error {
              print("Detele all data in \("TheReviews") error :", error)
          }
        let secItemClasses = [kSecClassGenericPassword, kSecClassInternetPassword, kSecClassCertificate, kSecClassKey, kSecClassIdentity]
        for itemClass in secItemClasses {
            let spec: NSDictionary = [kSecClass: itemClass]
            SecItemDelete(spec)
        }
        
    }
    func GetUser(n: String)->TheUser{
        var stu = TheUser()
        
        var fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "TheUser")
        fReq.predicate=NSPredicate(format:"un == %@", n)
        fReq.fetchLimit=1
        do{
            
            let req = try context?.fetch(fReq) as! [TheUser]
            if(req.count != 0){
                print("we have a user")
                print(req.first!.un)
                stu = req.first!
            }else{
                print("no such user data")
            }
        }catch{
            print("cant retrieve data")
        }
        
        return stu
    }
    func HasUser(n: String)->Bool{
        
        
        var fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "TheUser")
        fReq.predicate=NSPredicate(format:"un == %@", n)
        fReq.fetchLimit=1
        do{
            print("in do block")
            let req = try context?.fetch(fReq) as! [TheUser]
            if(req.count != 0){
                return true
            }else{
                print("no user such data")
            }
        }catch{
            print("cant retrieve data")
        }
        
        return false
    }
    func addUser(un:String,name:String,dob:Date,pw:String){
        let stu = NSEntityDescription.insertNewObject(forEntityName: "TheUser", into: context!) as! TheUser
        //give the new instance data
        stu.name=name
        stu.un=un
        stu.dob=dob
        stu.pw=pw
        //try to save data
        do{
            try context?.save()
            print("saved")
        }catch{
                print("Data not saved.")
        }
    }
    func UpdateUserNameDOB(n:String,name:String,dob:Date?){
        var st = TheUser()
        var freq=NSFetchRequest<NSManagedObject>.init(entityName: "TheUser")
        freq.predicate=NSPredicate(format: "un == %@", n)
        do{
            let stu = try context?.fetch(freq)
            if(stu?.count != 0){
                st = stu?.first as! TheUser
                if name != ""{
                    st.name = name}
                if dob != nil{
                    st.dob = dob}
                
                try context?.save()
                print("updated", st.un!)
            }
        }catch{
            print("error on update")
        }
    }
    func UpdateUserPW(n:String,pw:String){
        //coredata
        var st = TheUser()
        var freq=NSFetchRequest<NSManagedObject>.init(entityName: "TheUser")
        freq.predicate=NSPredicate(format: "un == %@", n)
        do{
            let stu = try context?.fetch(freq)
            if(stu?.count != 0){
                st = stu?.first as! TheUser
                st.pw=pw
                try context?.save()
                print("updated", st.un!)
            }
        }catch{
            print("error on update")
        }
        //keyChain
        let q1:[String:Any] = [kSecClass as String: kSecClassGenericPassword, kSecAttrAccount as String : n]
        let att1 : [String:Any] = [kSecValueData as String : pw.data(using: .utf8)!]
        if SecItemUpdate(q1 as CFDictionary, att1 as CFDictionary) == noErr{
            print("It was updated")
        }else{
            print("It wasn't updated")
            
        }
    }
    
    
    
    //REVIEWS
        func GetReview(id:NSManagedObjectID)->TheReviews{
            var re = context?.object(with: id) as! TheReviews
            
            return re
        }
    
    func getTypeReview(a:TypeOfSerevice)->[TheReviews]{
        var re = [TheReviews]()
        var pred=NSPredicate(format:"tos == %@", a as! CVarArg)
        re = LoginViewController.UserName?.reviews?.filtered(using: pred) as! [TheReviews]
        return re
        
    }
    func getRelation(u:TheUser,r:TheReviews){
        u.addToReviews(r)
    }
    
    
    func UpdateReview(id:NSManagedObjectID, title:String, date: Date, rating:Int16, comments:String, tos:String){
        var st = TheReviews()
        var freq=NSFetchRequest<NSManagedObject>.init(entityName: "TheReviews")
        do{
            
            let stu = try context?.fetch(freq)
            var r = context?.object(with: id) as! TheReviews
            
            if(stu?.count != 0){
                st = stu?.first as! TheReviews
                
                if comments != ""{
                    st.commets = comments}
                if date != nil{
                    st.date = date}
                if rating != nil{
                    st.rating=rating
                }
                if tos != ""{
                    st.tos=tos
                }
                
                try context?.save()
                print("updated", st.id)
            }
        }catch{
            print("error on update")
        }
    }
    
    
}
