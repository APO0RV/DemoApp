//
//  FirstViewController.swift
//  DemoApp
//
//  Created by Apoorv Srivastava on 05/06/17.
//  Copyright © 2017 MGI. All rights reserved.
//

import UIKit
import AlamofireImage

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIScrollViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var user = User()
//    var crews = [Crew]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(appDelegate.myStruct.firstName! + " " + appDelegate.myStruct.lastName!)
        
        user.firstName = "Apoorv"
        user.lastName = "Srivastava"
        addNewCrew()
        
        let crew = Crew()
        crew.imageURL = "https://www.gstatic.com/webp/gallery3/5.png"
        self.user.crews.append(crew)
        let crew1 = Crew()
        crew1.imageURL = "https://www.gstatic.com/webp/gallery3/2.png"
        self.user.crews.append(crew1)
        let crew2 = Crew()
        crew2.imageURL = "https://www.gstatic.com/webp/gallery3/3.png"
        self.user.crews.append(crew2)
        let crew3 = Crew()
        crew3.imageURL = "https://www.gstatic.com/webp/gallery3/4.png"
        self.user.crews.append(crew3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addNewCrew() {
        let crew = Crew()
        crew.imageURL = "https://www.gstatic.com/webp/gallery3/1.png"
        self.user.crews.append(crew)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.user.crews.count+1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellId:String
        
        if indexPath.row < self.user.crews.count {
            cellId = "cellIdentifier"
            let cell1 = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
            cell1.contentView.tag = indexPath.row
            let crew = self.user.crews[indexPath.row]
            cell1.firstNameTextField.text = crew.firstName
            cell1.lastNameTextField.text = crew.lastName
            cell1.myImageView.af_setImage(withURL: URL(string: crew.imageURL!)!)
            return cell1
        } else {
            cellId = "cell2"
            let cell2 = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AddTableViewCell
            cell2.addButonTapped = { [weak self] (cell) in
                self?.addNewCrew()
                self?.tableView.reloadData()
            }
            cell2.doneButonTapped = { [weak self] (cell) in
                self?.view.endEditing(true)
            }
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < self.user.crews.count {
            return 164
        } else {
            return 58
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let index = textField.superview?.tag
        let cell = tableView.cellForRow(at: NSIndexPath(row: index!, section: 0) as IndexPath) as! TableViewCell
        let crew = self.user.crews[index!]
        crew.firstName = cell.firstNameTextField.text
        crew.lastName = cell.lastNameTextField.text
        
        appDelegate.user = self.user
        print(appDelegate.user)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
}
