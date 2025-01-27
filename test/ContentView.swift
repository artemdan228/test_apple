//
//  ContentView.swift
//  test
//
//  Created by Artem on 27.01.2025.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = "" // Поле для имени пользователя
    @State private var password: String = "" // Поле для пароля
    @State private var isLoginSuccessful: Bool = false // Статус входа
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Добро пожаловать!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.bottom, 40)
                
                // Поле ввода имени пользователя
                TextField("Имя пользователя", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Поле ввода пароля
                SecureField("Пароль", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Кнопка "Войти"
                NavigationLink(destination: ProfileView(username: username), isActive: $isLoginSuccessful) {
                    Button(action: {
                        handleLogin()
                    }) {
                        Text("Войти")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .disabled(username.isEmpty || password.isEmpty) // Отключаем, если поля пусты
                
                Spacer()
            }
            .padding()
        }
    }
    
    // Обработка логина
    func handleLogin() {
        // Пример простой логики для проверки
        if username.lowercased() == "admin" && password == "1234" {
            isLoginSuccessful = true
        } else {
            isLoginSuccessful = false
        }
    }
}

// Вторая страница — Профиль пользователя
struct ProfileView: View {
    let username: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Привет, \(username)!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            Text("Это твой профиль.")
                .font(.title2)
                .foregroundColor(.gray)
            
            Spacer()
            
            // Возврат к предыдущей странице
            NavigationLink(destination: LoginView()) {
                Text("Выйти")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

// Основной экран
struct ContentView: View {
    var body: some View {
        LoginView()
    }
}

#Preview {
    ContentView()
}
