import Foundation
import Combine
import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var user: User
    @Published var medicalAccountBalance: String
    @Published var pensionStatus: String
    @Published var unemploymentStatus: String
    @Published var quickItems: [ServiceItem]
    @Published var categories: [ServiceItem]

    init(user: User,
         medicalAccountBalance: String,
         pensionStatus: String,
         unemploymentStatus: String,
         quickItems: [ServiceItem],
         categories: [ServiceItem]) {
        self.user = user
        self.medicalAccountBalance = medicalAccountBalance
        self.pensionStatus = pensionStatus
        self.unemploymentStatus = unemploymentStatus
        self.quickItems = quickItems
        self.categories = categories
    }
}

extension HomeViewModel {
    static func mock() -> HomeViewModel {
        HomeViewModel(
            user: .mock(),
            medicalAccountBalance: "¥3,245.60",
            pensionStatus: "正常参保",
            unemploymentStatus: "正常参保",
            quickItems: ServiceItem.quickActions(),
            categories: ServiceItem.serviceCategories()
        )
    }
}


