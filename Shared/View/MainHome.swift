//
//  MainHome.swift
//  MainHome
//
//  Created by nyannyan0328 on 2021/09/09.
//

import SwiftUI

struct MainHome: View {
    var topEdge : CGFloat
    
    var body: some View {
        VStack(spacing:15){
            
            
            HStack{
                
                
                Text("Todays For You")
                    .font(.largeTitle.bold())
                    .foregroundColor(.red)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "person.circle")
                        .font(.title)
                        .foregroundColor(.black)
                        .overlay(
                        Circle()
                            .fill(.red)
                            .frame(width: 18, height: 18)
                            .offset(x: 7, y: -8)
                        
                        
                        ,alignment: .topTrailing
                        
                        )
                }
                
                
                
            }
            .padding(.horizontal)
            
            
            GeometryReader{proxy in
                
                
                let size = proxy.size
                
                VerticalCarouselView {
                    
                    
                    
                    VStack(spacing:0){
                        
                        
                        ForEach(animals){animal in
                            
                            
                            AnimalCardView(animal: animal, topOffset: 70 + 15 + topEdge)
                                .frame(width: size.width, height: size.height)
                                
                            
                            
                            
                            
                        }
                    }
                    
                    
                }
                
                
            }
            
            
        }
    }
}

struct MainHome_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimalCardView : View{
    
    var animal : Animal
    var topOffset : CGFloat
    
    var body: some View{
        
        
        GeometryReader{proxy in
            
            let size = proxy.size
            let minY = proxy.frame(in: .global).minY - topOffset
            let progress = -minY / size.height
            let scale = 1 - (progress / 3)
            let opa = 1 - progress
            
            ZStack{
                
                
                Image(animal.artWork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 30, height: size.height - 80)
                    .cornerRadius(15)
                
                
                
                Text(animal.title)
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                
            }
            .padding(.horizontal)
            .scaleEffect(minY < 0 ? scale : 1)
            .offset(y: minY < 0 ? -minY : 0)
            .opacity(minY < 0 ? opa : 1)
        
        }
        
        
        
    }
}
