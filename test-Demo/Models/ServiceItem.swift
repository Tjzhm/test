import SwiftUI

struct ServiceItem: Identifiable, Equatable {
    let id: UUID
    var title: String
    var subtitle: String?
    var systemImage: String
    var tint: Color
}

extension ServiceItem {
    static func quickActions() -> [ServiceItem] {
        [
            ServiceItem(id: UUID(), title: "医保结算", subtitle: nil, systemImage: "cross.case.fill", tint: .blue),
            ServiceItem(id: UUID(), title: "账户查询", subtitle: nil, systemImage: "magnifyingglass", tint: .green),
            ServiceItem(id: UUID(), title: "扫码认证", subtitle: nil, systemImage: "qrcode.viewfinder", tint: .purple),
            ServiceItem(id: UUID(), title: "服务网点", subtitle: nil, systemImage: "mappin.and.ellipse", tint: .orange)
        ]
    }

    static func serviceCategories() -> [ServiceItem] {
        [
            ServiceItem(id: UUID(), title: "医保服务", subtitle: nil, systemImage: "stethoscope", tint: .blue),
            ServiceItem(id: UUID(), title: "养老保险", subtitle: nil, systemImage: "house.fill", tint: .green),
            ServiceItem(id: UUID(), title: "失业保险", subtitle: nil, systemImage: "briefcase.fill", tint: .purple),
            ServiceItem(id: UUID(), title: "生育保险", subtitle: nil, systemImage: "figure.and.child.holdinghands", tint: .pink),
            ServiceItem(id: UUID(), title: "工伤保险", subtitle: nil, systemImage: "figure.walk.motion", tint: .red),
            ServiceItem(id: UUID(), title: "社保缴费", subtitle: nil, systemImage: "banknote.fill", tint: .yellow),
            ServiceItem(id: UUID(), title: "服务网点", subtitle: nil, systemImage: "mappin.and.ellipse", tint: .blue),
            ServiceItem(id: UUID(), title: "帮助中心", subtitle: nil, systemImage: "questionmark.circle.fill", tint: .teal)
        ]
    }

    static func commonServices() -> [ServiceItem] {
        [
            ServiceItem(id: UUID(), title: "参保信息查询", subtitle: "查询个人参保状态、缴费记录", systemImage: "magnifyingglass", tint: .blue),
            ServiceItem(id: UUID(), title: "养老金测算", subtitle: "估算未来养老金领取金额", systemImage: "calculator", tint: .green),
            ServiceItem(id: UUID(), title: "医保结算记录", subtitle: "查看医保费用结算详情", systemImage: "doc.text.fill", tint: .purple),
            ServiceItem(id: UUID(), title: "定点医疗机构", subtitle: "查找附近的医保定点机构", systemImage: "mappin.and.ellipse", tint: .orange)
        ]
    }
}


