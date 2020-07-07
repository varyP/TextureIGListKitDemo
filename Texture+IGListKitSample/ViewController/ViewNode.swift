//
//  ViewNode.swift
//  Texture+IGListKitSample
//
//  Created by Varun on 7/7/20.
//

import AsyncDisplayKit

class ViewNode: ASDisplayNode {

    lazy var collectionNode: ASCollectionNode = {
        let collectionNode = ASCollectionNode(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionNode
    }()

    public override init() {
        super.init()
        initNodes()
    }

    func initNodes() {
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true

        collectionNode.style.flexGrow = 1.0
        collectionNode.style.flexShrink = 1.0
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

        let nodeSize = constrainedSize.max
        collectionNode.style.width = ASDimensionMake(nodeSize.width)
        collectionNode.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: safeAreaInsets.bottom, right: 0)

        return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: collectionNode)

    }
}
