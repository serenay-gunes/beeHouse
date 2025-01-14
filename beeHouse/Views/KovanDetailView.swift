//
//  KovanDetailView.swift
//  beeHouse
//
//  Created by Serenay Güneş on 18.11.2024.
//

import SwiftUI

struct KovanDetailView: View {
    var kovanName: String // Kovan ismini almak için bir parametre
    @State private var citaSayisi: Int = 0 // Çıta sayısını tutan değişken
    @State private var kovanDurumu: String = "" // Kovan durumu
    @State private var isDataSaved: Bool = false // Verinin kaydedilip kaydedilmediğini kontrol etmek için

    
    
    let kovanDurumlari = ["Boş", "Dolu"] // Kovan durumları

    
    var body: some View {
        VStack {
            Text("\(kovanName) Detayları")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            // Burada kovanla ilgili detaylar eklenebilir
            //Text("Burada \(kovanName) hakkında daha fazla bilgi yer alacak.")
              //  .padding()
            
            // Burada kovanla ilgili detaylar eklenebilir
          //  Text("Kraliçe Arı Bilgisi")
            //    .font(.title)
              //  .padding()
            
            
            //KRALİCE ARI İSLEMLERİ
                       
                       
            
            
            // Burada kovanla ilgili detaylar eklenebilir
            Text("Çıta Bilgisi")
                .font(.title)
                .padding()
            
            // Çıta sayısını girme
                       TextField("Bu kovanda kaç adet çıta var?", value: $citaSayisi, format: .number)
                           .padding()
                           .keyboardType(.numberPad)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
            
                       
            // Kovan durumu için Picker
                       Picker("Kovan Durumu", selection: $kovanDurumu) {
                           ForEach(kovanDurumlari, id: \.self) { durum in
                               Text(durum)
                                   .padding()
                                   

                           }
                       }
                      .pickerStyle(SegmentedPickerStyle()) // Segmented (Seçim butonları) stilinde göster
                       .padding()
            
            
            Button(action: {
                            // Veriyi kaydetme işlemi
                            isDataSaved = true
                            print("Çıta Sayısı: \(citaSayisi), Kovan Durumu: \(kovanDurumu)")
                            // Burada veriyi kaydedebilirsiniz (UserDefaults, CoreData vs.)
                        }) {
                            Text("Kaydet")
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(Color.yellow)
                                .cornerRadius(10)
                        }
                        .padding()
            
            if isDataSaved {
                          Text("Veri kaydedildi!")
                              .foregroundColor(.green)
                              .padding()
                      }
            
            Spacer()
        }
        .navigationTitle(kovanName)
        .padding()
    }
}

struct KovanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        KovanDetailView(kovanName: "Kovan 1") // Örnek kovan adı
    }
}
