//
//  CharacterDetailView.swift
//  FabiolaOrdinario
//
//  Created by win603 on 01/12/25.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var vm = SlayerViewModel()

    
    var body: some View {
        VStack(spacing: 16){
            HStack(spacing: 12){
                AsyncImage(url: URL(string: vm.personajesSeleccionado!.img)) { img in
                    img.resizable()
                } placeholder: {
                    ProgressView()
                }.frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(){
                    
                }
            }
        }
    }
}

//#Preview {
//    CharacterDetailView()
//}
