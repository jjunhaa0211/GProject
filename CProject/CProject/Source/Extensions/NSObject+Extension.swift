//
//  NSObject+Extension.swift
//  CProject
//
//  Created by 박준하 on 2023/03/10.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
