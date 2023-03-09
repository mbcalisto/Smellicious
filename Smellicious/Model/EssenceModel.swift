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
                 smokeColor: "yellowSmoke", textDescription: "With relaxing properties, it reduces stress and anxiety and provides a peaceful sleep.", badMisture: "Because it is a citrus aroma, passion fruit combines more with woody or menthol essences. Try these combinations and it will be a hit!",
                 niceMistures: ["Cinnamon", "Cotton", "Peppermint", "Vanilla", "Coconut"],
                 imageDescription: "image of passion fruit which is a small, round fruit with a tough, wrinkled outer yellow skin, cut open in half, with a bright yellow gelatinous flesh that is filled with small, edible seeds."
                ),
    EssenceModel(value: "coconut", icon: "Coconut",
                 smokeColor:"brownSmoke",textDescription: "Stimulates well-being. Calms the nerves and promotes spiritual peace. In addition, it has soothing properties for the skin, reducing inflammation and promoting hydration.", badMisture: "Coconut is a sweet fruity essence. Try combining it with more acidic elements.",
                 niceMistures: ["Lemon", "Passion Fruit", "Tangerine", "Cherry Blossom"],
                 imageDescription: "image of a halved coconut with a hard, brown outer shell and a soft, white, fleshy interior"
                ),
    EssenceModel(value: "tangerine", icon: "Tangerine",
                 smokeColor:"orangeSmoke",textDescription: "Cheerful aroma, acts as a stimulant, reducing stress and increasing energy to produce.", badMisture: "Being citrusy, tangerine goes well with minty, sweety or woody essences. Try these combinations, you will love it!",
                 niceMistures: ["Cinnamon", "Vanilla", "Cotton", "Peppermint", "Coconut"],
                 imageDescription: "image of a small and round Tangerines with bright orange color"
                ),
    EssenceModel(value: "cherry-blossom", icon: "Cherry Blossom",
                 smokeColor: "pinkSmoke",textDescription: "With a floral and sweet aroma, it transmits a sensation of comfort and coziness, in addition to acting as a euphoriator. Ideal for romantic ambiences.", badMisture: "As it is a very sweet floral scent, combine with a very citrusy element to balance", niceMistures: ["Lemon", "Passion Fruit", "Tangerine"],
                 imageDescription: "image of a cherry blossom which is a flowering tree with a pale, smooth trunk and small oval-shaped leaves with three flowers that have soft silky petals that are usually pink or white."
                ),
    EssenceModel(value: "ylang-ylang", icon: "Ylang Ylang",
                 smokeColor:"yellowSmoke",textDescription: "It has aphrodisiac properties and exotic aroma, in addition to decreasing nervous and muscular tension.", badMisture: "Ylang Ylang is a floral element, try it with woody elements and discover your new passion!",
                 niceMistures: ["Cotton", "Cinnamon", "Vanilla"],
                 imageDescription: "image of a yellow ylang-ylang flower with six long, thin petals that are arranged in a star shape around a central stalk. The petals are slightly wavy and have a soft, velvety texture."
                ),
    EssenceModel(value: "vanilla", icon: "Vanilla",
                 smokeColor:"vanillaSmoke",textDescription: "It has a fragrant, sweet and delicate aroma. In aromatherapy, it helps to alleviate the effects of anxiety, nervousness, depression and insomnia.", badMisture: "Because it is a sweet aroma, vanilla should be combined with citrus or floral aromas for a better result.",
                 niceMistures: ["Passion Fruit", "Roses", "Tangerine", "Lemon", "Lavender", "Ylang Ylang"],
                 imageDescription: "image of a Vanilla flower that are small, delicate, and white colored. The flower petals are soft and smooth to the touch, and the overall shape of the flower is somewhat tubular, with a flared lip at the end"
                ),
    EssenceModel(value: "peppermint", icon: "Peppermint",
                 smokeColor: "greenSmoke", textDescription: "It helps with concentration and motivates high performance in activities, as well as making breathing more pleasant due to the menthol aroma.", badMisture: "Peppermint is a minty scent, it works best with citrus and woody essences.",
                 niceMistures: ["Passion Fruit", "Lemon", "Tangerine", "Cinnamon", "Cotton"],
                 imageDescription: "image of two greens Peppermint leaves small and narrow, with a pointed tip and a serrated edge. They have a bright green color and a slightly fuzzy texture."
                ),
    EssenceModel(value: "cinnamon", icon: "Cinnamon",
                 smokeColor:"brownSmoke",textDescription: "Stimulating aroma that improves mood has great aphrodisiac and anti-inflammatory potential.", badMisture: "Cinnamon is a woody element. Combine with flower essences and see the magic!",
                 niceMistures: ["Roses", "Lavender", "Ylang Ylang", "Lemon", "Passion Fruit", "Tangerine", "Peppermint"],
                 imageDescription: "image of three cinnamon sticks that are made from the inner bark of a tree, which is dried and rolled into cylindrical shapes. The sticks are light brown in color and have a rough, textured surface."
                ),
    EssenceModel(value: "cotton", icon: "Cotton",
                 smokeColor:"vanillaSmoke",textDescription: "With woody notes, it fights insomnia and transmits freshness to the environment. It also has antidepressant potential.", badMisture: "Because it has a woody scent, cotton works best with a floral element. Try this!",
                 niceMistures: ["Ylang Ylang", "Roses", "Lavender", "Peppermint", "Passion Fruit", "Tangerine", "Lemon"],
                 imageDescription: "image of a cotton flower with white or cream-colored with a soft, fluffy appearance. They are composed of multiple layers of thin, papery petals that are tightly packed together, giving them a rounded shape."
                ),
    EssenceModel(value: "lemon", icon: "Lemon",
                 smokeColor:"greenSmoke", textDescription: "It has a citrus and light aroma. It promotes concentration in studies and work, as well as improving mood and physical and mental resistance to stress.", badMisture: "Due to its citricity, lemon goes well with sweet, floral or woody essences. Try one of these combinations, you will love it!",
                 niceMistures: ["Roses", "Vanilla", "Ylang Ylang", "Cherry Blossom", "Coconut", "Lavender", "Cinnamon", "Cotton", "Tangerine", "Peppermint"],
                 imageDescription: "image of a lemon which is oval-shaped citrus fruit with a bright yellow, smooth outer skin."
                ),
    EssenceModel(value: "roses", icon: "Roses",
                 smokeColor: "redSmoke", textDescription: "With a sweet and pleasant aroma, it will be the calming element of the ambience, bringing peace, romanticism and sensuality.", badMisture: "Floral aromas match with woody essences. Try to combine and see what success!",
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
