//
//  RemoteFeedLoaderTests.swift
//  E_FeedTests
//
//  Created by MiciH on 6/6/21.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        //system under test
        _ = RemoteFeedLoader()
        let client = HTTPClient()
//        sut.load()
        
        XCTAssertNil(client.requestURL)
    }
}
