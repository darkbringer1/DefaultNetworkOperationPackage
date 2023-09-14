import XCTest
@testable import DefaultNetworkOperationPackage

final class DefaultNetworkOperationPackageTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DefaultNetworkOperationPackage().text, "Hello, World!")
    }
}

class APIManagerTests: XCTestCase {
    var apiManager: APIManagerInterface!
    
    override func setUp() {
        super.setUp()
        // Do setup here. Create an instance of APIManager
        apiManager = MockAPIManager()
    }
    
    override func tearDown() {
        // Do teardown here. Dispose the APIManager
        apiManager = nil
        super.tearDown()
    }
    
    // We will add tests here
    func testExecuteRequestWithApiServiceProvider() {
        // Define expectation
        let expectation = self.expectation(description: "ExecuteRequestExpectation")
        expectation.expectedFulfillmentCount = 2
        
        let apiManager = apiManager as? MockAPIManager
        // Create a MockData object
        let mockDataObject =
        """
        {
        "id": 1,
        "name": "Test"
        }
        """
        
        // Encode the MockData object into JSON data
        // Set the mock JSON data as the data to return when making a network request
        guard let url = try? "https://mockurl.com".asURL(),
              let mockJSONData = mockDataObject.data(using: .utf8) else { return }
        
        apiManager?.registerMockResponse(for: url, with: mockJSONData)

        // Create an ApiServiceProvider to prepare the URLRequest
        let apiServiceProvider = ApiServiceProvider<MockData>(method: .get, baseUrl: "https://mockurl.com")

        do {
            let urlRequest = try apiServiceProvider.returnUrlRequest()

            // Make API request
            apiManager?.executeRequest(urlRequest: urlRequest) { (result: Result<MockData, ErrorResponse>) in
                // Fulfill the expectation to acknowledge that the async operation has completed
                

                // Switch on the result to check for both success and failure
                switch result {
                case .success(let data):
                    // If request was successful, verify that the returned data matches our expectation
                    XCTAssertEqual(data.id, 1)
                    expectation.fulfill()
                    XCTAssertEqual(data.name, "Test")
                    expectation.fulfill()
                case .failure(let error):
                    // If request failed, fail the test
                    XCTFail("Request failed with error: \(error)")
                }
            }
        } catch let error {
            XCTFail("Failed to create URLRequest with error: \(error)")
        }
        // Wait for expectation to be fulfilled
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testJSONConverter() {
        let jsonString =
        """
        {
        "id": 1,
        "name": "Test"
        }
        """
        
        // Encode the MockData object into JSON data
        let JSONData = jsonString.data(using: .utf8)
        
        do {
            guard let data = JSONData else { return }
            let result = try JSONDecoder().decode(MockData.self, from: data)
            
            XCTAssertEqual(result.name, "Test")
            XCTAssertEqual(result.id, 1)
        } catch {
            XCTFail("Decoding error")
        }
    }
}

struct MockData: Codable {
    let id: Int
    let name: String
}

//TODO: Left to be tried later 
//class MockURLProtocol: URLProtocol {
//
//    static var stubResponse: URLResponse?
//    static var stubData: Data?
//
//    override class func canInit(with request: URLRequest) -> Bool {
//        return true
//    }
//
//    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
//        return request
//    }
//
//    override func startLoading() {
//        if let response = MockURLProtocol.stubResponse {
//            self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
//        }
//        if let data = MockURLProtocol.stubData {
//            self.client?.urlProtocol(self, didLoad: data)
//        }
//        self.client?.urlProtocolDidFinishLoading(self)
//    }
//
//    override func stopLoading() {}
//}
