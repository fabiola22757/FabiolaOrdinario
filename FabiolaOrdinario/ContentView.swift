//
//  ContentView.swift
//  FabiolaOrdinario
//
//  Created by win603 on 01/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = SlayerViewModel()
    @State var personajeSeleccionado: Character? = nil
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Text("Listado de Personajes")
                    .font(.title2.bold())
                    .padding()
                
                Spacer()
                
                ScrollView (.vertical){
                    VStack(spacing: 8){
                        ForEach(vm.characters, id: \.id) { character in
                            
                            NavigationLink{
                                CharacterDetailView(vm: vm, character: character)
                            } label: {
                                HStack(spacing: 16){
                                    Spacer()
                                    VStack(alignment: .leading){
                                        AsyncImage(url: URL(string: character.img)) { img in
                                            img.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }.frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                    Spacer()
                                    
                                    VStack(alignment: .leading){
                                        Text(character.name)
                                            .foregroundStyle(Color.black)
                                            .font(.title2.bold())
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }.scrollContentBackground(.hidden)
                        .onAppear{
                            vm.getCharacters()
                        }
                }
            }
            
        }// termina body
        
    }
}

#Preview {
    ContentView()
}
