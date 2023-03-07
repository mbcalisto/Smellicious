//  CombineEssencesView.swift
//  SmelliciousTest
//  Created by Emilly Maia on 15/09/22.
//

import SwiftUI
import Algorithms
import Lottie
import AVFoundation

struct CombineEssencesView: View {
    @Environment(\.accessibilityShowButtonShapes)
    private var accessibilityShowButtonShapes
    @State var essences: [EssenceModel] = essences_
    @State var essence1: EssenceModel? = nil
    @State var essence2: EssenceModel? = nil
    @State var popupPositive = false
    @State var popupNegative = false
    @State var smokeName = "defaultSmoke"
    @State var isPopover = false
    @State var mutedAudio = false
    @State var audioPlayer: AVAudioPlayer!
    @State var humidify: AVAudioPlayer!
    @State var isPlaying = true
    @State var positiveFeedback = "Sparkless"
    @State var sparkles = false
    @State var droppedEssence1: EssenceModel? = nil
    @State var droppedEssence2: EssenceModel? = nil
    @State private var showingAlert: Bool = false
    @State var response = false
    @State var alertTitle: String = " "
    @State var alertMessage: String = " "
    
    private var alertButtonText: String = "Start Over!"
    
    
    func drag(){
        let pathSounds = Bundle.main.path(forResource: "drag", ofType: "wav")!
        let url = URL(fileURLWithPath: pathSounds)
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            audioPlayer.volume = 0.3
        } catch {
            print(error)
        }
    }
    
    func drop(){
        let pathSounds = Bundle.main.path(forResource: "drop", ofType: "wav")!
        let url = URL(fileURLWithPath: pathSounds)
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            audioPlayer.volume = 0.3
        } catch {
            print(error)
        }
    }
    
    func playSounds(_ humidifySound : String) {
        guard let soundURL = Bundle.main.url(forResource: humidifySound, withExtension: nil) else {
            fatalError("Unable to find \(humidifySound) in bundle")
        }
        do {
            humidify = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error)
        }
        humidify.play()
        humidify.volume = 0.4
        humidify.numberOfLoops = 5
    }
    func ResetButton() -> some View {
        Button(action: {
            smokeName = "defaultSmoke"
            essence1 = nil
            essence2 = nil
        } ,label: {
            Image(systemName: "arrow.clockwise")
                .padding(3)
                .foregroundColor(.black)
                .border(
                    .red,
                    width: accessibilityShowButtonShapes ? 1 : 0
                )
        })
    }
    func ResetAll(){
        smokeName = "defaultSmoke"
        essence1 = nil
        essence2 = nil
    }
    func mutedButton() -> some View {
        Button {
            if isPlaying {
                humidify.pause()
                isPlaying = false
            } else {
                humidify.play()
                isPlaying = true
            }
        } label: {
            Image(systemName: isPlaying ? "speaker.slash" :  "speaker.wave.2")
                .padding(3)
                .border(
                    .red,
                    width: accessibilityShowButtonShapes ? 1 : 0
                )
                
                
        }
        .foregroundColor(.black)
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.init(red: 235/255, green: 252/255, blue: 225/255)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    ZStack{
                        Mancha()
                            .frame(width: 100, height: 180)
                            .offset(x: 0, y: -60)
                        VStack{
                            LottieView(name: smokeName, loopMode: .loop)
                                .frame(width: 250, height: 250)
                                .offset(x: 0, y: -200)
                        }
                        Difusor()
                            .frame(width: 100, height: 180)
                            .offset(x: 0, y: -20)
                    }
                    .offset(x: 0, y: 60)
                    VStack {
                        HStack(spacing: 31) {
                            DropArea(essence: essence1) { id in
                                let impact = UIImpactFeedbackGenerator(style: .heavy)
                                impact.impactOccurred()
                                hapticFeedback()
                                droppedEssence1 = essences.first { essence in
                                    return essence.id == id
                                }
                                essence1 = droppedEssence1
                                checkMisture()
                                if isPlaying == true{
                                    drop()
                                }
                                smokeName = (essence1?.smokeColor)!
                            }.accessibility(label: (essence1 != nil) ? Text("First essence space filled with \(essence1?.value ?? "")") : Text("First essence space empty"))
                                .accessibilityRemoveTraits(.isImage)
                            
                            
                            DropArea2(essence: essence2) { id in
                                let impact = UIImpactFeedbackGenerator(style: .heavy)
                                impact.impactOccurred()
                                hapticFeedback()
                                droppedEssence2 = essences.first { essence in
                                    return essence.id == id
                                }
                                essence2 = droppedEssence2
                                checkMisture()
                                if isPlaying == true{
                                    drop()
                                }
                                smokeName = (essence2?.smokeColor)!
                            }.accessibility(label: (essence2 != nil) ? Text("Second essence space filled with \(essence2?.value ?? "")") : Text("Second essence space empty"))
                                .accessibilityRemoveTraits(.isImage)
                        }
                        Divider()
                            .frame(width:330)
                            .padding(.top)
                        Text("Essences")
                            .fontWeight(.medium)
                            .foregroundColor(Color.init( red: 0.19, green: 0.28, blue: 0.23))
                            .font(.system(.title, design: .rounded))
                            .frame(width: 160, height: 45, alignment: .bottom)
                            .dynamicTypeSize(...DynamicTypeSize.accessibility1)
                        Divider()
                            .frame(width:330)
                            .padding(.top)
                        DragArea()
                        Divider()
                            .frame(width:330)
                    }
                }.ignoresSafeArea()
                    .toolbar {
                        ResetButton()
                        mutedButton()
                    }
            }
            
        }.accessibilityHidden(popupNegative || popupPositive)
            .navigationViewStyle(.stack)
            .onAppear(perform: {
                playSounds("humidifySound.mp3")
            })
            .overlay {
                if sparkles {
                    LottieView(name: "confete")
                        .offset(x: 0, y: -200)
                }
                popupView(popupPositive: $popupPositive, popupNegative: $popupNegative, smokeName: $smokeName, essence1: $essence1, essence2: $essence2, sparkles: $sparkles)
                
            }
    }
    
    @ViewBuilder
    func DragArea() -> some View {
        TabView {
            let chunks = Array(essences.chunks(ofCount: 3))
            ForEach(0..<4) { page in
                let essences = chunks[page]
                HStack(spacing: 30) {
                    ForEach(essences, id: \.self) { row in
                        VStack{
                            let isSelected = row == essence1 || row == essence2
                            ImageElementComponent(essence: row)
                                .contentShape(.dragPreview, Circle())
                                .opacity(isSelected ? 0.5 : 1.0)
                            Text(row.value)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.init( red: 0.19, green: 0.28, blue: 0.23))
                                .dynamicTypeSize(...DynamicTypeSize.accessibility1)
                            
                            
                        }
                        .accessibilityRepresentation {
                            VStack {
                                Button(action: {
                                    dropAccessibilityMode(row: row)
                                }) {
                                    let isSelected = row == essence1 || row == essence2
                                    ImageElementComponent(essence: row)
                                        .opacity(isSelected ? 0.5 : 1.0)
                                }
                                Text(row.value)
                                    .foregroundColor(Color.init( red: 0.19, green: 0.28, blue: 0.23))
                                    .accessibilityHidden(true)
                            }
                        }
                        
                        // MARK: - Adding Drag Operation
                        .onDrag {
                            if isPlaying == true{
                                drag()
                            }
                            //Returning ID to find wich Item is Moving
                            if row.id == essence1?.id || row.id == essence2?.id {
                                return NSItemProvider()
                            } else {
                                return .init(contentsOf: URL(string:row.id))!
                            }
                        } preview: {
                            Image(row.icon)
                                .resizable()
                                .cornerRadius(900)
                                .frame(width: SizesComponents.widthScreen*0.20,
                                       height: SizesComponents.widthScreen*0.20, alignment: .leading)
                                .contentShape(.dragPreview, Circle())
                            
                        }
                    }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame( height: 200)
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
                
        }.alert(Text(alertTitle),
                isPresented: $showingAlert,
                actions: {
            
                    Button(alertButtonText) {
                        ResetAll()
                    }
                }, message: {
                    Text(alertMessage)
                }
            )
    }
    
    func checkMisture() -> Bool {
        guard let essence1 = essence1 else {
            return false
        }
        guard let essence2 = essence2 else {
            return false
        }
        
        if essence2.niceMistures.contains(essence1.value) {
            if UIAccessibility.isVoiceOverRunning {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                    showingAlert = true
                    alertTitle = "Yes!"
                    alertMessage = "Your combination is a success! Enjoy your new scent. How about reading a book to make this moment even more perfect?"
        
                }
            }else{
                
                 DispatchQueue.main.async {
                     withAnimation {
                         sparkles = true
                     }
                 }
                     withAnimation {
                         popupPositive = true
                 }
            }
            
            return true
        }
        else {
            if UIAccessibility.isVoiceOverRunning {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                    showingAlert = true
                    alertTitle = "Oh no!"
                    alertMessage = "\(essence1.badMisture)"
                }
//                ResetAll()
                
            }else{
                     withAnimation {
                         popupNegative = true
                }
//                ResetAll()
            }
            
        }
        return false
    }
    
    func dropAccessibilityMode(row: EssenceModel) {
        for item in essences {
            if item.id == row.id && essence1 == nil {
                essence1 = row
                break
            } else if item.id == row.id && essence1 == row {
                essence1 = nil
                break
            } else if item.id == row.id && essence1 != nil && essence2 == nil{
                essence2 = row
                break
            } else if item.id == row.id && essence2 == row {
                essence2 = nil
                break
            }
        }
        if essence1 != nil && essence2 != nil {
            if checkMisture() {
                essence1 = nil
                essence2 = nil
            }
            
        }
    }
}

extension View {
    func hapticFeedback (style: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) -> some View {
        self.onTapGesture {
            let impact = UIImpactFeedbackGenerator(style: .heavy)
            impact.impactOccurred()
        }
    }
}
