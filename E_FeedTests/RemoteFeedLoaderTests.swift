//
//  RemoteFeedLoaderTests.swift
//  E_FeedTests
//
//  Created by MiciH on 6/6/21.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    
    static let shared = HTTPClient()
    
    private init() {}
    
    var requestURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        
        _ = RemoteFeedLoader()
        let client = HTTPClient.shared
//        sut.load()
        
        XCTAssertNil(client.requestURL)
    }
    
    
    func test_load_requestDataFromURL(){
        let client = HTTPClient.shared
        //system under test
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestURL)
        
        //option of dependency injection
        //1.passing it in the constructor
//        let sut1 = RemoteFeedLoader(client: client)
        
        
        //2.option of dependency injection
        //set in to property
//        sut.client = client
        
        //2.option of dependency injection
        //parma to the load function
//        sut.client = client
    }
    
}
