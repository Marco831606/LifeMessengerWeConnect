//
//  SplashScreenView.swift
//  LifeMessengerWeConnect
//
//  Created by Marco Molisano on 20.02.23.
//

import SwiftUI
import AVKit

struct SplashScreenView: View {
    
    @State private var isPlaying = false
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        VStack{
            
            VStack{
                
                Image("Messenger")
                    .resizable()
                    .frame(width: 500, height: 600 )
                    .font(Font.custom("Bold", size: 25))
                    .foregroundColor(.black.opacity(0.70))
                
            }
            
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeInOut(duration: 2.0)) {
                    self.size = 0.9
                    self.opacity = 1.0
                    
                }
                
                
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                
                if isPlaying {
                    VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "splashscreen_audio", withExtension: "mp3")!))
                    
                        .onAppear {
                            self.isPlaying = true
                            
                        }
                        .onDisappear {
                            self.isPlaying = false
                        }
                }
            }
        }
    }
    
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
