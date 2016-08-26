//
//  UIImage+ScaledImage.swift
//  VerseInk
//
//  Created by Luciano Almeida on 11/5/15.
//  Copyright © 2015 Luciano Almeida. All rights reserved.
//

import UIKit

extension UIImage {
    func scaledImage(scale: Int, result: (image: UIImage) -> Void){
        var img : UIImage!
        if scale > 0 {
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let scalePercent = CGFloat(scale) / 100
                let newRect = CGRectMake(0,0,scalePercent * self.size.width, scalePercent * self.size.height)
                UIGraphicsBeginImageContextWithOptions(newRect.size, false, 0)
                let path = UIBezierPath(rect: newRect)
                path.addClip()
                self.drawInRect(newRect)
                img = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                result(image: img)
            })
            
        }
    }
}