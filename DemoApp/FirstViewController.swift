//
//  FirstViewController.swift
//  DemoApp
//
//  Created by Apoorv Srivastava on 05/06/17.
//  Copyright © 2017 MGI. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var varCount = 1
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(appDelegate.myStruct.firstName! + " " + appDelegate.myStruct.lastName!)
        addNewUser()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addNewUser() {
        var user = User()
        user.firstName = ""
        user.lastName = ""
        self.users .append(user)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return varCount+1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellId:String
        
        if indexPath.row < varCount {
            cellId = "cellIdentifier"
            let cell1 = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
            cell1.firstNameTextField.text = ""
            return cell1
        } else {
            cellId = "cell2"
            let cell2 = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AddTableViewCell
            cell2.addButonTapped = { [weak self] (cell) in
                self?.varCount = (self?.varCount)! + 1
                self?.tableView.reloadData()
            }
            cell2.doneButonTapped = { [weak self] (cell) in
                self?.view.endEditing(true)
            }
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < varCount {
            return 164
        } else {
            return 58
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//    }
}
