//
//  FirstViewController.swift
//  DemoApp
//
//  Created by Apoorv Srivastava on 05/06/17.
//  Copyright © 2017 MGI. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var varCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(appDelegate.myStruct.firstName! + " " + appDelegate.myStruct.lastName!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return varCount+1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellId:String
        
        if indexPath.row < varCount {
            cellId = "cellIdentifier"
            let cell1 = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
            return cell1
        } else {
            cellId = "cell2"
            let cell2 = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AddTableViewCell
            cell2.addButonTapped = { [weak self] (cell) in
                self?.varCount = (self?.varCount)! + 1
                self?.tableView.reloadData()
            }
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < varCount {
            return 127
        } else {
            return 58
        }
    }

    func addButtonTapped(sender : UIButton){
        
    }
}
