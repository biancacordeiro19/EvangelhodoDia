//
//  Login.swift
//  EvangelhodoDia
//
//  Created by Bianca Cordeiro on 14/01/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showError: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // Título
            Text("Bem-vindo!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            // Campo de Login
            TextField("Usuário", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            // Campo de Senha
            SecureField("Senha", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)

            // Botão de Entrar
            Button(action: handleLogin) {
                Text("Entrar")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            // Mensagem de erro (se houver)
            if showError {
                Text("Usuário ou senha inválidos")
                    .foregroundColor(.red)
                    .font(.footnote)
            }

            Spacer()
        }
        .padding()
        .navigationBarHidden(true)
    }

    private func handleLogin() {
        // Validação simples para exibir erro (pode ser ajustada conforme a lógica de autenticação)
        if username.isEmpty || password.isEmpty {
            showError = true
        } else {
            showError = false
            print("Usuário: \(username), Senha: \(password)")
            // Navegue para a próxima tela após a autenticação
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
