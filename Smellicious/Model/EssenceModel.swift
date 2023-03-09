//
//  EssenceModel.swift
//  SmelliciousTest
//
//  Created by Emilly Maia on 15/09/22.
//

import SwiftUI
import BottomSheet

// MARK: - CHaracter Model and Sample Data

struct EssenceModel: Identifiable, Equatable {
    var id = UUID().uuidString
    var value: LocalizedStringKey
    var icon: String
    var smokeColor: String
    var padding: CGFloat = 10
    var textSize: CGFloat = .zero
    var fontSize: CGFloat = 19
    var isShowing: Bool = false
    var textDescription: LocalizedStringKey
    var badMisture: LocalizedStringKey
    var image: Image {
        Image(icon)
    }
    var niceMistures: [String] = []
    var imageDescription: LocalizedStringKey

}

var essences_: [EssenceModel] = [
    EssenceModel(value: "lavender", icon: "Lavender",
                 smokeColor: "purpleSmoke",textDescription: "lavender-description", badMisture: "lavender-bad-misture",
                 niceMistures: ["Cinnamon", "Cotton", "Vanilla", "Lemon"],
                 imageDescription: "image of a lavender which is a plant with narrow, pointed leaves and spike-shaped purple flowers"
                ),
    EssenceModel(value: "passion-fruit", icon: "Passion Fruit",
                 smokeColor: "yellowSmoke", textDescription: "passion-fruit-description", badMisture: "passion-fruit-bad-misture",
                 niceMistures: ["Cinnamon", "Cotton", "Peppermint", "Vanilla", "Coconut"],
                 imageDescription: "image of passion fruit which is a small, round fruit with a tough, wrinkled outer yellow skin, cut open in half, with a bright yellow gelatinous flesh that is filled with small, edible seeds."
                ),
    EssenceModel(value: "coconut", icon: "Coconut",
                 smokeColor:"brownSmoke",textDescription: "coconut-description", badMisture: "coconut-bad-misture",
                 niceMistures: ["Lemon", "Passion Fruit", "Tangerine", "Cherry Blossom"],
                 imageDescription: "image of a halved coconut with a hard, brown outer shell and a soft, white, fleshy interior"
                ),
    EssenceModel(value: "tangerine", icon: "Tangerine",
                 smokeColor:"orangeSmoke",textDescription: "tangerine-description", badMisture: "tangerine-bad-misture",
                 niceMistures: ["Cinnamon", "Vanilla", "Cotton", "Peppermint", "Coconut"],
                 imageDescription: "image of a small and round Tangerines with bright orange color"
                ),
    EssenceModel(value: "cherry-blossom", icon: "Cherry Blossom",
                 smokeColor: "pinkSmoke",textDescription: "cherry-blossom-description", badMisture: "cherry-blossom-bad-misture", niceMistures: ["Lemon", "Passion Fruit", "Tangerine"],
                 imageDescription: "image of a cherry blossom which is a flowering tree with a pale, smooth trunk and small oval-shaped leaves with three flowers that have soft silky petals that are usually pink or white."
                ),
    EssenceModel(value: "ylang-ylang", icon: "Ylang Ylang",
                 smokeColor:"yellowSmoke",textDescription: "ylang-ylang-description", badMisture: "ylang-ylang-bad-misture",
                 niceMistures: ["Cotton", "Cinnamon", "Vanilla"],
                 imageDescription: "image of a yellow ylang-ylang flower with six long, thin petals that are arranged in a star shape around a central stalk. The petals are slightly wavy and have a soft, velvety texture."
                ),
    EssenceModel(value: "vanilla", icon: "Vanilla",
                 smokeColor:"vanillaSmoke",textDescription: "vanilla-description", badMisture: "vanilla-bad-misture",
                 niceMistures: ["Passion Fruit", "Roses", "Tangerine", "Lemon", "Lavender", "Ylang Ylang"],
                 imageDescription: "image of a Vanilla flower that are small, delicate, and white colored. The flower petals are soft and smooth to the touch, and the overall shape of the flower is somewhat tubular, with a flared lip at the end"
                ),
    EssenceModel(value: "peppermint", icon: "Peppermint",
                 smokeColor: "greenSmoke", textDescription: "peppermint-description", badMisture: "peppermint-bad-misture",
                 niceMistures: ["Passion Fruit", "Lemon", "Tangerine", "Cinnamon", "Cotton"],
                 imageDescription: "image of two greens Peppermint leaves small and narrow, with a pointed tip and a serrated edge. They have a bright green color and a slightly fuzzy texture."
                ),
    EssenceModel(value: "cinnamon", icon: "Cinnamon",
                 smokeColor:"brownSmoke",textDescription: "cinnamon-description", badMisture: "cinnamon-bad-misture",
                 niceMistures: ["Roses", "Lavender", "Ylang Ylang", "Lemon", "Passion Fruit", "Tangerine", "Peppermint"],
                 imageDescription: "image of three cinnamon sticks that are made from the inner bark of a tree, which is dried and rolled into cylindrical shapes. The sticks are light brown in color and have a rough, textured surface."
                ),
    EssenceModel(value: "cotton", icon: "Cotton",
                 smokeColor:"vanillaSmoke",textDescription: "cotton-description", badMisture: "cotton-bad-misture",
                 niceMistures: ["Ylang Ylang", "Roses", "Lavender", "Peppermint", "Passion Fruit", "Tangerine", "Lemon"],
                 imageDescription: "image of a cotton flower with white or cream-colored with a soft, fluffy appearance. They are composed of multiple layers of thin, papery petals that are tightly packed together, giving them a rounded shape."
                ),
    EssenceModel(value: "lemon", icon: "Lemon",
                 smokeColor:"greenSmoke", textDescription: "lemon-description", badMisture: "lemon-bad-misture",
                 niceMistures: ["Roses", "Vanilla", "Ylang Ylang", "Cherry Blossom", "Coconut", "Lavender", "Cinnamon", "Cotton", "Tangerine", "Peppermint"],
                 imageDescription: "image of a lemon which is oval-shaped citrus fruit with a bright yellow, smooth outer skin."
                ),
    EssenceModel(value: "roses", icon: "Roses",
                 smokeColor: "redSmoke", textDescription: "roses-description", badMisture: "roses-bad-misture",
                 niceMistures: ["Cotton" , "Cinnamon", "Vanilla", "Lemon"],
                 imageDescription: "image of a red rose flower with a long stem and soft, velvety petals that are deep red in color."
                )
]

