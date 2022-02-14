//
//  ScrollableTableBar.swift
//  Ministock
//
//  Created by chang-hwan do on 14/02/2022.
//

import SwiftUI

struct ScrollableTableBar<Content: View>: UIViewRepresentable {
    // to stroe our SwiftUI View
    var content: Content
    var rect: CGRect
    @Binding var offset: CGFloat
    
    var tabs: [Any]
    
    let scrollView = UIScrollView()
    
    init(tabs:[Any], rect: CGRect, offset: Binding<CGFloat>, @ViewBuilder content: ()->Content) {
        self.content = content()
        self._offset = offset
        self.rect = rect
        self.tabs = tabs

    }
    func makeUIView(context: Context) -> some UIView {
        setUpScrollView()
        
        scrollView.contentSize = CGSize(width: rect.width*CGFloat(tabs.count), height: rect.height)
        
        scrollView.addSubview(extractView())
        return scrollView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    
    }
    func setUpScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
}
func extractView()->UIView{
    
    let controller = UIHostingController(rootView: content)
    controller.view.frame = CGRect(x:0, y:0, width: rect.width*CGFloat(tabs.count), height: rect.height)
    
    return controller.view!
}


struct ScrollableTableBar_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewController()
    }
}
