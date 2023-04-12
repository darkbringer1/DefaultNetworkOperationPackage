# DefaultNetworkOperationPackage

## Introduction

DefaultNetworkOperationPackage is a Swift package that provides a simple interface for handling network operations in your iOS or macOS app. It offers a lightweight alternative to relying on larger networking libraries and provides a more basic set of features for smaller projects.

## Features

- Simple network operations: easily perform GET, POST, PUT, and DELETE requests
- Codable support: easily serialize and deserialize data with Codable
- Custom request configurations: configure each request with custom HTTP headers, query parameters, and body content
- Completion handlers for response handling: receive data and error responses through closures
- Error handling: handle common error scenarios such as no internet connection, invalid URLs, and server errors

## Installation

DefaultNetworkOperationPackage can be installed via Swift Package Manager. Simply add it as a dependency to your Xcode project and you can start using it right away.

<!-- ## Usage

To use DefaultNetworkOperationPackage, simply import it and create a `NetworkOperation` object with your desired URL and request configuration. Then, call the appropriate method for your desired request type.

Here is an example:

```swift
import DefaultNetworkOperationPackage

let url = URL(string: "https://example.com")!
let networkOperation = NetworkOperation(url: url)
let parameters = ["name": "John", "age": "35"]
let headers = ["Authorization": "Bearer myToken"]
let bodyData = try? JSONEncoder().encode(parameters)

networkOperation.post(
    headers: headers,
    body: bodyData,
    completion: { data, response, error in
        if let error = error {
            // Handle error
        } else if let data = data {
            // Parse data
        }
    }
)
``` -->

## Conclusion

DefaultNetworkOperationPackage is a lightweight and simple alternative for handling network operations in your iOS or macOS app. If you need a basic set of features without the overhead of larger networking libraries, this package may be a good fit for your project.
