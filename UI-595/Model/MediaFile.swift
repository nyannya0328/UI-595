//
//  MediaFile.swift
//  UI-595
//
//  Created by nyannyan0328 on 2022/06/25.
//

import SwiftUI

struct MediaFile: Identifiable {
    var id = UUID().uuidString
    var image : Image
    var data : Data
}
