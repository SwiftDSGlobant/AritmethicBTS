//
//  ArithmeticTreeViewController.swift
//  Tree
//
//  Created by Aldo Antonio Martinez Avalos on 12/17/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class ArithmeticTreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(ExpressionTree.compute(expression: "((5*6)/2)+(6/2)") ?? 0)
    }

}
