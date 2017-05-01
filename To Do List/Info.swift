//
//  Info.swift
//  To Do List
//
//  Created by Patrick Calabrese on 5/1/17.
//  Copyright © 2017 Patrick Calabrese. All rights reserved.
//

import Foundation
import UIKit

struct Info {
    var image: UIImage!
    var name: String!
    var desc: String!
    init(image: UIImage, name: String, desc: String) {
        self.image = image
        self.name = name
        self.desc = desc
    }
}
