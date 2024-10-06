import SwiftUI

struct Renad: View {
    @State private var selectedCard: Int? = nil
    var selectedColor: Color?
    var selectedOption: String?
    let bodyShapes = ["Round Shape", "Hourglass Shape", "Rectangle Shape", "Inverted Triangle Shape", "Pear Shape"]
    
    let bodyShapeImages = ["Round", "Hourglass", "Rectangle", "Inverted Tringle", "pear"]
    
    let bodyShapeDescriptions = [
        "Characterized by a fuller bust, narrower hips, and broader shoulders, often with extra weight around the midsection.",
        "Characterized by a well-defined waist and balanced bust and hip measurements.",
        "A rectangle body means that the width of your bust, waist, and hips are approximately the same.",
        "Is an analogy that your bust and shoulders are broader than your hips.",
        "Pear body shape is characterised by large hips which are wider than the bust and shoulders."
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Choose Your Body Shape!")
                        .font(.custom("American Typewriter", size: 28)).bold()
                        .padding(.bottom, 0)
                        .fixedSize()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.center)
                       
                        .baselineOffset(15)
                        .padding()
                    
                    VStack(spacing: 20) {
                        ForEach(0..<bodyShapes.count, id: \.self) { index in
                            BodyShapeCard(
                                title: bodyShapes[index],
                                imageName: bodyShapeImages[index],
                                isSelected: selectedCard == index,
                                description: bodyShapeDescriptions[index]
                            )
                            .onTapGesture {
                                selectedCard = index
                            }
                            .padding(.horizontal, 17)
                        }
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                    HStack {
                        Spacer()
                        if let selectedCard = selectedCard {
                            
                            NavigationLink(destination: Bayan(selectedImage: bodyShapeImages[selectedCard], selectedColor: selectedColor, selectedOption: selectedOption)) {

                                Image(systemName: "arrow.right.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.black)
                            }
                            .padding(.bottom, 20)
                            .padding(.trailing, 20)
                        }
                    }
                }
                
                .padding()
            }
            .navigationBarBackButtonHidden(false)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 245/255, green: 245/255, blue: 247/255))
        }
    }
}

struct BodyShapeCard: View {
    let title: String
    let imageName: String
    let isSelected: Bool
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.custom("American Typewriter", size: 24)).bold()
                        .padding(.bottom, 0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(description)
                        .font(.custom("American Typewriter", size: 18))
                        .foregroundColor(.black)
                        .padding(.top, 5)
                }
                .padding()
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 66.5, height: 270)
                    .padding()
            }
            .frame(width: 370, height: 275)
            .background(isSelected ? Color.white : Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 7)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.black : Color.white, lineWidth: 2)
            )
        }
    }
}
#Preview {
    Renad()
}
