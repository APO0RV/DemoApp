//
//  ViewController.swift
//  DemoApp
//
//  Created by Apoorv Srivastava on 02/06/17.
//  Copyright © 2017 MGI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        appDelegate.myStruct.firstName = "Apoorv"
        appDelegate.myStruct.lastName = "Srivastava"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

