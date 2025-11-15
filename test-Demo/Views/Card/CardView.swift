import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    cardHeader
                    sectionTitle("卡片功能")
                    actionRow
                    sectionTitle("卡片管理")
                    managementList
                        .padding(.bottom, 24)
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("社保卡").font(.headline)
                }
            }
        }
    }

    private var cardHeader: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("电子社保卡")
                .font(.title2.bold())
                .foregroundStyle(.white)
            Text("中华人民共和国国家社会保障卡")
                .font(.footnote)
                .foregroundStyle(.white.opacity(0.9))
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(viewModel.user.name).font(.headline.bold())
                        Spacer()
                        Text(viewModel.user.socialSecurityNumberMasked)
                            .font(.headline.bold())
                    }
                    Text("卡号").font(.caption).foregroundStyle(.white.opacity(0.9))
                    HStack(alignment: .center) {
                        Text(viewModel.cardNumberMasked)
                            .font(.title3.bold())
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("有效日期").font(.caption).opacity(0.9)
                            Text("\(viewModel.validFrom)\n-\n\(viewModel.validTo)")
                                .font(.caption.bold())
                        }
                    }
                }
            }
            .foregroundStyle(.white)
            .padding(.top, 8)
        }
        .padding(20)
        .background(AppTheme.cardGradient)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
    }

    private func sectionTitle(_ text: String) -> some View {
        HStack {
            Text(text).font(.title3.bold())
            Spacer()
        }
    }

    private var actionRow: some View {
        HStack(spacing: 16) {
            RoundedCard {
                VStack(spacing: 10) {
                    Image(systemName: "qrcode.viewfinder")
                        .font(.system(size: 24))
                        .foregroundColor(.blue)
                        .frame(width: 48, height: 48)
                        .background(Color.blue.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text("出示二维码").font(.body.bold())
                    Text("医保结算、身份验证").font(.footnote).foregroundColor(.secondary)
                    Button("立即使用") {}
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                }
                .frame(maxWidth: .infinity)
            }
            RoundedCard {
                VStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 24))
                        .foregroundColor(.green)
                        .frame(width: 48, height: 48)
                        .background(Color.green.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text("卡状态查询").font(.body.bold())
                    Text("查询卡片状态、有效期").font(.footnote).foregroundColor(.secondary)
                    Button("立即查询") {}
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

    private var managementList: some View {
        VStack(spacing: 12) {
            listRow(icon: "lock.fill", tint: .blue, title: "安全设置", subtitle: "修改密码、设置支付限额")
            listRow(icon: "arrow.counterclockwise", tint: .purple, title: "使用记录", subtitle: "查看卡片使用历史")
            listRow(icon: "info.circle.fill", tint: .orange, title: "卡片信息", subtitle: "查看完整卡片信息")
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


