import Foundation
import SwiftUI

struct AnimationLoader: UIViewRepresentable {
    let loaderStyle: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> some UIView {
        let indicator = UIActivityIndicatorView(style: loaderStyle)
        return indicator
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let view = uiView as! UIActivityIndicatorView
        return view.startAnimating()
    }
}
