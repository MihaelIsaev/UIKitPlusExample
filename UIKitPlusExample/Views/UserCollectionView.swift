import UIKitPlus

class UserCollectionView: UView {
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
        size(88, 90)
        body {
            UImage(url: avatarURL)
                .size(70)
                .circle()
                .topToSuperview()
                .centerXInSuperview()
                .background(.lightGray)
            UText(name)
                .color(.black)
                .font(.helveticaNeueRegular, 12)
                .alignment(.center)
                .edgesToSuperview(leading: 0, trailing: 0, bottom: 0)
        }
    }
}

#if canImport(SwiftUI)
import SwiftUI
@available(iOS 13.0, *)
struct UserCollectionView_Preview: PreviewProvider, DeclarativePreview {
    static var preview: Preview {
        Preview {
            UserCollectionView(.init(id: UUID(),
                                               name: "Mike",
                                               avatarURL: "https://avatars1.githubusercontent.com/u/1272611?s=460&v=4"))
        }
        .colorScheme(.light)
        .device(.iPhoneX)
        .layout(.fixed(width: 88, height: 90))
        .language(.en)
    }
}
#endif
