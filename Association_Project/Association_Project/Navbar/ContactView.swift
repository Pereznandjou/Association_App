//
//  ContactView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct ContactView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var message: String = ""
    @State private var confirmationMessage: String = ""

    let maxMessageLength = 300

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.purple]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // Header
                Text("Contactez-Nous")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)

                Text("Nous serons ravis de vous aider et de répondre à vos questions.")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer()

                // Champs du formulaire
                Group {
                    TextField("Nom", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)

                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                        .keyboardType(.emailAddress)

                    TextEditor(text: $message)
                        .frame(height: 150)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                        .onChange(of: message) { newValue in
                            if newValue.count > maxMessageLength {
                                message = String(newValue.prefix(maxMessageLength))
                            }
                        }

                    // Caractères restants
                    HStack {
                        Spacer()
                        Text("\(maxMessageLength - message.count) caractères restants")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                    }
                }

                // Bouton d'envoi
                Button(action: sendForm) {
                    Text("Envoyer")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                }

                // Message de confirmation
                if !confirmationMessage.isEmpty {
                    Text(confirmationMessage)
                        .foregroundColor(confirmationMessage == "Veuillez remplir tous les champs." ? .red : .green)
                        .padding()
                        .multilineTextAlignment(.center)
                }

                Spacer()
            }
            .padding()
        }
    }

    func sendForm() {
        if name.isEmpty || email.isEmpty || message.isEmpty {
            confirmationMessage = "Veuillez remplir tous les champs."
        } else {
            confirmationMessage = "Merci, \(name)! Votre message a été envoyé avec succès."
            name = ""
            email = ""
            message = ""
        }
    }
}

#Preview {
    ContactView()
}
