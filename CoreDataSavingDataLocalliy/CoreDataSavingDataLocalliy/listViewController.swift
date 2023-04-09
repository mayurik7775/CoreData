//
//  listViewController.swift
//  CoreDataSavingDataLocalliy
//
//  Created by Mac on 12/04/23.
//

import UIKit
protocol DataPass {
    func data(object:[String:String], index:Int, isEdit : Bool)
}

class listViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var student = [Student]()
    var delegate : DataPass!
    
    @IBOutlet weak var tableview: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       student = DatabaseHelper.shareInstance.getStudentData()
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return student.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell : TableViewCell = tableview.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.student = student[indexPath.row]
            return cell
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        211
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            student = DatabaseHelper.shareInstance.deletData(index: indexPath.row)
            self.tableview.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name": student[indexPath.row].name,"address":student[indexPath.row].address,"city": student[indexPath.row].city,"mobail":student[indexPath.row].mobail]
        delegate.data(object: dict as! [String:String], index: indexPath.row , isEdit: true)
        self.navigationController?.popViewController(animated: true)
    }
    }
    

