//
//  ViewController.swift
//  Texture+IGListKitSample
//
//  Created by Varun on 7/7/20.
//

import AsyncDisplayKit
import IGListKit

class ViewController: ASDKViewController<ViewNode> {
    
    fileprivate lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    fileprivate let models: [Any] = ["Each cell has inset of 4,8,4,8", "Resizing embedded horizontal cells is a problem", 2, "Resizing embedded horizontal cells is a problem Resizing embedded horizontal cells is a problem Resizing embedded horizontal cells is a problem Resizing embedded horizontal cells is a problem", 7, 15]
    
    override init() {
        super.init(node: ViewNode())
        adapter.setASDKCollectionNode(node.collectionNode)
        adapter.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return models as! [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case _ as Int:
            return HorizontalSectionController()
        default:
            return AuxillarySectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        nil
    }
    
    
}

