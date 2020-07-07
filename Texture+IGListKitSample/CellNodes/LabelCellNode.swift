//
//  LabelCellNode.swift
//  Texture+IGListKitSample
//
//  Created by Varun on 7/7/20.
//

import AsyncDisplayKit

class LabelCellNode: ASCellNode {

    private var backgroundNode: ASDisplayNode!
    private var label: ASTextNode!

    init(text: String) {
        super.init()
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true

        backgroundNode = ASDisplayNode()
        backgroundNode.cornerRadius = 5
        backgroundNode.style.flexGrow = 1.0
        backgroundNode.style.flexShrink = 1.0
        backgroundNode.backgroundColor = .lightGray
        
        label = ASTextNode()
        label.maximumNumberOfLines = 0
        label.attributedText = text.attributed(font: UIFont.preferredFont(forTextStyle: .body))
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let bgLayout = ASBackgroundLayoutSpec(child: ASRelativeLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: [.minimumHeight], child: label), background: backgroundNode)
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8), child: bgLayout)
    }

}



