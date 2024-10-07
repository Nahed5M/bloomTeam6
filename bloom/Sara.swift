import SwiftUI

struct Sara: View {
    // تعريف الأعمدة مع ضبط التباعد الأفقي
    let adaptiveColumns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 20), count: 2)
    
    // أسماء الصور للاستخدام
    let imageNames = ["image1", "image2", "image3", "image4", "image5", "image6"]
    
    // أحجام الصور (يمكن تعديلها حسب الحاجة)
    let imageSizes: [CGSize] = [
        CGSize(width: 130, height: 130),
        CGSize(width: 165, height: 170),
        CGSize(width: 180, height: 180),
        CGSize(width: 180, height: 180),
        CGSize(width: 200, height: 200),
        CGSize(width: 150, height: 150)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    // يمكنك تغيير لون الخلفية هنا
                    Color(red: 245/255, green: 245/255, blue: 247/255) // لون الخلفية
                        .edgesIgnoringSafeArea(.all) // لجعل اللون يغطي كل المساحة

                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns, spacing: 35) { // التباعد العمودي
                            ForEach(0..<imageNames.count, id: \.self) { index in
                                NavigationLink(destination: DetailView(selectedImage: imageNames[index])) { // الانتقال إلى صفحة التفاصيل
                                    ZStack { // استخدم ZStack لضمان تداخل الصورة مع الخلفية
                                        Color.white
                                            .frame(width: 178, height: 178) // حجم المربعات
                                            .cornerRadius(20)
                                        
                                        Image(imageNames[index])
                                            .resizable() // تجعل الصورة قابلة لتغيير الحجم
                                            .scaledToFit() // تجعل الصورة تتناسب مع المربع دون قص
                                            .frame(width: imageSizes[index].width, height: imageSizes[index].height) // استخدام الحجم المحدد
                                            .clipped() // لضمان أن الصورة لا تتجاوز الحدود
                                    }
                                }
                                .buttonStyle(PlainButtonStyle()) // لإزالة النمط الافتراضي لـ NavigationLink
                            }
                        }
                        .padding(.top, 100)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    }
                }
            }
        }
    }
}

// صفحة التفاصيل
struct DetailView: View {
    var selectedImage: String
    
    var body: some View {
        VStack {
            // عرض الصورة المختارة
            Image(selectedImage)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .clipped()
                .cornerRadius(20)
        }
       
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white) // لون الخلفية لصفحة التفاصيل
    }
}

#Preview {
    Sara()
    }
