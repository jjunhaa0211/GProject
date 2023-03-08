//
//  RequestModel.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/08.
//

import Foundation

// MARK: - ChatGPTRequest
struct ChatGPTRequest: Codable {
    let model: String
    let messages: [Message]
    
    // MARK: - Message
    struct Message: Codable {
        let role, content: String
    }

}
