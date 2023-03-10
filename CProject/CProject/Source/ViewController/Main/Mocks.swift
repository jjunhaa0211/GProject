import Foundation

func getChannelMocks() -> [Channel] {
    return (0...3).map { Channel(id: String($0), name: "name " + String($0)) }
}

func getMessagesMock() -> [MUessage] {
    return (0...3).map { MUessage(content: "message content \($0)") }
}
