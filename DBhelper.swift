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
    
    enum TypeOfSerevice{
        case Food
        case Gym
        case Room
    }
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    static var inst=DBhelper()
    
    func GetUser(n: String)->TheUser{
        var stu = TheUser()
        
        var fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "TheUser")
        fReq.predicate=NSPredicate(format:"un == %@", n)
        fReq.fetchLimit=1
        do{
            
            let req = try context?.fetch(fReq) as! [TheUser]
            if(req.count != 0){
                stu = req.first as! TheUser
            }else{
                print("no such data")
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
            
            let req = try context?.fetch(fReq) as! [TheUser]
            if(req.count != 0){
                return true
            }else{
                print("no such data")
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
        }catch{
                print("Data not saved.")
        }
    }
    func UpdateUserNameDOB(n:String,name:String,dob:Date){
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
        func GetReview(id:UUID)->TheReviews{
            var re = TheReviews()
            
            var fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "TheReview")
            fReq.predicate=NSPredicate(format:"id == %@", id as CVarArg)
            fReq.fetchLimit=1
            do{
                
                let req = try context?.fetch(fReq) as! [TheReviews]
                if(req.count != 0){
                    re = req.first as! TheReviews
                }else{
                    print("no such data")
                }
            }catch{
                print("cant retrieve data")
            }
            
            return re
        }
    func getTypeReview(a:TypeOfSerevice)->[TheReviews]{
        var re = [TheReviews]()
        
        var fReq = NSFetchRequest<NSFetchRequestResult>(entityName: "TheReview")
        fReq.predicate=NSPredicate(format:"tos == %@", a as! CVarArg)
        
        do{
            
            let re = try context?.fetch(fReq) as! [TheReviews]
            if(re.count == 0){
               
                print("no such data")
            }
        }catch{
            print("cant retrieve data")
        }
        return re    }
    func GetReviews()->[TheReviews]{
        var re = [TheReviews]()
        return re
    }
    
    
    func UpdateReview(id:UUID, date: Date, rating:UUID, comments:String){}
    
    func PushReview(type:String, date: Date, rating:UUID, comments:String){}
    
    func DeleteReview(){}
}
