//
//  KovanListView.swift
//  beeHouse
//



import SwiftUI

struct KovanListView: View {
    var kovans: [String] // Listeyi almak için bir değişken
    
    var body: some View {
        NavigationView { // NavigationView eklenmeli
            
            VStack {
                Text("Kovanlar Listesi")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                // ScrollView ile kartları göstermek
                ScrollView {
                    VStack(spacing: 10) {  //kartlar arası bosluk spacing ile
                        // Kovanları liste olarak göstermek
                        ForEach(kovans, id: \.self) { kovan in
                            NavigationLink(destination: KovanDetailView(kovanName: kovan)) {
                                HStack {
                                    Text(kovan)
                                        .padding()
                                        .frame(maxWidth: .infinity, minHeight: 100) // Minimum yükseklik belirledik
                                       // .frame(maxWidth: .infinity, maxHeight: 150) // Kartın yüksekliğini arttırdık
                                        .background(Color(white: 0.95))
                                        .cornerRadius(10)
                                        .padding(.vertical, 5) // Kartlar arasına boşluk ekler
                                }
                            }
                            .buttonStyle(PlainButtonStyle()) // Butonun varsayılan stilini kaldırır
                        }
                    }
                    .padding(.horizontal) // ScrollView içindeki öğelerin yatayda kenara daha yakın olmasını sağlar
                }
            }
            .padding()
        }
    }
}
struct KovanListView_Previews: PreviewProvider {
    static var previews: some View {
        KovanListView(kovans: ["Kovan 1", "Kovan 2", "Kovan 3","Kovan 4", "Kovan 5"]) // Önizleme için örnek veri
    }
}
