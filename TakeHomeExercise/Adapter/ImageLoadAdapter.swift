//
//  ImageLoadAdapter.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 23/06/2022.
//

import Kingfisher
import UIKit

struct ImageLoadAdapter {
    
    func loadImage(url: URL, imageView: UIImageView) {
        imageView.kf.indicatorType = .activity
        
        if url.isFileURL {
            let dataProvider = LocalFileImageDataProvider(fileURL: url)
            imageView.kf.setImage(with: dataProvider)
        }else {
            imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        }
    }
    
    func prefetchImages(urls: [URL]){
        ImagePrefetcher(urls: urls).start()
    }
}


