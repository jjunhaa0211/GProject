//
//  networkingResult.swift
//  CProject
//
//  Created by 박준하 on 2023/03/10.
//

import Foundation

enum networkingResult: Int {
    case ok = 200
    case deleteOk = 204
    case createOk = 201
    case wrongRq = 400
    case tokenError = 401
    case notFound = 404
    case conflict = 409
    case fault = 0
}
