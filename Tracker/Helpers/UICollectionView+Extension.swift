import UIKit

extension UICollectionView {
    struct GeometricParams {
        let cellCount: CGFloat
        let leeftInset: CGFloat
        let rightInset: CGFloat
        let cellSpacing: CGFloat
        let paddingWidth: CGFloat
        
        init(cellCount: CGFloat, leeftInset: CGFloat, rightInset: CGFloat, cellSpacing: CGFloat, paddingWidth: CGFloat) {
            self.cellCount = cellCount
            self.leeftInset = leeftInset
            self.rightInset = rightInset
            self.cellSpacing = cellSpacing
            self.paddingWidth = leeftInset + rightInset + CGFloat(cellCount - 1) * cellCount
        }
    }
}
