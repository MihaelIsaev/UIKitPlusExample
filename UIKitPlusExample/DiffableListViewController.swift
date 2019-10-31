import UIKit
import UIKitPlus

class DiffableListViewController: NavigationViewController {
    override var statusBarStyle: StatusBarStyle { .dark }
    
    @State var users: [User] = []
    
    override func buildUI() {
        title = "Diffable List"
        super.buildUI()
        navigationBar.body {
            Button("Add more")
                .color(.black)
                .width(80)
                .edgesToSuperview(trailing: -16, bottom: -11)
                .onTapGesture(addMore)
        }
        body {
            List {
                View().height(10)
                ForEach($users) { /// you could use it like section
                    UserListView($0)
                    View().height(8)
                }
            }
            .hidden($users.map { $0.count == 0 })
            .top(to: navigationBar)
            .edgesToSuperview(leading: 0, trailing: 0, bottom: 0)
            Text("No users added yet 🤷‍♂️\nAdd them by pressing top right button")
                .alignment(.center)
                .multiline()
                .color(.blackHole)
                .centerInSuperview()
                .hidden($users.map { $0.count > 0 })
        }
    }
    
    var lastAvatarKey = 1272611
    
    func addMore() {
        let moreQuantity = 10
        let moreUsers = (lastAvatarKey...lastAvatarKey + moreQuantity).map {
            User(id: UUID(), name: "User #\($0)", avatarURL: "https://avatars1.githubusercontent.com/u/\($0)?s=460&v=4")
        }
        lastAvatarKey += moreQuantity
        users.append(contentsOf: moreUsers)
    }
}
