//
//  TableViewModel.swift
//  RxSwiftTableView
//
//  Created by Atif on 07/08/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TableViewModel {
    private let privateDataSource: BehaviorRelay<[String]> = BehaviorRelay(value: [])
    private let disposeBag = DisposeBag()
    
    public let dataSource: Observable<[String]>
    
    init(addItemTap: Driver<Void>) {
        self.dataSource = privateDataSource.asObservable()
        addItemTap.drive(onNext: { [unowned self] _ in
            //self.privateDataSource.value.append("Row")
            self.privateDataSource.add(element: "Row")
        }, onCompleted: {
            print("Complete")
        }).disposed(by: disposeBag)
        
    }
}


