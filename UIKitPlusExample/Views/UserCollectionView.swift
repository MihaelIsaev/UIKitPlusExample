import UIKit
import UIKitPlus

class UserCollectionView: View {
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
            Image(url: avatarURL)
                .size(70)
                .circle()
                .topToSuperview()
                .centerXInSuperview()
            Text(name)
                .color(.black)
                .font(.helveticaNeueRegular, 12)
                .alignment(.center)
                .edgesToSuperview(leading: 0, trailing: 0, bottom: 0)
        }
    }
}
