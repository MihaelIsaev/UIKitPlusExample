import UIKitPlus

class UserListView: UView {
    let name, avatarURL: String
    
    init (_ user: User) {
        name = user.name
        avatarURL = user.avatarURL
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func buildView() {
        super.buildView()
        body {
            UHStack {
                UImage(url: avatarURL).size(44).circle().background(.lightGray)
                UText(name).color(.black)
            }
            .distribution(.fill)
            .spacing(10)
            .edgesToSuperview(h: 16, v: 0)
        }
    }
}

#if canImport(SwiftUI)
import SwiftUI
@available(iOS 13.0, *)
struct UserListView_Preview: PreviewProvider, DeclarativePreview {
    static var preview: Preview {
        Preview {
            UserListView(.init(id: UUID(),
                                      name: "Mike",
                                      avatarURL: "https://avatars1.githubusercontent.com/u/1272611?s=460&v=4"))
        }
        .colorScheme(.light)
        .device(.iPhoneX)
        .layout(.fixed(width: 375, height: 44))
        .language(.en)
    }
}
#endif
