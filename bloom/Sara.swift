import SwiftUI

struct Sara: View {
    var selectedCategory: String? // Selected category from the previous view
    
    // Define images for each category
    let categoryImages: [String: [String]] = [
        "Our fits": ["ourfits_image1", "ourfits_image2", "ourfits_image3"],
        "Tops": ["image1", "image2", "image3", "image4", "image5", "image6"],
        "Bottoms": ["jeans_image1", "jeans_image2", "jeans_image3"], // Ensure category matches what you have in Bayan
        "Dresses": ["dress_image1", "dress_image2", "dress_image3"]
    ]

    // Define columns for the grid
    let adaptiveColumns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 20), count: 2)

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    // Background color
                    Color(red: 245/255, green: 245/255, blue: 247/255)
                        .edgesIgnoringSafeArea(.all)

                    ScrollView {
                        // Retrieve images based on the selected category
                        let images = categoryImages[selectedCategory ?? ""] ?? []
                        LazyVGrid(columns: adaptiveColumns, spacing: 35) {
                            ForEach(images.indices, id: \.self) { index in
                                NavigationLink(destination: DetailView(selectedImage: images[index])) {
                                    ZStack {
                                        Color.white
                                            .frame(width: 178, height: 178)
                                            .cornerRadius(20)
                                        
                                        Image(images[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 130, height: 130) // Adjust size if needed
                                            .clipped()
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.top, 100)
                        .padding(.horizontal, 20)
                    }
                }
            }
            .navigationTitle(selectedCategory ?? "Categories") // Display the selected category title
        }
    }
}

// Detail View
struct DetailView: View {
    var selectedImage: String
    
    var body: some View {
        VStack {
            Image(selectedImage)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .clipped()
                .cornerRadius(20)
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white)
    }
}

struct Sara_Previews: PreviewProvider {
    static var previews: some View {
        Sara() // Preview with a sample category
    }
}