struct ImageElementComponent: View {
    let essence: EssenceModel
    @State var isPopover = false
    var body: some View {
        VStack {
            Button(action: { self.isPopover.toggle() }) {
                Image(essence.icon)
                    .resizable()
                    .cornerRadius(900)
                    .frame(width: 90,
                           height: 90, alignment: .leading)
                    .overlay(Circle().stroke(Color.init( red: 0.19, green: 0.28, blue: 0.23, opacity: 0.8), lineWidth: 3))
            }.bottomSheet(isPresented: self.$isPopover, detents: [.medium(), .large()]) {
                ZStack {
                    Color.init(red: 0.89, green: 0.88, blue: 0.99)
                    EssenceDescription(essence: essence)
                }
                .ignoresSafeArea()
            } .buttonStyle(PlainButtonStyle())
                .accessibilityLabel(essence.value)
        }
    }
}

struct EssenceDescription: View {
    let essence: EssenceModel
    var body: some View {
        VStack(spacing: .zero) {
            ScrollView {
                Text(essence.value)
                    .foregroundColor(Color.init( red: 0.19, green: 0.28, blue: 0.23))
                    .font(.system(.title, design: .rounded))
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                Image(essence.icon)
                    .resizable()
                    .cornerRadius(100)
                    .frame(width: 100,
                           height: 100, alignment: .leading)
                    .padding()
                    .accessibility(label: Text(essence.imageDescription))
                    .accessibilityRemoveTraits(.isImage)
                    Text(essence.textDescription)
                        .font(.system(.title2, design: .rounded))
                        .foregroundColor(Color.init( red: 0.19, green: 0.28, blue: 0.23))
                        .fixedSize(horizontal: false, vertical: true)
                }
            Spacer()
        }
        .padding()
        .multilineTextAlignment(.center)
        .background(Color.init(red: 0.89, green: 0.88, blue: 0.99))
    }
}
