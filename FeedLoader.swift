//
//  FeedLoader.swift
//  E_Feed
//
//  Created by MiciH on 6/6/21.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion:@escaping(LoadFeedResult) -> Void)
}
