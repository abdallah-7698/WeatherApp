//
//  GestureHandler.swift
//  ButtonSpredShet
//
//  Created by Ahmed Fathy on 16/10/2022.
//

import UIKit

extension UIView{
    
    func handleGestureWithAnimation(_ gesture: UIPanGestureRecognizer
                                    ,defaultHeight: CGFloat
                                    ,containerViewHeightConstraint: inout NSLayoutConstraint?
                                    ,currentContainerHeight: inout CGFloat
                                    ,maximumContainerHeight: inout CGFloat){
        let translation = gesture.translation(in: self)
        
        let isDraggingDown = translation.y > 0
        
        let newHeight = currentContainerHeight - translation.y
        
        switch gesture.state {
        
        case .changed:
            if newHeight < maximumContainerHeight {
                containerViewHeightConstraint?.constant = newHeight
                self.layoutIfNeeded()
            }
        case .ended:
            if newHeight < defaultHeight {
                animateContainerHeight(defaultHeight, currentContainerHeight: &currentContainerHeight, containerViewHeightConstraint: containerViewHeightConstraint )
            }
            else if newHeight < maximumContainerHeight && isDraggingDown {
                animateContainerHeight(defaultHeight, currentContainerHeight: &currentContainerHeight, containerViewHeightConstraint: containerViewHeightConstraint )
            }
            else if newHeight > defaultHeight && !isDraggingDown {
                animateContainerHeight(maximumContainerHeight, currentContainerHeight: &currentContainerHeight, containerViewHeightConstraint: containerViewHeightConstraint )
            }
        default:
            break
        }
        
        func animateContainerHeight(_ height: CGFloat
                                    , currentContainerHeight: inout CGFloat
                                    , containerViewHeightConstraint: NSLayoutConstraint? = containerViewHeightConstraint) {
            UIView.animate(withDuration: 0.4) {
                containerViewHeightConstraint?.constant = height
                self.layoutIfNeeded()
            }
            currentContainerHeight = height
        }
    }
    
}
