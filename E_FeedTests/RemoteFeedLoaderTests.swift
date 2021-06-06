//
//  RemoteFeedLoaderTests.swift
//  E_FeedTests
//
//  Created by MiciH on 6/6/21.
//

import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    
    init(client: HTTPClient){
        self.client = client
    }
    
    func load() {

        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient {

    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requestURL = url
    }
    var requestURL: URL?
}


class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        
        let client = HTTPClientSpy()
//        HTTPClient.shared = client
        _ = RemoteFeedLoader(client: client)

        
        XCTAssertNil(client.requestURL)
    }
    
    
    func test_load_requestDataFromURL(){
        
        let client = HTTPClientSpy()
        //system under test
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestURL)
    
    }
    
}
