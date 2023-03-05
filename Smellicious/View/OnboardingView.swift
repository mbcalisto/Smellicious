import Foundation
import Lottie
import SwiftUI
import UIKit
import WebKit

public struct OnboardingView: View {
    @AppStorage("showsOnboard") var showsOnboard: Bool = true
    @State var showSheet: Bool = true
    
    public var body: some View {
        ZStack{
            CombineEssencesView()
        }
        .sheet(isPresented: $showsOnboard, onDismiss: onDismiss, content: {
            TabView {
                WelcomeView()
                DragAndDropView()
                PropertiesView(showsOnboard: $showsOnboard)
            }
            .edgesIgnoringSafeArea(.all)
            .tabViewStyle(.page)
        })
    }
    func onDismiss() {
        showsOnboard = false
    }
}

public struct WelcomeView: View {
    @State private var topSpacing: CGFloat = 20
    public var body: some View{
        ZStack {
            Color.init(red: 0.89, green: 0.88, blue: 0.99)
                .edgesIgnoringSafeArea(.all)
            VStack {
                // Spacer().frame(height: 20)
                Image("diff")
                    .resizable()
                    .frame(width: 225, height: 239, alignment: .center)
                    .accessibility(label: Text("The app logo which is Line drawing of an aromatherapy diffuser with steam coming out of the top"))
                    .accessibilityRemoveTraits(.isImage)
                Spacer().frame(height: 35)
                ScrollView {
                    Text("Hey you! Welcome to Smellicious!")
                        .fontWeight(.medium)
                        .font(.system(.title, design: .rounded))
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                        .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                        .padding(.bottom,30)
                        .frame(width: 350,alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("The app that helps you combine the best scents and make your day more pleasant")
                        .fontWeight(.regular)
                        .font(.system(.title3, design: .rounded))
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                        .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                        .frame(width: 350,alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }.padding(.top, topSpacing)
        }
    }
}

public struct DragAndDropView: View {
    @State private var topSpacing: CGFloat = 20
    public var body: some View {
        ZStack{
            Color.init( red: 0.89, green: 0.88, blue: 0.99 )
                .edgesIgnoringSafeArea(.all)
            VStack {
                GifImage("dragAndDrop")
                    .frame(width: 300, height: 300, alignment: .center)
                    .overlay (
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(red: 50/255, green: 73/255, blue: 60/255), lineWidth: 1).blur(radius: 0.3)
                            .shadow(color:Color(red: 50/255, green: 73/255, blue: 60/255), radius: 1)
                            .accessibility(label: Text("Drag and drop animation"))
                    )
                    .accessibility(label: Text("Animated GIF of drag and drop interaction"))
                Spacer().frame(height: 20)
                ScrollView {
                    Text("Are you looking for the perfect match?")
                        .fontWeight(.medium)
                        .font(.system(.title, design: .rounded))
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                        .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                        .padding(.bottom,20)
                        .frame(width: 350,alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("To discover new aromas, choose two different essences that best match your mood and drag them to the indicated area")
                        .fontWeight(.regular)
                        .font(.system(.title3, design: .rounded))
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                        .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                        .frame(width: 350,alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                        .accessibilityRepresentation {
                            Text("To discover new aromas, choose two different essences, just clicking on each one and find out if is the best match.")
                        }
                }
            }.padding(.top, topSpacing)
        }
    }
}

public struct PropertiesView: View {
    @State private var topSpacing: CGFloat = 20
    @Binding var showsOnboard: Bool
    public var body: some View {
        ZStack {
            Color.init( red: 0.89, green: 0.88, blue: 0.99 )
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                GifImage("properties")
                    .frame(width: 300, height: 300, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(red: 50/255, green: 73/255, blue: 60/255), lineWidth: 1).blur(radius: 0.3)
                            .shadow(color:Color(red: 50/255, green: 73/255, blue: 60/255), radius: 1)
                            .accessibility(label: Text("Drag and drop animation"))
                    )
                    .accessibility(label: Text("Animated GIF of drag and drop interaction"))
                Spacer().frame(height: 20)
                ScrollView {
                    Text("""
                         Are you in doubt which
                         essence best matches you?
                         """)
                        .fontWeight(.medium)
                        .font(.system(.title, design: .rounded))
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                        .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                        .padding(.bottom,30)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("""
                    Click on the essence of your interest and discover all the benefits it can bring
                    So, let's find your perfect match?
                    """)
                    .fontWeight(.regular)
                    .font(.system(.title3, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,30)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibilityRepresentation {
                        Text("Click and hold for a second on the essence of your interest and discover all the benefits it can bring. So, let's find your perfect match?")
                    }
                    Button(action: {
                        showsOnboard.toggle()
                    }, label: {
                        Text("Let's go!")
                            .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                            .fontWeight(.medium)
                            .font(.system(.title2, design: .rounded))
                            .frame(width: 120,height: 50)
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color.init(red: 235/255, green: 252/255, blue: 225/255)))
                            .minimumScaleFactor(0.5)
                    })
                }
            }.padding(.top, topSpacing)
        }
    }
}

public struct OnboardingView_Previews: PreviewProvider {
    public static var previews: some View {
        OnboardingView()
    }
}
