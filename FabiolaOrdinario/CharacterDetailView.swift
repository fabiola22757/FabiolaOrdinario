//
//  CharacterDetailView.swift
//  FabiolaOrdinario
//
//  Created by win603 on 01/12/25.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var vm = SlayerViewModel()
    var character: Character
    
    var body: some View {
        VStack{
            VStack(alignment: .center){
                HStack(spacing: 12){
                    AsyncImage(url: URL(string: character.img)) { img in
                        img.resizable()
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 200, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(){
                        Spacer()
                        Text("\(character.id)")
                            .bold(true)
                            .padding()
                        
                        Text(character.name)
                            .font(.headline.bold())
                            .underline()
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 8)
                        
                        HStack{
                            Text("Age")
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .multilineTextAlignment(.center)
                            Spacer()
                            Text("Race")
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .multilineTextAlignment(.center)
                        }.frame(width: 150)
                        
                        HStack{
                            Text("\(String(describing: character.age))")
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .multilineTextAlignment(.center)
                            Spacer()
                            Text(character.race)
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .multilineTextAlignment(.center)
                        }.frame(width: 150)
                        Spacer()
                    }.padding(10)
                }.frame(width: 400, height: 500).padding(.horizontal, 20)
                
            }
            
            VStack{
                Text(character.quote)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .multilineTextAlignment(.leading)
            }.frame(width: 300, height: 200)
                .padding(.vertical, 20)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//#Preview {
//    CharacterDetailView()
//}
