import UIKitPlus

class ListWithSectionsViewController: NavigationViewController {
    @UState var animals: [String] = ["Cow", "Pig"]
    @UState var birds: [String] = ["Owl", "Parrot"]

    override func buildUI() {
        super.buildUI()
        body {
            UList {
                UForEach($animals) { i, animal in
                    if i == 0 { // before first row of the section you could add header view
                        UVSpace(24)
                        UHStack {
                            UHSpace(8)
                            UText("Animals").color(.black).font(.helveticaNeueBold, 16)
                        }
                        UVSpace(4)
                        UVSpace(1).background(.darkGray)
                    }
                    UVSpace(10)
                    UHStack {
                        UHSpace(16)
                        UText(animal).color(.black).font(.helveticaNeueBold, 16)
                    }
                }
                UForEach($birds) { i, bird in
                    if i == 0 { // before first row of the section you could add header view
                        UVSpace(24)
                        UHStack {
                            UHSpace(8)
                            UText("Birds").color(.black).font(.helveticaNeueBold, 16)
                        }
                        UVSpace(4)
                        UVSpace(1).background(.darkGray)
                    }
                    UVSpace(10)
                    UHStack {
                        UHSpace(16)
                        UText(bird).color(.black).font(.helveticaNeueBold, 16)
                    }
                }
                UVSpace(44)
            }
            .top(to: navigationBar)
            .edgesToSuperview(h: 0)
            .bottomToSuperview()
        }
    }
}
