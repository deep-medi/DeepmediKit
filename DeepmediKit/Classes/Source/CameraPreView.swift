//
//  CameraPreView.swift
//  DeepmediKit
//
//  Created by 딥메디 on 2023/06/19.
//

import Foundation
import AVKit

public class CameraPreview: UIView {
    private let model = Model.shared
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func setup(
        layer: AVCaptureVideoPreviewLayer,
        frame: CGRect,
        useCornerRadius: Bool? = nil
    ) {
        self.model.previewLayer = layer
        self.model.previewLayerBounds = self.frame
        self.layer.addSublayer(layer)
        layer.videoGravity = .resizeAspectFill
        layer.frame = CGRect(x: 0, y: 0,
                             width: frame.width,
                             height: frame.height)
        
        guard useCornerRadius ?? false && model.measurePart == .finger else { return }
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
