import Foundation
import UIKitPlus

struct User: Identable {
    static var idKey: KeyPath<User, UUID> { \.id } /// link to unique identifier variable in the model
    
    let id: UUID
    let name, avatarURL: String
}
