//
//  RegisterView.swift
//  beeHouse
//


import SwiftUI
import FirebaseCore
import FirebaseAuth

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage = ""
    @State private var showError = false
    @State private var registrationSuccess = false //kayıt başarılı olduğunda yönlendirme için

    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()

                Image("bee7")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 10)
                
                Text("BeeHouse")
                    .font(.title) // Başlık fontu
                        .fontWeight(.bold) // Kalın font
                        .frame(maxWidth: .infinity, alignment: .center) // Ortalar
                        .italic()

                
                // Email TextField
                TextField("Email giriniz.", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 35)
                    .padding(.bottom, 10)
                    .autocapitalization(.none)
                    .font(.subheadline)
                
                    
            
                // Password SecureField
                SecureField("Şifre giriniz.", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 35)
                    .padding(.bottom, 10)
                    .font(.subheadline)

                // Password SecureField
                SecureField("Şifreyi yeniden giriniz.", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 35)
                    .padding(.bottom, 30)
                    .font(.subheadline)

                //kayıt ol butonu
                Button(action: registerUser) {
                    Text("Kayıt Ol")
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }

                //zaten üyeyse giriş yapa
                NavigationLink("Zaten üye misiniz? Giriş yap.", destination: LoginView())
                    .padding()
                    .foregroundColor(.gray)
                
                //error kısmı
                if showError {
                               Text(errorMessage)
                                   .foregroundColor(.red)
                                   .padding()
                           }
                
                
                Spacer()
                Spacer()
                
                // Kayıt başarılıysa LoginView'a yönlendirme
                NavigationLink(destination: LoginView(),
                               isActive: $registrationSuccess)
                {
                EmptyView()
                }
                //üstteki navigationlink değişitirilecek 

            } //vstack kapanıs
           
           // .navigationTitle("Register")
        } //navigationview kapanıs sanırım
        
    } // var body kapanıs
    
    
    private func registerUser() {
            guard password == confirmPassword else {
                errorMessage = "Şifreler eşleşmiyor."
                showError = true
                return
            }
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    errorMessage = error.localizedDescription
                    showError = true
                } else {
                    errorMessage = "Kayıt başarılı!"
                    showError = true
                    // Kayıt başarılı olduğunda LoginView'a geçiş
                    registrationSuccess = true
                }
            }
        } //fonk sonu
    
    
} //struct sonu


#Preview {
    RegisterView()
}
