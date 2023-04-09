//
//  ViewController.swift
//  CoreDataSavingDataLocalliy
//
//  Created by Mac on 09/04/23.
//

import UIKit

class ViewController: UIViewController ,DataPass{

    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtaddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtmobail: UITextField!
    var i = Int()
    var isUpdate = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func btnshowclick(_ sender: Any) {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "listViewController") as! listViewController
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    @IBAction func btnclicktosave(_ sender: Any) {
        let dict = ["name":txtname.text,"address":txtaddress.text,"city":txtCity.text,"mobail":txtmobail.text]
        if isUpdate{
            DatabaseHelper.shareInstance.editData(object: dict as! [String:String], i: i)
        }else{
            DatabaseHelper.shareInstance.save(object: dict as! [String : String])
        }
    }
    func data(object: [String : String], index: Int, isEdit: Bool) {
        txtname.text = object["name"]
        txtaddress.text = object["address"]
        txtCity.text = object["city"]
        txtmobail.text = object["mobail"]
        i = index
        isUpdate = isEdit
    }
}

