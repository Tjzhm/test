import Foundation
import Combine
import SwiftUI

final class ServicesViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var categories: [ServiceItem]
    @Published var commonServices: [ServiceItem]

    init(categories: [ServiceItem], commonServices: [ServiceItem]) {
        self.categories = categories
        self.commonServices = commonServices
    }
}

extension ServicesViewModel {
    static func mock() -> ServicesViewModel {
        ServicesViewModel(categories: ServiceItem.serviceCategories(),
                          commonServices: ServiceItem.commonServices())
    }
}


