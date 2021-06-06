//
//  RemoteFeedLoaderTests.swift
//  E_FeedTests
//
//  Created by MiciH on 6/6/21.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        //removing the singleton
        //2. move the test logic form RemoteFeedLoader -> HTTPClient
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    //removing the singleton
    //1. make the shard instance a var -> global state
    static var shared = HTTPClient()

    func get(from url: URL){}
}

class HTTPClientSpy: HTTPClient {
    override func get(from url: URL) {
        requestURL = url
    }
    var requestURL: URL?
}


class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()

        
        XCTAssertNil(client.requestURL)
    }
    
    
    func test_load_requestDataFromURL(){
        
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        //system under test
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestURL)
    
    }
    
}
