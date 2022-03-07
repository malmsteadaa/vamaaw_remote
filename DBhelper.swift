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
    func UpdateUser(n:String,name:String,dob:Date,pw:String,cpw:String){
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
                if pw != ""{
                    if pw == cpw{
                        st.pw=pw
                    }else{
                        print("error mix match passwords")
                    }
                    
                }
                try context?.save()
                print("updated", st.un!)
            }
        }catch{
            print("error on update")
        }
    }
        func GetReview(id:Int16)->TheReviews{
            var re = TheReviews()
            return re
        }
    func GetReviews()->[TheReviews]{
        var re = [TheReviews]()
        return re
    }
    func GetFoodReview()->[TheReviews]{
        var re = [TheReviews]()
        return re
    }
    func GetRoomReview()->[TheReviews]{
        var re = [TheReviews]()
        return re
    }
    func GetGymReview()->[TheReviews]{
        var re = [TheReviews]()
        return re
    }
    
    func UpdateFoodReview(id:Int16, date: Date, rating:Int16, comments:String){}
    func UpdateRoomReview(id:Int16, date: Date, rating:Int16, comments:String){}
    func UpdateGymReview(id:Int16, date: Date, rating:Int16, comments:String){}
    
    func PushReview(type:String, date: Date, rating:Int16, comments:String){}
    
    func DeleteReview(){}
}
