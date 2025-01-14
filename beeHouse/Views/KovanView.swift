//
//  KovanView.swift
//  beeHouse
//
//  Created by Serenay Güneş on 17.11.2024.
//

import SwiftUI


struct KovanView: View {
    @State private var kovanSayisi: String = "" // Kullanıcıdan alınacak kovan sayısı
    @State private var sonuc: String = "" // Gösterilecek sonuç
    @State private var isCorrect: Bool? = nil // Doğru/yanlış durumu
    @State private var kovans: [String] = [] // Kovanları tutacak dizi




    var body: some View {
        VStack {
            
            Spacer()

            Text("Kaç kovanınız var?")
                .font(.title)
                .fontWeight(.bold) // Kalın font
                .padding()

            // Kovan sayısı inputu için TextField
            TextField("Kovan Sayısı", text: $kovanSayisi)
                .padding()
                .keyboardType(.numberPad) // Sayı girişi için klavye türü
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // "Göster" butonu
            Button(action: {
                // Boşluk kontrolü ve sayıya dönüştürme işlemi
                if let sayi = Int(kovanSayisi), sayi > 0 {
                    // Geçerli sayıyı kullanıcıya göster
                    isCorrect = true
                    sonuc = "\(sayi) adet kovanınız var."
                    // Kovan sayısı kadar bir dizi oluşturuluyor
                                        kovans = Array(repeating: "Kovan", count: sayi) // Kovan sayısı kadar "Kovan" metni içeren dizi oluşturuluyor
                } else {
                    // Geçersiz giriş durumunda hata mesajı
                    isCorrect = false
                    sonuc = "Lütfen geçerli bir sayı girin."
                    kovans = [] // Geçersiz giriş durumunda listeyi temizliyoruz

                }
            }) {
                Text("Kaydet")
                    .foregroundColor(.black)
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
            }
            
            Spacer()

            
            // Sonuç metni, renk durumu isCorrect'e göre değişir
                      if !sonuc.isEmpty {
                          Text(sonuc)
                              .font(.subheadline)
                              .padding()
                              .foregroundColor(isCorrect == true ? .green : .red) // Eğer doğruysa yeşil, yanlışsa kırmızı
                          
                      }

                        }
                        .padding()
    }
}


#Preview {
    KovanView()
}
