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
