//
//  Home.swift
//  UI-595
//
//  Created by nyannyan0328 on 2022/06/25.
//

import SwiftUI
import PhotosUI

struct Home: View {
    @StateObject var model : PhotosPickerModel = .init()
    var body: some View {
        NavigationStack{
            
            VStack{
                
                
                if !model.loadImages.isEmpty{
                    
                    TabView{
                        
                        ForEach(model.loadImages){mediaFile in
                            
                            mediaFile.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding()
                        }
                        
                        
                    }
                    .tabViewStyle(.page)
                    .frame(height:300)
                }
                
                
                
            }
            .navigationTitle("Image Picker")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    PhotosPicker(selection: $model.seletedPhoto,matching: .any(of: [.images]),photoLibrary:.shared()){
                        
                        Image(systemName: "photo.fill")
                            .font(.callout)
                        
                    }
                    
                    
                    
                }
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    PhotosPicker(selection: $model.selectedPhotos,matching: .any(of: [.images]),photoLibrary:.shared()){
                        
                        Image(systemName: "photo.on.rectangle")
                            .font(.callout)
                        
                    }
                    
                    
                    
                }
            }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
