//
//  aReviewViewController.swift
//  vamaaw
//
//  Created by admin on 3/9/22.
//

import UIKit
import Foundation

class aReviewViewController: UIViewController {
var Rev:TheReviews?
    enum TypeOfSerevice: String, CaseIterable{
        case Food="Food"
        case Gym="Gym"
        case Room="Room"
    }
    @IBOutlet weak var aStack: RatingCon!
    
    @IBOutlet weak var t: UIButton!
    @IBOutlet weak var c: UITextField!
    @IBOutlet weak var d: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        t.showsMenuAsPrimaryAction=true
        t.menu=addMenuItems()

        // Do any additional setup after loading the view.
        //init date picker
                let datepicker = UIDatePicker()
                datepicker.datePickerMode = .date
                datepicker.addTarget(self, action: #selector(dateChange(datepicker:)), for: UIControl.Event.valueChanged)
                datepicker.frame.size=CGSize(width: 0, height: 300)
                datepicker.preferredDatePickerStyle = .wheels
                
                d.inputView=datepicker
        
        d.text=formatDate(date: Rev?.date ?? Date())
        c.text=Rev?.commets ?? ""
        
        t.setTitle(Rev?.tos ?? "Type", for: .normal)
        if Rev != nil{
            aStack.starsRating=Int(Rev!.rating)
        }
    }
    
    
    
    @objc func dateChange(datepicker: UIDatePicker){
        d.text=formatDate(date: datepicker.date)
    }
    func formatDate(date: Date)->String
    {
        let formatter = DateFormatter()
        formatter.dateFormat="MMMM dd yyyy"
        return formatter.string(from: date)
    }
    func formatetoDate(s:String)->Date{
        print("format to date",s)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat="MMMM dd, yyyy"
        return formatter.date(from: s)!
    }
   
    func addMenuItems()->UIMenu{
        let menuItems = UIMenu(title: "", options: .displayInline, children: [
            UIAction(title: "Food", image: UIImage(systemName: "trash")){ _ in
                self.t.setTitle(TypeOfSerevice.Food.rawValue, for: .normal)
            },
            UIAction(title: "Gym", image: UIImage(systemName: "trash")){_ in
                self.t.setTitle(TypeOfSerevice.Gym.rawValue, for: .normal)
            },
            UIAction(title: "Room", image: UIImage(systemName: "trash")){_ in
                self.t.setTitle(TypeOfSerevice.Room.rawValue, for: .normal)
            }
        ])
        return menuItems
    }
    

    @IBAction func save(_ sender: Any) {
        if Rev == nil{
            Rev = TheReviews()
            Rev?.tos=t.currentTitle!
            Rev?.date=formatetoDate(s: d.text!)
            Rev?.rating=Int16(aStack.starsRating)
            Rev?.commets=c.text!
            LoginViewController.UserName?.addToReviews(Rev!)
            cancel("")
        }else{
            DBhelper.inst.UpdateReview(id: (Rev?.id)!, date: formatetoDate(s: d.text!), rating: Int16(aStack.starsRating), comments: c.text!, tos: t.currentTitle!)
            cancel("")
        }
    }
    @IBAction func cancel(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
     @IBAction func dea(_ sender: Any) {
         if Rev == nil{
             cancel("")
         }else{
             LoginViewController.UserName?.removeFromReviews(Rev!)
             cancel("")
         }
     }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
