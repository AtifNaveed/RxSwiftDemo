//
//  BehaviorRelay.swift
//  RxSwiftTableView
//
//  Created by Atif on 07/08/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension BehaviorRelay where Element: RangeReplaceableCollection {
    func add(element: Element.Element) {
        var array = self.value
        array.append(element)
        self.accept(array)
    }
}
