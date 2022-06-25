//
//  PhotosPickerModel.swift
//  UI-595
//
//  Created by nyannyan0328 on 2022/06/25.
//

import SwiftUI
import PhotosUI

class PhotosPickerModel: ObservableObject {
   
    @Published var loadImages : [MediaFile] = []
    
    @Published var seletedPhoto : PhotosPickerItem?{
        
        didSet{
            
            if let seletedPhoto{
                
                processPhoto(photo: seletedPhoto)
            }
            
            
            
        }
    }
    
    @Published var selectedPhotos : [PhotosPickerItem] = []{
        didSet{
            
            for photo in selectedPhotos{
                
                processPhoto(photo: photo)
            }
        }
        
        
    }
    
    func processPhoto(photo : PhotosPickerItem){
        
        photo.loadTransferable(type: Data.self) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let data):
                    
                    if let data,let image = UIImage(data: data){
                        
                        self.loadImages.append(.init(image: Image(uiImage: image), data: data))
                    }
                    
                case .failure(let failure):
                    print(failure)
                }
                
            }
        }
        
    }
}
