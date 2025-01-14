//
//  ConfiguracaoView.swift
//  EvangelhodoDia
//
//  Created by Bianca Cordeiro on 14/01/25.
//
import SwiftUI

struct Configuracoes: View {
    @State private var userName: String = "Nome do Usuário"
    @State private var userEmail: String = "usuario@exemplo.com"
    @State private var userAge: Int = 25
    @State private var newPassword: String = ""
    @State private var confirmNewPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Configurações")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            // Nome do usuário
            HStack {
                Text("Nome:")
                    .font(.headline)
                TextField("Nome", text: $userName)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            .padding()

            // E-mail do usuário
            HStack {
                Text("E-mail:")
                    .font(.headline)
                TextField("E-mail", text: $userEmail)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
            }
            .padding()

            // Idade do usuário
            HStack {
                Text("Idade:")
                    .font(.headline)
                TextField("Idade", value: $userAge, formatter: NumberFormatter())
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .keyboardType(.numberPad)
            }
            .padding()

            // Nova senha
            HStack {
                Text("Nova Senha:")
                    .font(.headline)
                SecureField("Nova Senha", text: $newPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            .padding()

            // Confirmar nova senha
            HStack {
                Text("Confirmar Senha:")
                    .font(.headline)
                SecureField("Confirmar Nova Senha", text: $confirmNewPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            .padding()

            // Botão para salvar as alterações
            Button(action: saveChanges) {
                Text("Salvar Alterações")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            Spacer()

            // Mensagens de erro ou sucesso
            if showAlert {
                Text(alertMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Erro"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    // Função para salvar as alterações
    private func saveChanges() {
        // Verificação de senhas
        if newPassword != confirmNewPassword {
            alertMessage = "As senhas não coincidem."
            showAlert = true
            return
        }

        // Verificação de e-mail
        if !isValidEmail(userEmail) {
            alertMessage = "O e-mail informado não é válido."
            showAlert = true
            return
        }

        // Simular a atualização dos dados
        alertMessage = "Alterações salvas com sucesso!"
        showAlert = true

        // Limpar campos de senha
        newPassword = ""
        confirmNewPassword = ""
    }

    // Função simples de validação de e-mail
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
}

struct ConfiguracoesView_Previews: PreviewProvider {
    static var previews: some View {
        Configuracoes()
    }
}

