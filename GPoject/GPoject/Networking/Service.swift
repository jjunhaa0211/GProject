//
//  Service.swift
//  GPoject
//
//  Created by 박준하 on 2023/03/08.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

final class Service {
    
    struct TokenModel: Codable {
        let accessToken: String
        let refreshToken: String
    }

    let provider = MoyaProvider<API>(plugins: [MoyaLoggingPlugin()])
    
    func gptBoot(_ model: String, _ messages: String) -> Single<networkingResult> {
        return provider.rx.request(.chatGPT(ChatGPTRequest(model: model, messages: messages)))
            .filterSuccessfulStatusCodes()
            .map(TokenModel.self)
            .map{ response -> networkingResult in
                Token.accessToken = response.accessToken
                Token.refreshToken = response.refreshToken
                return .ok
            }
            .catch {[unowned self] in return .just(setNetworkError($0))}
    }
    
    func setNetworkError(_ error: Error) -> networkingResult {
            print(error)
            print(error.localizedDescription)
            guard let status = (error as? MoyaError)?.response?.statusCode else { return (.fault) }
            return (networkingResult(rawValue: status) ?? .fault)
    }
}
