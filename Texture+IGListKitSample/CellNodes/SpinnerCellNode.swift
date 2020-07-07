//
//  SpinnerCellNode.swift
//  Texture+IGListKitSample
//
//  Created by Varun on 7/7/20.
//

import AsyncDisplayKit

class SpinnerCellNode: ASCellNode {

    ///Keep a reference to the UIActivityIndicatorView
    private var spinnerView: UIActivityIndicatorView? {
        return spinnerNode.view as? UIActivityIndicatorView
    }

    private lazy var spinnerNode: ASDisplayNode = {
        ///The node is initialized with a view block that initializes the segment
        return ASDisplayNode(viewBlock: {[weak self]() -> UIView in
            guard let self = self else { return UIView() }
            let indicator = UIActivityIndicatorView(style: .medium)
            indicator.startAnimating()
            return indicator
        })
    }()

    private var didLoadUIStuff = false
    private var backgroundNode: ASDisplayNode!

    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true

        backgroundNode = ASDisplayNode()
        backgroundNode.style.flexGrow = 1.0
        backgroundNode.style.flexShrink = 1.0
    }

    override func didLoad() {
        super.didLoad()
        //Initialize segmentedNode here
        _ = spinnerNode
        didLoadUIStuff = true
        setNeedsLayout()
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

        backgroundNode.style.width = ASDimensionMake(constrainedSize.max.width)
        backgroundNode.style.height = ASDimensionMake(UIScreen.main.bounds.height * 0.1)

        if didLoadUIStuff {
            spinnerNode.style.preferredSize = CGSize(width: 40, height: 40)
            let relSpec = ASRelativeLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: [], child: spinnerNode)
            let overlay = ASOverlayLayoutSpec(child: backgroundNode, overlay: relSpec)
            return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: overlay)
        }

        return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: backgroundNode)
    }

}
