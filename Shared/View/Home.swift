//
//  Home.swift
//  Home
//
//  Created by nyannyan0328 on 2021/09/09.
//

import SwiftUI

struct Home: View {
    @State var currentTab = "Home"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection:$currentTab){
            GeometryReader{proxy in
                let topEdge = proxy.safeAreaInsets.top
                
                MainHome(topEdge: topEdge)
                    .padding(.top,topEdge)//topedgeぶんとるので上が空
                    .ignoresSafeArea(.container, edges: .top)
            }
                .tag("Home")
            
            Text("Search")
                .tag("Search")
            
            Text("Following")
                .tag("Following")
            
            Text("Downloads")
                .tag("Downloads")
            
            
        }
        .overlay(
        
            HStack(spacing:0){
                
                TabButton(title: "Home", image: "house.fill")
            
                TabButton(title: "Search", image: "magnifyingglass")
            
            
            TabButton(title: "Following", image: "bookmark")
            
            TabButton(title: "Downloads", image: "square.and.arrow.up.fill")
            
            }
                .frame(height: 80)//逆だとbackに80が適用される
                .background(.ultraThinMaterial)
             
        ,alignment: .bottom
        
        )
      
    }
    @ViewBuilder
    func TabButton(title : String,image : String) -> some View{
        Button {
            
            currentTab = title
            
        } label: {
            
            
            VStack(spacing:7){
                
                Image(systemName: image)
                    .font(.title2)
                
                Text(title)
                    .font(.caption.bold())
                
                
            }
            .foregroundColor(currentTab == title ? .primary : .gray)
            .frame(maxWidth: .infinity)
            
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

