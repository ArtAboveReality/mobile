//
//  ContentView.swift
//  ArtAboveReality Interface App
//
//  Created by Badir Mccleary on 6/17/22.
//

import SwiftUI

let placeholderText = "Hauser & Wirth Los Angeles has three main entrances. The primary entrance is located on East 3rd Street. North and South entrances via the Breezeway are located on East 2nd and East 3rd Streets."

struct mapView: View {
    var body: some View {
        HStack  {
            Spacer()
            Image("map")
                .resizable(capInsets: EdgeInsets(top: -50.0, leading: 0.0, bottom: -50.0, trailing: 0.0))
                .aspectRatio(contentMode: .fit)
                .padding(.all)
            // Spacer()
        }
    }
}

struct twoImageView: View {
    var body: some View {
        HStack {
            Spacer()
            Image("bap2")
                .resizable()
                .padding(.leading)
                .scaledToFit()
            Image("bap2")
                .resizable()
                .padding(.trailing)
                .scaledToFit()
            // Spacer()
        }
        
    }
    
    
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            
            ZStack {
                // Image("Screen_2")
                // .resizable()
                //.ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        
                        Image("")
                        Image("Logo3")
                        Image("")
                        Menu("Top Menu") {
                            Text("New")
                            Text("New 2")
                            Text("New 3")
                        }
                        .padding(.leading)
                        
                        
                        
                    }
                    .padding(.all)
                    
                    HStack { Text("Title Text")
                            .font(.headline)
                            .fontWeight(.bold)
                        .foregroundColor(Color.gray)}
                    
                    
                    
                    HStack  {
                        
                        Spacer()
                        Text(placeholderText)
                            .font(.caption)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .padding(.all)
                            .frame(width: nil)
                        Spacer()
                    }
                    
                    twoImageView()
                    mapView()
                    
                    HStack  {
                        Spacer()
                        Text(placeholderText)
                            .font(.caption)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .padding(.all)
                            .frame(width: nil)
                        //Spacer()
                    }
                    
                    HStack {
                        
                        Text("Caption Text")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)}
                    
                    HStack  {
                        Spacer()
                        
                        Spacer()
                    }
                    
                    
                    
                }
                
            }
        }.onAppear {
            Task {
                do {
                    try await getData()
                } catch {
                    print(" ❌ \(error.localizedDescription)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
            .previewInterfaceOrientation(.portrait)
            .previewLayout(.device)
            .preferredColorScheme(.light)
    }
}
