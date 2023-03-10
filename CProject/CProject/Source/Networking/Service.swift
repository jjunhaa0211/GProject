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
    
    func gptBoot(_ model: String, _ role: String, _ content: String) -> Single<networkingResult> {
        let message = ChatGPTRequest.Message(role: role, content: content)
        let chatGPTRequest = ChatGPTRequest(model: model, messages: [message])
        return provider.rx.request(.chatGPT(chatGPTRequest))
            .filterSuccessfulStatusCodes()
            .map(TokenModel.self)
            .map { response -> networkingResult in
                Token.accessToken = response.accessToken
                Token.refreshToken = response.refreshToken
                return .ok
            }
            .catch { [unowned self] in
                return .just(setNetworkError($0))
            }
    }
    
    func setNetworkError(_ error: Error) -> networkingResult {
            print(error)
            print(error.localizedDescription)
            guard let status = (error as? MoyaError)?.response?.statusCode else { return (.fault) }
            return (networkingResult(rawValue: status) ?? .fault)
    }
}
