//
//  BaseURL.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/08.
//

import UIKit
import Moya

let url = "https://api.openai.com/v1"

extension API {
    
    func getBaseURL() -> URL {
        switch self {
            
        case .chatGPT(_):
            return URL(string: url)!
        }
    }
    
    func getPath() -> String {
        switch self {
            
        case .chatGPT(_):
            return "/chat/completions"
        }
    }
    
    func getMethod() -> Moya.Method {
        switch self {
        case .chatGPT(_):
            return .post
        }
    }
    
     
    func getTask() -> Task {
        switch self {
            
        case .chatGPT(let body):
            return .requestParameters(
                parameters: body.toDictionary(),
                encoding: JSONEncoding.default
            )
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .chatGPT:
            return Header.tokenIsEmpty.header()
        }
        
    }
}
