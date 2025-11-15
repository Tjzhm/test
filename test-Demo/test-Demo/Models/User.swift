import Foundation

struct User: Identifiable, Equatable {
    let id: UUID
    var name: String
    var socialSecurityNumberMasked: String
    var insuredStatus: String
    var verifiedStatus: String

    static func mock() -> User {
        User(id: UUID(),
             name: "张伟",
             socialSecurityNumberMasked: "110************1234",
             insuredStatus: "正常参保",
             verifiedStatus: "已实名认证")
    }
}


