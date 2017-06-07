//
//  Model.swift
//  DemoApp
//
//  Created by Apoorv Srivastava on 05/06/17.
//  Copyright © 2017 MGI. All rights reserved.
//

import Foundation

struct One {
    var firstName:String?
    var lastName:String?
    var two:Two?
    var threes:[Three]?
    var fours:[Four]?
}

struct Two {
    var firstName:String?
    var lastName:String?
}

struct Three {
    var firstName:String?
    var lastName:String?
}

struct Four {
    var firstName:String?
    var lastName:String?
}

class User {
    var firstName:String?
    var lastName:String?
    var crews = [Crew]()
}

class Crew {
    var firstName:String?
    var lastName:String?
}

