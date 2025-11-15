import SwiftUI

struct ServicesView: View {
    @ObservedObject var viewModel: ServicesViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    searchBar
                    sectionTitle("服务分类")
                    categoryGrid
                    sectionTitle("常用服务")
                    commonList
                    sectionTitle("特色服务")
                    featureCards
                        .padding(.bottom, 24)
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("服务").font(.headline)
                }
            }
        }
    }

    private var searchBar: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            TextField("搜索社保服务...", text: $viewModel.searchText)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
        }
        .padding(.horizontal, 12)
        .frame(height: 44)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }

    private func sectionTitle(_ text: String) -> some View {
        HStack {
            Text(text).font(.title3.bold())
            Spacer()
        }
    }

    private var categoryGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 4), spacing: 12) {
            ForEach(viewModel.categories) { item in
                RoundedCard {
                    VStack(spacing: 8) {
                        Image(systemName: item.systemImage)
                            .foregroundColor(item.tint)
                            .font(.system(size: 20))
                            .frame(width: 40, height: 40)
                            .background(item.tint.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text(item.title)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .foregroundColor(AppTheme.primaryText)
                    }
                }
            }
        }
    }

    private var commonList: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.commonServices) { item in
                RoundedCard {
                    HStack(alignment: .center, spacing: 12) {
                        Image(systemName: item.systemImage)
                            .foregroundColor(item.tint)
                            .frame(width: 40, height: 40)
                            .background(item.tint.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title).font(.body.bold())
                            if let subtitle = item.subtitle {
                                Text(subtitle).font(.footnote).foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        Image(systemName: "chevron.right").foregroundColor(Color.secondary.opacity(0.6))
                    }
                }
            }
        }
    }

    private var featureCards: some View {
        HStack(spacing: 16) {
            featureCard(title: "跨省通办", subtitle: "异地就医备案、社保关系转移", color: .blue)
            featureCard(title: "亲属代办", subtitle: "为家人办理社保业务", color: .green)
        }
    }

    private func featureCard(title: String, subtitle: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: "gearshape.2.fill")
                Text(title).bold()
            }
            Text(subtitle).font(.footnote).opacity(0.9)
            Spacer(minLength: 0)
        }
        .foregroundColor(.white)
        .padding(16)
        .frame(maxWidth: .infinity, minHeight: 104)
        .background(LinearGradient(colors: [color, color.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
    }
}


