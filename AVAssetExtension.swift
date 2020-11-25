extension AVAsset {

    /**
     Check whether video HDR or not.
     HDR videos are supported since iPhone 12.
    */
    var isVideoHDR: Bool {
        
        for track in tracks {
            if let desc = track.formatDescriptions.first.flatMap({ ($0 as! CMVideoFormatDescription) }) {
                
                if #available(iOS 13.0, *) {
                    _ = desc.extensions.first { (key, value) -> Bool in
                        if key == kCVImageBufferTransferFunctionKey, value as? String == "ITU_R_2100_HLG" {
                            return true
                        }
                        return false
                    }
                }
            }
        }
        return false
    }
}
