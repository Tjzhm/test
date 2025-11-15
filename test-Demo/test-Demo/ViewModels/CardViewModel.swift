import Foundation
import Combine
import SwiftUI

final class CardViewModel: ObservableObject {
    @Published var user: User
    @Published var cardNumberMasked: String
    @Published var validFrom: String
    @Published var validTo: String

    init(user: User, cardNumberMasked: String, validFrom: String, validTo: String) {
        self.user = user
        self.cardNumberMasked = cardNumberMasked
        self.validFrom = validFrom
        self.validTo = validTo
    }
}

extension CardViewModel {
    static func mock() -> CardViewModel {
        CardViewModel(user: .mock(),
                      cardNumberMasked: "A123456789012345",
                      validFrom: "2024.01",
                      validTo: "2029.01")
    }
}


