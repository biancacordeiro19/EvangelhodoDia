//
//  Pergunta.swift
//  Evangelho
//
//  Created by Bianca Cordeiro on 23/11/24.
//

import SwiftUI

struct QuestionView: View {
    // Variáveis para armazenar a resposta do usuário
    @State private var userAnswer: String = ""
    @State private var submittedAnswer: String? = nil

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Pergunta principal
                Text("Como viver o Evangelho?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.brown)
                    .multilineTextAlignment(.center)
                    .padding()

                // Campo para o usuário inserir sua resposta
                TextEditor(text: $userAnswer)
                    .padding()
                    .frame(height: 150)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.brown, lineWidth: 1)
                    )
                    .autocapitalization(.sentences)
                    .lineLimit(nil)

                // Botão para enviar a resposta
                Button(action: submitAnswer) {
                    Text("Enviar Resposta")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.brown)
                        .cornerRadius(8)
                }

                // Mostrar a resposta enviada, se houver
                if let answer = submittedAnswer {
                    Text("Sua Resposta:")
                        .font(.headline)
                        .foregroundColor(.brown)
                        .padding(.top)

                    Text(answer)
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }

                Spacer()
            }
            .padding()
            .navigationBarTitle("Pergunta", displayMode: .inline)
            .background(Color(red: 0.95, green: 0.88, blue: 0.76)) // Fundo bege claro
        }
    }

    // Função para processar a resposta enviada
    private func submitAnswer() {
        // Armazenar a resposta do usuário
        if userAnswer.isEmpty {
            submittedAnswer = "Por favor, insira uma resposta antes de enviar."
        } else {
            submittedAnswer = userAnswer
            userAnswer = "" // Limpar o campo após o envio
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
