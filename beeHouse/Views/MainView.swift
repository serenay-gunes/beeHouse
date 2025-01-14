//
//  MainView.swift
//  beeHouse
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Burası MainView") // Ana ekran içeriği
                
                Spacer()
                
                // ProfileView'a geçiş butonu
                NavigationLink(destination: ProfileView(viewModel: ProfileViewModel())) {
                    Text("Profilime Git")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
                
                Spacer()
            }
            .navigationTitle("MainView")
        }
    }
}


#Preview {
    MainView()
}

