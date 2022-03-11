//
//  ReviewCDTAbleViewController.swift
//  vamaaw
//
//  Created by admin on 3/10/22.
//

import UIKit
import CoreData

class ReviewCDTAbleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    enum TypeOfSerevice: String, CaseIterable{
        case Food="Food"
        case Gym="Gym"
        case Room="Room"
    }
    var us:TheUser=LoginViewController.UserName ?? DBhelper.inst.GetUser(n: "2")
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"reviewTableViewCell", for: indexPath) as! reviewTableViewCell
        let review = self.reviews?[indexPath.row]
        cell.rate.text=String(format:"%d",review?.wrappedrating as! CVarArg)
        cell.title.text=review?.wrappedtitle
        cell.day.text=formatDate(date: review!.wrappeddate)
        
        return cell
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
    @IBOutlet weak var tableView: UITableView!
    var reviews:[TheReviews]?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
fetchReviews()
        
        // Do any additional setup after loading the view.
    }
    //c
    @IBAction func addTapped(_ sender: Any){
        
        //new
        let newReview = TheReviews(context: self.context)
        //add relationship
        us.addToReviews(newReview)
        //save
        do{try self.context.save()}catch{}
        //add to table
        self.fetchReviews()
    }
    //r
    func fetchReviews(){
        //fetch from core data
        do{
            //request specific
//            let request = TheReviews.fetchRequest() as NSFetchRequest<TheReviews>
//            let pred = NSPredicate(format: "tos == %@", TypeOfSerevice.Gym.rawValue)
//            request.predicate=pred
//            us.reviewsArray
//            self.reviews = try context.fetch(request)
//            //all
            try self.reviews = context.fetch(TheReviews.fetchRequest())
            
                self.tableView.reloadData()
            
        }catch{}
    }
    //u
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //get selected rev
        let rev = self.reviews![indexPath.row]
        //update rev
        //save
        do {try self.context.save()} catch{}
        //relaunch
        fetchReviews()
    }
    //d
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete"){action, view, completionHandler in
                      //which
            let reviewToRemove = self.reviews![indexPath.row]
            //remove
            self.context.delete(reviewToRemove)
            //save
            do{try self.context.save()}catch{}
            //relaucn table
                self.fetchReviews()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LoginViewController.UserName=DBhelper.inst.GetUser(n: us.wrappedname)
        fetchReviews()
        tableView.reloadData()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preparing")
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowDetail"{
            print("show Detail")
            let detailVC = segue.destination as! aReviewViewController
            // Get the new view controller using segue.destination.
            if let selectedCell = sender as? reviewTableViewCell{
                let indexPath = tableView.indexPath(for: selectedCell)!
                
                let selectedItem = reviews![indexPath.row]
                detailVC.Rev = selectedItem
            }
        }
        else if segue.identifier == "AddItem"{
            print("AddItem")
            let detailVC = segue.destination as! aReviewViewController
            // Get the new view controller using segue.destination.
             var rev = TheReviews(context: self.context)
            us.addToReviews(rev)
            detailVC.Rev = rev
            do{try self.context.save()}catch{}
            
        }
    }
    
    
    
}
