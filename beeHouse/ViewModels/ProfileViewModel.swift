//
//  ProfileViewModel.swift
//  beeHouse
//
//  Created by Serenay Güneş on 11.01.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var hiveCount: Int = 0
    @Published var queenBeeTracking: Bool = false
    @Published var errorMessage: String = ""

    
    // Firestore'dan kullanıcı bilgilerini çekmek için fonksiyon
    func fetchUserProfile() {
        guard let userId = Auth.auth().currentUser?.uid else {
            self.errorMessage = "Kullanıcı oturum açmamış."
            return
        }

        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.errorMessage = "Profil bilgisi alınırken hata: \(error.localizedDescription)"
                }
                return
            }

            if let data = snapshot?.data() {
                DispatchQueue.main.async {
                    self?.name = data["name"] as? String ?? ""
                    self?.email = data["email"] as? String ?? ""
                    self?.hiveCount = data["hiveCount"] as? Int ?? 0
                    self?.queenBeeTracking = data["queenBeeTracking"] as? Bool ?? false
                }
            }
        }
    }

    
    // Firestore'a kullanıcı profil bilgilerini kaydetme
    func updateUserProfile() {
        guard let userId = Auth.auth().currentUser?.uid else {
            self.errorMessage = "Kullanıcı oturum açmamış."
            return
        }

        let db = Firestore.firestore()
        db.collection("users").document(userId).setData([
            "name": name,
            "email": email,
            "hiveCount": hiveCount,
            "queenBeeTracking": queenBeeTracking
        ]) { error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Profil güncellenirken hata: \(error.localizedDescription)"
                }
            }
        }
    }
    
    
    
    
}//class sonu
