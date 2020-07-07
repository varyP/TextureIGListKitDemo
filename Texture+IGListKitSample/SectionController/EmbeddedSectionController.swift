//
//  EmbeddedSectionController.swift
//  Texture+IGListKitSample
//
//  Created by Varun on 7/7/20.
//

import AsyncDisplayKit

import IGListKit
import AsyncDisplayKit

class EmbeddedSectionController: ListSectionController, ASSectionController {

    private var number: Int?

    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        return { [weak self] in
            guard let self = self,
                  let number = self.number
                  else { return ASCellNode() }
            return LabelCellNode(text: "\(number)")
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
        number = object as? Int
    }
}
