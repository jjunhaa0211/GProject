//
//  APExtension+UITableViewCell.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/07.
//

import Foundation
import UIKit
import CoreData

extension UITableViewCell {
    public static var identifier: String {
        return String(describing: self)
    }
}

extension NSManagedObject {
    public static var identifier: String {
        return String(describing: self)
    }
}
