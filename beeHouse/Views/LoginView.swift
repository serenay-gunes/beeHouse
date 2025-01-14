//
//  LoginView.swift
//  beeHouse
//


import SwiftUI
import FirebaseCore
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var showError = false
    @State private var loginSuccess = false // giriş başarılı olduğunda yönlendirme için


    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                // logo kısmı
                Image("bee7")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    //.foregroundColor(.blue)
                    .padding(.bottom, 10)
                 
                
                //giris yapma islemleri
                Text("Giriş Yap")
                    .font(.title) // başlık fontu
                        .fontWeight(.bold) // kalın font
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .italic()

                
                // Email TextField
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 35)
                    .padding(.bottom, 10)
                    .autocapitalization(.none)
                    .font(.subheadline)
                
                
                // Password SecureField
                SecureField("Şifre", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 35)
                    .padding(.bottom, 30)
                    .font(.subheadline)
                
                //error kısmı
                if showError {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                               }



                // giriş butonu
                Button(action: loginUser) {
                    Text("Giriş Yap ")
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
               
                
                // hesabınız yok mu
                NavigationLink(destination: RegisterView()) {
                                  Text("Henüz bir hesabınız yok mu? Kayıt Ol.")
                                     // .font(.footnote)
                                      .font(.subheadline)
                                      .foregroundColor(.gray)
                                      .padding(.top, 10)
                              }
                
                // şifremi unuttum (sonra ilgilenilecek)
                Button(action: {
                    // Şifre sıfırlama işlemini başlat
                    print("Şifre sıfırlama işlemi")
                    
                }) {
                    Text("Şifremi unuttum.")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                }

                Spacer()
                Spacer()


            }//Vstacksonu
            .padding()
           // .navigationTitle("Giriş Yap")
            .navigationDestination(isPresented: $loginSuccess) {
            // Giriş başarılı olursa yönlendirme yapılacak ekran
            MainView() // Ana ekrana yönlendirme örneği
                        }
        }//navigationviewsonu
    }// body sonu
    
    //fonksiyon structın icinde bodynin dısında
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
                showError = true
            } else {
                DispatchQueue.main.async { //giriş yapma asenkron diye sonradan ekledim
                    loginSuccess = true
                }
            }
        }
    }

    
} //struct sonu




#Preview {
    LoginView()
}
