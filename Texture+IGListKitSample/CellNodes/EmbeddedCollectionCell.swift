//
//  EmbeddedCollectionCell.swift
//  Texture+IGListKitSample
//
//  Created by Varun on 7/7/20.
//

import AsyncDisplayKit

final class EmbeddedCollectionCell: ASCellNode {
    let collectionNode: ASCollectionNode

    override init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionNode = ASCollectionNode.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
        collectionNode.showsHorizontalScrollIndicator = false

        super.init()
        automaticallyManagesSubnodes = true
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let maxWidth = constrainedSize.max.width >= CGFloat.greatestFiniteMagnitude ?
            UIScreen.main.bounds.width : constrainedSize.max.width
        collectionNode.style.width = ASDimensionMake(maxWidth)
        collectionNode.style.height = ASDimensionMake(UIScreen.main.bounds.size.height * 0.22)
        return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: collectionNode)
    }
}
