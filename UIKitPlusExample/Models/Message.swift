import Foundation
import UIKitPlus

struct Message: Identable {
    static var idKey: KeyPath<Self, UUID> { \.id }

    let id: UUID
    let text: String
    let time: String
    let my: Bool
}
