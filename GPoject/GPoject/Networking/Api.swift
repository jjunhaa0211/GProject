//
//  API.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/08.
//

import Foundation
import Moya

enum API {
    case chatGPT(ChatGPTRequest)
}

extension API: Moya.TargetType {
    var baseURL: URL { self.getBaseURL() }
    var path: String { self.getPath() }
    var method: Moya.Method { self.getMethod() }
    var sampleData: Data { Data() }
    var task: Task { self.getTask() }
    var headers: [String : String]? { self.header }
}

extension Encodable {
     func toDictionary() -> [String: Any] {
         do {
             let encoder = JSONEncoder()
             let data = try encoder.encode(self)

             return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] ?? [:]
         } catch {
             return [:]
         }
     }
 }

