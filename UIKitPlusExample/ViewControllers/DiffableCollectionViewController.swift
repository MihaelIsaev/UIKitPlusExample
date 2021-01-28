import UIKitPlus

class DiffableCollectionViewController: NavigationViewController {
    override var statusBarStyle: StatusBarStyle { .dark }
    
    lazy var flowLayout = UCollectionViewFlowLayout()
        .estimatedItemSize(88)
        .scrollDirection(.vertical)
        .sectionInset(16)
    
    @UState var users: [User] = []
    
    deinit {
        print("DiffableCollectionViewController deinit")
    }
    
    override func buildUI() {
        title = "Diffable Collection"
        super.buildUI()
        navigationBar.body {
            UButton("Add more")
                .color(.black)
                .width(80)
                .edgesToSuperview(trailing: -16, bottom: -11)
                .onTapGesture { [weak self] in
                    self?.addMore()
                }
        }
        body {
            UCollection(flowLayout) {
                UForEach($users) {
                    UserCollectionView($0)
                }
            }
            .hidden($users.map { $0.count == 0 })
            .top(to: navigationBar)
            .edgesToSuperview(leading: 0, trailing: 0, bottom: 0)
            UText("No users added yet 🤷‍♂️\nAdd them by pressing top right button")
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
            User(
                id: UUID(),
                name: "User #\($0)",
                avatarURL: "https://avatars1.githubusercontent.com/u/\($0)?s=460&v=4"
            )
        }
        lastAvatarKey += moreQuantity
        users.append(contentsOf: moreUsers)
    }
}

extension DiffableCollectionViewController {
    static var mock: DiffableCollectionViewController {
        let vc = DiffableCollectionViewController()
        vc.addMore()
        return vc
    }
}

#if canImport(SwiftUI)
import SwiftUI
@available(iOS 13.0, *)
struct DiffableCollectionViewController_Preview: PreviewProvider, DeclarativePreview {
    static var preview: Preview {
        Preview {
            DiffableCollectionViewController.mock
        }
        .colorScheme(.light)
        .device(.iPhoneX)
        .language(.en)
    }
}
#endif
