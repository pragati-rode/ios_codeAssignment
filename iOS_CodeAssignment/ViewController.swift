//
//  ViewController.swift
//  iOS_CodeAssignment
//
//  Created by Pragati Rode on 05/07/21.
//

import UIKit

class ViewController: UIViewController {

    var factViewModel = FactsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        factViewModel.getAllData()
    }


}

