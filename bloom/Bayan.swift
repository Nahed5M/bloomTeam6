import SwiftUI

struct Bayan: View {
    let categories = ["Our fits", "Shirts", "Jeans", "Dress"]
    var selectedImage: String? = nil
    @State private var showInfoSheet: Bool = false
    let images = ["ourfits_image", "shirts_image", "jeans_image", "dress_image"]
    @State private var selectedCategory: String? = "nil"
    
    let adaptiveColumn = [GridItem(.adaptive(minimum: 165), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 16) {
                    
                    HStack(spacing: 20) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 165, height: 165)
                            
                            if let selectedImage = selectedImage {
                                Image(selectedImage)
                                    .resizable()
                                    .frame(width: 80, height: 150)
                                    .scaledToFit()
                                    .frame(width: 165, height: 165)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 4, x: 0, y: 2)
                            }
                        }
                        
                        VStack(spacing: 20) {
                            Text("Neture")
                                .font(.largeTitle)
                                .multilineTextAlignment(.leading)
                                .font(.custom("American Typewriter", size: 18))
                            
                            // Color circles
                            HStack(spacing: -10) {
                                Circle()
                                    .fill(Color(red: 1.0, green: 0.9, blue: 0.85))
                                    .frame(width: 40, height: 40)
                                    .overlay(Circle().stroke(Color.gray))
                                
                                Circle()
                                    .fill(Color(red: 0.95, green: 0.8, blue: 0.75))
                                    .frame(width: 40, height: 40)
                                    .overlay(Circle().stroke(Color.gray))
                                
                                Circle()
                                    .fill(Color(red: 0.9, green: 0.7, blue: 0.65))
                                    .frame(width: 40, height: 40)
                                    .overlay(Circle().stroke(Color.gray))
                                
                                Circle()
                                    .fill(Color(red: 0.8, green: 0.6, blue: 0.45))
                                    .frame(width: 40, height: 40)
                                    .overlay(Circle().stroke(Color.gray))
                                
                                Circle()
                                    .fill(Color(red: 0.4, green: 0.25, blue: 0.2))
                                    .frame(width: 40, height: 40)
                                    .overlay(Circle().stroke(Color.gray))
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    // Category title
                    Text("Explore our categories")
                        .font(.custom("American Typewriter", size: 18))
                        .padding(.horizontal)
                    
                    // Category grid
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                            ForEach(0..<categories.count, id: \.self) { index in
                                NavigationLink(destination: Sara()) {
                                    VStack {
                                        Image("ourfits_image")
                                            .resizable()
                                            .frame(width: 80, height: 140)
                                            .scaledToFit()
                                        
                                        Text(categories[index]) // Display the correct category name
                                            .font(.custom("American Typewriter", size: 18))
                                            .foregroundColor(.black)
                                    }
                                    .frame(width: 165, height: 165)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 4, x: 0, y: 2)
                                }
                                .simultaneousGesture(TapGesture().onEnded {
                                    selectedCategory = categories[index]
                                })
                            }
                        }
                        .padding()
                        .blur(radius: showInfoSheet ? 5 : 0) // Blur effect when info sheet is shown
                    }
                    Spacer()
                }
                
                // Info Sheet
                if showInfoSheet {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                       Spacer()
                        
                        VStack {
                            Image("Info")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                                .padding()
                            
                            Text("""
                                We help you discover the perfect styles that fit your body shape and skin undertone. We offer personalized recommendations to make fashion choices easier and tailored just for you. Whether it's casual or formal, we ensure you find the right pieces to match your unique look and feel confident every day.
                            """)
                            .multilineTextAlignment(.center)
                            .padding()
                            
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    showInfoSheet.toggle()
                                }
                            }) {
                                Text("Close")
                                    .fontWeight(.bold)
                                    .padding()
                                    .frame(width: 150)
                                    .background(Color.black.opacity(0.7))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.bottom, 20)
                        }
                        .frame(width: 300)
                        .background(Color(red: 245/255, green: 245/255, blue: 247/255))
                        .cornerRadius(15)
                        .shadow(radius: 20)
                        
                        Spacer()
                    }
                    .transition(.move(edge: .bottom))
                }
            }
          // .navigationTitle(selectedCategory)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            showInfoSheet.toggle()
                        }
                    }) {
                        Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 245/255, green: 245/255, blue: 247/255))
        }
    }
}

struct Bayan_Previews: PreviewProvider {
    static var previews: some View {
        Bayan(selectedImage: "ourfits_image")
    }
}

