//
//  ViewController.swift
//  Tree
//
//  Created by Aldo Antonio Martinez Avalos on 12/17/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let arithmeticExpVC = ArithmeticTreeViewController()
        present(arithmeticExpVC, animated: false, completion: nil)
    }


}

