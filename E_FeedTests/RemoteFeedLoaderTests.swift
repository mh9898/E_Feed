//
//  RemoteFeedLoaderTests.swift
//  E_FeedTests
//
//  Created by MiciH on 6/6/21.
//

import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    let url: URL
    
    init(url: URL, client: HTTPClient){
        self.client = client
        self.url = url
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {

    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    
    var requestURL: URL?
    
    func get(from url: URL) {
        requestURL = url
    }
    
}


class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        
        let url = URL(string: "https://a-url.com")!

        let client = HTTPClientSpy()
//        HTTPClient.shared = client
        _ = RemoteFeedLoader(url: url, client: client)

        
        XCTAssertNil(client.requestURL)
    }
        
    func test_load_requestDataFromURL(){
        
        let url = URL(string: "https://a-given-url.com")!

        
        let client = HTTPClientSpy()
        //sut = system under test
        let remoteFeedLoader = RemoteFeedLoader(url: url, client: client)
        
        remoteFeedLoader.load()
        
//        XCTAssertNotNil(client.requestURL)
        XCTAssertEqual(client.requestURL, url)
    
    }
    
}
