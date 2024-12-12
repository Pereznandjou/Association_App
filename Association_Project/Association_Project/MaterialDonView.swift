//
//  MaterialDonView.swift
//  Association_Project
//
//  Created by Wendy ALPHANOR on 10/12/2024.
//

import SwiftUI

struct MaterialDonView: View {
    @State private var nom: String = ""
    @State private var prenom: String = ""
    @State private var adresseExpediteur: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var onBack: () -> Void

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // En-tête avec retour
                HStack {
                    Button(action: {
                        onBack()
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                            .padding()
                    }
                    Spacer()
                }

                // Titre principal
                Text("Faire un Don Matériel")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                
                // Description
                Text("Aidez les sans-abris en envoyant des dons matériels ou en les déposant à un point de collecte proche. Vous pouvez également générer un bandeau d'envoi pour vos colis.")
                    .font(.body)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)

                // Liste des Associations
                SectionView(
                    title: "Associations",
                    description: "Voici des associations où vous pouvez faire un don matériel :",
                    links: [
                        ("Les Restos du Cœur", "https://www.restosducoeur.org"),
                        ("Emmaüs", "https://www.emmaus-france.org"),
                        ("La Croix-Rouge", "https://www.croix-rouge.fr"),
                        ("Secours Populaire", "https://www.secourspopulaire.fr")
                    ]
                )
                .padding(.horizontal)

                Text("Envoyer un colis")


                // Formulaire pour générer un bandeau d'envoi
                VStack(spacing: 15) {
                    TextField("Nom", text: $nom)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)

                    TextField("Prénom", text: $prenom)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)

                    TextField("Adresse de l'expéditeur", text: $adresseExpediteur)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)

                // Bouton pour générer le bandeau
                Button(action: {
                    if nom.isEmpty || prenom.isEmpty || adresseExpediteur.isEmpty {
                        alertMessage = "Veuillez remplir tous les champs pour générer le bandeau."
                        showAlert = true
                    } else {
                        generateBandeau(nom: nom, prenom: prenom, adresse: adresseExpediteur)
                    }
                }) {
                    Text("Télécharger votre bandeau d'envoi")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Information"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }

                Spacer()

                // Footer inspirant
                Text("Merci pour votre générosité et votre soutien!")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()
            }
            .padding()
        }
        .background(Color(.systemGray6))
    }

    private func generateBandeau(nom: String, prenom: String, adresse: String) {
        // Contenu du bandeau
        let bandeauContent = """
        Expéditeur :
        \(prenom) \(nom)
        \(adresse)
        
        Merci de coller ce bandeau sur votre colis avant l'envoi.
        """
        
        // Génération du PDF
        let fileName = "Bandeau_Don.pdf"
        let pdfPath = NSTemporaryDirectory() + fileName
        let renderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: 300, height: 150))
        
        do {
            let data = renderer.pdfData { context in
                context.beginPage()
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center
                
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 12),
                    .paragraphStyle: paragraphStyle
                ]
                
                let attributedString = NSAttributedString(string: bandeauContent, attributes: attributes)
                attributedString.draw(in: CGRect(x: 10, y: 10, width: 280, height: 130))
            }
            
            try data.write(to: URL(fileURLWithPath: pdfPath))
            alertMessage = "Le bandeau a été généré avec succès et se trouve à l'emplacement : \(pdfPath)"
            showAlert = true
        } catch {
            alertMessage = "Erreur lors de la génération du bandeau : \(error.localizedDescription)"
            showAlert = true
        }
    }
}

struct SectionView: View {
    let title: String
    let description: String
    let links: [(String, String)]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.orange)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            ForEach(links, id: \.0) { link in
                Link(link.0, destination: URL(string: link.1)!)
                    .font(.body)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    MaterialDonView {
        print("Retour à l'écran précédent")
    }
}
