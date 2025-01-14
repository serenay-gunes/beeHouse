//
//  ProfileView.swift
//  beeHouse
//
//  Created by Serenay Güneş on 11.01.2025.
//

import SwiftUI
import FirebaseFirestore

struct ProfileView: View {
  // @StateObject private var viewModel = ProfileViewModel() // ViewModel bağlantısı
    @ObservedObject var viewModel: ProfileViewModel // ViewModel'i parametre olarak alıyoruz


    @State private var name = "John Doe"
    @State private var email = "john.doe@example.com"
    @State private var hiveCount = 10
    @State private var queenBeeTracking = true

    var body: some View {
        
        VStack(spacing: 20) {
            
            // Kullanıcı bilgileri
            Text("Profilim")
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            TextField("Ad Soyad", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Text("E-posta: \(email)")
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                Text("Kovan Sayısı: \(hiveCount)")
                Spacer()
            }.padding(.horizontal)

            Toggle("Kraliçe Arı Takibi", isOn: $queenBeeTracking)
                .padding(.horizontal)

            Button(action: viewModel.updateUserProfile) {
                            Text("Profili Güncelle")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Hata Mesajı
            if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
            }
            
            Spacer()
            
        }//Vstack sonu
        .padding()
        .onAppear {
                   viewModel.fetchUserProfile() // Ekran açıldığında veriyi çek
                   }
    }//body sonu
    
} //struct sonu


#Preview {
    ProfileView(viewModel: ProfileViewModel())
}
