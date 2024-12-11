//
//  MonetaryDonView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct MonetaryDonView: View {
    @State private var customAmount: String = ""
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var cvc: String = ""
    @State private var showAlert: Bool = false
    @State private var showWarning: Bool = false

    var onBack: () -> Void

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.4)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                // Header avec bouton de retour
                HStack {
                    Button(action: {
                        onBack()
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding()

                // Titre principal
                Text("Faire un Don Monétaire")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                // Description inspirante
                Text("Votre contribution financière peut changer des vies. Merci de soutenir notre mission.")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Montant du don
                VStack(spacing: 15) {
                    TextField("Montant en €", text: $customAmount)
                        .keyboardType(.decimalPad)
                        .onChange(of: customAmount) { _ in
                            customAmount = customAmount.filter { $0.isNumber }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)

                    // Informations de carte bancaire
                    VStack(spacing: 10) {
                        TextField("Numéro de carte", text: $cardNumber)
                            .keyboardType(.numberPad)
                            .onChange(of: cardNumber) { _ in
                                cardNumber = String(cardNumber.prefix(16))
                                cardNumber = cardNumber.filter { $0.isNumber }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)

                        HStack(spacing: 10) {
                            TextField("MM/AA", text: $expiryDate)
                                .keyboardType(.numberPad)
                                .onChange(of: expiryDate) { _ in
                                    expiryDate = String(expiryDate.prefix(5))
                                    if expiryDate.count == 4 && !expiryDate.contains("/") {
                                        expiryDate = expiryDate.prefix(2) + "/" + expiryDate.suffix(2)
                                    }
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(expiryDate.contains("/") ? Color.green : Color.red, lineWidth: 2)
                                )

                            TextField("CVC", text: $cvc)
                                .keyboardType(.numberPad)
                                .onChange(of: cvc) { _ in
                                    cvc = String(cvc.prefix(3))
                                    cvc = cvc.filter { $0.isNumber }
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(.horizontal)

                // Bouton d'action
                Button(action: {
                    if customAmount.isEmpty || cardNumber.count < 16 || expiryDate.isEmpty || !expiryDate.contains("/") || cvc.count < 3 {
                        showWarning = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Faire un Don")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                .alert(isPresented: $showWarning) {
                    Alert(
                        title: Text("Champs Incomplets"),
                        message: Text("Veuillez remplir tous les champs correctement avant de soumettre votre don."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Merci pour votre don!"),
                        message: Text("Votre don a été soumis avec succès."),
                        dismissButton: .default(Text("OK"))
                    )
                }

                Spacer()

                // Footer
                Text("Merci pour votre générosité!")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
        }
    }
}

#Preview {
    MonetaryDonView {
        print("Retour à l'écran précédent")
    }
}
