import SwiftUI

enum AppTheme {
    static let accent: Color = Color.blue
    static let primaryText: Color = Color.primary
    static let secondaryText: Color = Color.secondary
    static let sectionBackground: Color = Color(.secondarySystemBackground)
    static let cardGradient: LinearGradient = LinearGradient(
        colors: [Color(red: 48/255, green: 118/255, blue: 255/255),
                 Color(red: 33/255, green: 95/255, blue: 242/255)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct RoundedCard<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .background(AppTheme.sectionBackground)
            .cornerRadius(16)
    }
}

