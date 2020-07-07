//
//  AuxillarySectionController.swift
//  Texture+IGListKitSample
//
//  Created by Varun on 7/7/20.
//

import IGListKit
import AsyncDisplayKit

class AuxillarySectionController: ListSectionController, ASSectionController {

    var model: Any?
    
    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        return { [weak self] in
            guard let self = self, let text = self.model as? String else { return ASCellNode() }
            return LabelCellNode(text: text)
        }
    }

    func nodeForItem(at index: Int) -> ASCellNode {
        return ASCellNode()
    }

    override func numberOfItems() -> Int {
        return 1
    }

    //ASDK Replacement
    override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
    }

    override func didUpdate(to object: Any) {
        model = object
    }
}

