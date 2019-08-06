//
//  DetailViewController.swift
//  RxSwiftDemo
//
//  Created by Atif on 05/08/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay

class DetailViewController: UIViewController {
    
    private let valueSelected = BehaviorRelay(value:"Nothing")
    var selectedObserver:Observable<String> {
        return valueSelected.asObservable()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionValueSelected(_ sender: UISegmentedControl) {
        valueSelected.accept(sender.titleForSegment(at: sender.selectedSegmentIndex)!)
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
