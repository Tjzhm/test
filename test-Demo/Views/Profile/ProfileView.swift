import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    headerCard
                    sectionTitle("我的服务")
                    VStack(spacing: 12) {
                        listRow(icon: "doc.text.fill", tint: .blue, title: "我的证照", subtitle: "查看和管理我的电子证照")
                        listRow(icon: "clock.arrow.circlepath", tint: .green, title: "业务记录", subtitle: "查看办理过的业务记录")
                        listRow(icon: "person.2.fill", tint: .purple, title: "我的家庭", subtitle: "管理家庭成员和代办业务")
                        listRow(icon: "star.fill", tint: .orange, title: "我的收藏", subtitle: "查看收藏的服务和内容")
                    }
                    sectionTitle("系统设置")
                    VStack(spacing: 12) {
                        listRow(icon: "bell.fill", tint: .blue, title: "消息通知", subtitle: "管理推送通知和提醒")
                        listRow(icon: "lock.fill", tint: .green, title: "隐私与安全", subtitle: "管理隐私设置和安全选项")
                        listRow(icon: "textformat.size", tint: .purple, title: "通用设置", subtitle: "语言、字体大小等设置")
                        listRow(icon: "questionmark.circle.fill", tint: .red, title: "帮助与反馈", subtitle: "使用帮助和问题反馈")
                    }
                    RoundedCard {
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("关于电子社保卡").font(.body.bold())
                                Text("版本 2.0.1").font(.footnote).foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "chevron.right").foregroundColor(Color.secondary.opacity(0.6))
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
                    Text("我的").font(.headline)
                }
            }
        }
    }

    private var headerCard: some View {
        RoundedCard {
            HStack(alignment: .center, spacing: 12) {
                ZStack {
                    Circle().fill(Color.blue.opacity(0.12)).frame(width: 54, height: 54)
                    Image(systemName: "person.circle.fill").foregroundColor(.blue).font(.system(size: 28))
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(viewModel.user.name).font(.headline)
                    Text("社会保障号：\(viewModel.user.socialSecurityNumberMasked)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    HStack(spacing: 8) {
                        Label(viewModel.user.insuredStatus, systemImage: "checkmark.seal.fill")
                            .font(.caption)
                            .padding(.horizontal, 8).padding(.vertical, 4)
                            .background(Color.green.opacity(0.12))
                            .foregroundColor(.green)
                            .clipShape(Capsule())
                        Label(viewModel.user.verifiedStatus, systemImage: "person.badge.shield.checkmark.fill")
                            .font(.caption)
                            .padding(.horizontal, 8).padding(.vertical, 4)
                            .background(Color.blue.opacity(0.12))
                            .foregroundColor(.blue)
                            .clipShape(Capsule())
                    }
                }
                Spacer()
            }
        }
    }

    private func sectionTitle(_ text: String) -> some View {
        HStack {
            Text(text).font(.title3.bold())
            Spacer()
        }
    }

    private func listRow(icon: String, tint: Color, title: String, subtitle: String) -> some View {
        RoundedCard {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .foregroundColor(tint)
                    .frame(width: 40, height: 40)
                    .background(tint.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading, spacing: 4) {
                    Text(title).font(.body.bold())
                    Text(subtitle).font(.footnote).foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right").foregroundColor(Color.secondary.opacity(0.6))
            }
        }
    }
}


