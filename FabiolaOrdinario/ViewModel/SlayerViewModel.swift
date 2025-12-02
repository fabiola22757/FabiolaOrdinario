//
//  SlayerViewModel.swift
//  FabiolaOrdinario
//
//  Created by win603 on 01/12/25.
//

import Foundation
import Combine

class SlayerViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var personajesSeleccionado: Character?
    
    func getCharacters() {
        let endPoint = "https://www.demonslayer-api.com/api/v1/characters?limit=150"
        guard let apiURL = URL(string: endPoint) else { fatalError("URL no válida o no definida") }
        
        URLSession.shared.dataTask(with: apiURL) { data, response, error in
            if let error = error {
                print("Error al conectar: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Respuesta inválida del servidor")
                return
            }
            
            guard let data = data else {
                print("Datos vacíos")
                return
            }
            
            do {
                print(data)
                let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
                DispatchQueue.main.async {
                    self.characters = decoded.content
                }
            } catch {
                print("Error al decodificar JSON: \(error)")
            }
        }.resume()
    }
}
