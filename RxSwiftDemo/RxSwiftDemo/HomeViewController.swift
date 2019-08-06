//
//  HomeViewController.swift
//  RxSwiftDemo
//
//  Created by Atif on 05/08/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    let disposeBag = DisposeBag()

    @IBOutlet weak var btnSelected: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionSelect(_ sender: Any) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailVC.selectedObserver.subscribe(onNext: { [weak self] selected in
            print(selected)
            self?.btnSelected.setTitle("Selected:\(selected)", for: .normal)
        }, onError: { error in
            print(error)
        }, onCompleted: {
            print("onCompleted")
        }).disposed(by:disposeBag)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

