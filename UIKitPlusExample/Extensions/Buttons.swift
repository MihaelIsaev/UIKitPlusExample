import UIKitPlus

extension Button {
    static var back: Button { Button().image(.iconBack).tint(0x9FA4B6).size(25, 18) }
    static var gray: Button {
        Button().circle().background(.lightGray).color(.black).height(54).font(.helveticaNeueMedium, 16)
    }
    static var github: Button {
        Button().circle().background(.blackHole).color(.white).height(54).font(.helveticaNeueMedium, 16)
    }
}
