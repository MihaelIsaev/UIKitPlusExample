import UIKit
import UIKitPlus

class UserListView: View {
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
            HStack {
                Image(url: avatarURL).size(44).circle()
                Text(name).color(.black)
            }.distribution(.fill).spacing(10).edgesToSuperview(top: 0, leading: 16, trailing: -16, bottom: 0)
        }
    }
}
