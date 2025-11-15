import Foundation
import Combine
import SwiftUI

final class ProfileViewModel: ObservableObject {
    @Published var user: User

    init(user: User) {
        self.user = user
    }
}

extension ProfileViewModel {
    static func mock() -> ProfileViewModel {
        ProfileViewModel(user: .mock())
    }
}


