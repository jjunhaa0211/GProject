//
//  RequestModel.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/08.
//

import Foundation

struct ChatGPTRequest: Codable {
    var model: String
    var messages: String
}
