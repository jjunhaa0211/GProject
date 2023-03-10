//
//  NSObject.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/08.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
