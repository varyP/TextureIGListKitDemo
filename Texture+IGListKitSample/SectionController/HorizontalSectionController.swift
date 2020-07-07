//
//  HorizontalSectionController.swift
//  Texture+IGListKitSample
//
//  Created by Varun on 7/7/20.
//

import Foundation
import AsyncDisplayKit

class HorizontalSectionController: ListSectionController {

    private var number: Int?
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()

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

extension HorizontalSectionController: ASSectionController {
    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        
        return { [weak self] in
            
            guard let self = self else { return ASCellNode() }
            let theNode = EmbeddedCollectionCell()
            DispatchQueue.main.async {[weak self] in
                self?.adapter.setASDKCollectionNode(theNode.collectionNode)
            }
            return theNode
        }
    }
    
    func nodeForItem(at index: Int) -> ASCellNode {
        return ASCellNode()
    }
}

extension HorizontalSectionController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let number = number else { return [] }
        return (0..<number).map { $0 as ListDiffable }
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return EmbeddedSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
