import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    headerCard
                    sectionTitle("快捷服务")
                    quickGrid
                    sectionTitle("社保服务")
                    categoryGrid
                    sectionTitle("最新消息")
                    RoundedCard {
                        HStack {
                            Image(systemName: "megaphone.fill")
                                .foregroundColor(.orange)
                            Text("暂时没有新的消息")
                                .foregroundColor(AppTheme.secondaryText)
                            Spacer()
                        }
                    }
                    .padding(.bottom, 24)
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("电子社保卡").font(.headline)
                }
            }
        }
    }

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("您好，欢迎使用电子社保卡")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.9))
                    Text(viewModel.user.name)
                        .font(.title.bold())
                        .foregroundStyle(.white)
                    Text("社会保障号： \(viewModel.user.socialSecurityNumberMasked)")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.9))
                }
                Spacer()
                ZStack {
                    Circle().fill(.white.opacity(0.2))
                        .frame(width: 64, height: 64)
                    Image(systemName: "person.text.rectangle.fill")
                        .font(.system(size: 28))
                        .foregroundStyle(.white)
                }
            }
            HStack(spacing: 20) {
                infoColumn(title: "医保账户", value: viewModel.medicalAccountBalance)
                Divider().background(.white.opacity(0.3))
                infoColumn(title: "养老保险", value: viewModel.pensionStatus)
                Divider().background(.white.opacity(0.3))
                infoColumn(title: "失业险", value: viewModel.unemploymentStatus)
            }
            .font(.subheadline.bold())
            .foregroundStyle(.white)
        }
        .padding(20)
        .background(AppTheme.cardGradient)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
    }

    private func infoColumn(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.caption).opacity(0.9)
            Text(value).font(.headline)
        }
    }

    private func sectionTitle(_ text: String) -> some View {
        HStack {
            Text(text)
                .font(.title3.bold())
            Spacer()
        }
        .padding(.top, 4)
    }

    private var quickGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 4), spacing: 12) {
            ForEach(viewModel.quickItems) { item in
                RoundedCard {
                    VStack(spacing: 8) {
                        Image(systemName: item.systemImage)
                            .font(.system(size: 22))
                            .foregroundColor(item.tint)
                            .frame(width: 36, height: 36)
                            .background(item.tint.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text(item.title)
                            .font(.caption)
                            .foregroundColor(AppTheme.primaryText)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }

    private var categoryGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 3), spacing: 12) {
            ForEach(viewModel.categories) { item in
                RoundedCard {
                    VStack(spacing: 10) {
                        Image(systemName: item.systemImage)
                            .font(.system(size: 24))
                            .foregroundColor(item.tint)
                            .frame(width: 44, height: 44)
                            .background(item.tint.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        Text(item.title)
                            .font(.subheadline)
                            .foregroundColor(AppTheme.primaryText)
                    }
                    .frame(maxWidth: .infinity, minHeight: 96)
                }
            }
        }
    }
}


