# Euvic Mobile SDK iOS

## Installation

The library is available via Cocapods or Swift Package Manager. You can also add the binary file to a project on your own. 

### Cocoapods

Add dependency to your Podfile\
`pod EuvicMobileSDK`

### Swift Package Manager
Once you have your Swift package set up, adding EuvicMobileSDK as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/Clickonometrics/reporting-sdk-ios.git", .upToNextMajor(from: "0.2.0"))
]
```

## Configuration

Before sending events configuration is required. We recommend to do it just after starting the app, because all events submitted earlier will not be sent.
Simply add the following code to your AppDelegate.swift

```swift
import EuvicMobileSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        EuvicMobile.shared.configure(url: "https://your-event-tracker.com", apiKey: "your-api-key")
        ...
    }
```
| Param      | Type    | Description                                                                                                                                                                                          | Note     |
|------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| `url`      | String  | represents events api                                                                                                                                                                                | Required |
| `apiKey`   | String  | Euvic SDK api key                                                                                                                                                                                    | Required |
| `userId`   | String  | Unique ID representing user. Will be overwritten if system IDFA is available                                                                                                                                | Optional |
| `currency` | String  | Represents default shop currency. If currency is not provided for each product, this value will be used. Should be a three letter value consistent with ISO 4217 norm. Default value is EUR. | Optional |
| `allowSensitiveData` | Bool  | Determines if the library should track sensitive user data such as location or IP address. Default value is true. | Optional |

You can also access the configuration via `EuvicMobile.shared.config` to edit other properties later.

### Ad Identifier Tracking
To use system ad identifier request tracking authorization is needed. Simply add:

```swift
ATTrackingManager.requestTrackingAuthorization { _ in }
```
along with `NSUserTrackingUsageDescription` in your Info.plist file before sending first event.

### Location Tracking
To allow library to track user's location you need to request about location permission in your app before sending an event using:

```swift
CLLocationManager().requestWhenInUseAuthorization()
```
Remember to add also description in Info.plist file under `NSLocationWhenInUseUsageDescription`.

## Sending events

### Homepage Visited Event

This event should be sent when user has visited a home page.

```swift
EuvicMobile.shared.homepageVisitedEvent(custom: ["string": "text", "int": 22, "bool": true])
```

| Param  | Type | Description | Note |
| --- | --- | --- | --- |
| `custom` | [String: Any] | represents custom data as dictionary | Optional |

### Product Browsed Event

This event should be sent when user has browsed a product.

```swift
let product = EuvicMobileProduct(id: "123", price: "12.22", currency: "PLN", quantity: 1)
EuvicMobile.shared.productBrowsedEvent(product: product)
```

| Param  | Type | Description | Note |
| --- | --- | --- | --- |
| `product` | Product | represents browsed product | Required |
| `custom` | [String: Any] | represents custom data as dictionary | Optional |

### Product Added Event

This event should be sent when user adds product to the shopping cart.

```swift
let product = EuvicMobileProduct(id: "111", price: "12.22", currency: "PLN", quantity: 1)
EuvicMobile.shared.productAddedEvent(product: product)
```

| Param  | Type | Description | Note |
| --- | --- | --- | --- |
| `product` | Product | represents product added to cart | Required |
| `custom` | [String: Any] | represents custom data as dictionary | Optional |

### Product Removed Event

This event should be sent when user removes product from the shopping cart.

```swift
let product = EuvicMobileProduct(id: "111", price: "12.22", currency: "PLN", quantity: 1)
EuvicMobile.shared.productRemovedEvent(product: product)
```

| Param  | Type | Description | Note |
| --- | --- | --- | --- |
| `product` | Product | represents product removed from cart | Required |
| `custom` | [String: Any] | represents custom data as dictionary | Optional |

### Browsed Category Event

This event should be sent when user has browsed category.

```swift
let product1 = EuvicMobileProduct(id: "111", price: "12.22", currency: "PLN", quantity: 1)
EuvicMobile.shared.browsedCategoryEvent(name: "Category name", products: [product1])
```

| Param  | Type | Description | Note |
| --- | --- | --- | --- |
| `name` | String | represents category name | Required |
| `products` | [Product] | represents array of products from the category | Required |
| `custom` | [String: Any] | represents custom data as dictionary | Optional |

### Cart Event

This event should be sent when user views products in the cart.

```swift
let product1 = EuvicMobileProduct(id: "13", price: "12.22", currency: "EUR", quantity: 3)
let product2 = EuvicMobileProduct(id: "10", price: "1099.99", currency: "PLN", quantity: 1)
EuvicMobile.shared.cartEvent(products: [product1, product2])
```

| Param  | Type | Description | Note |
| --- | --- | --- | --- |
| `products` | [Product] | represents an array of products from cart | Required |
| `custom` | [String: Any] | represents custom data as dictionary | Optional |

### Order Started Event

This event should be sent when user has started the order process.

```swift
EuvicMobile.shared.orderStartedEvent()
```

| Param  | Type | Description | Note |
| --- | --- | --- | --- |
| `custom` | [String: Any] | represents custom data as dictionary | Optional |

### Products Ordered Event

This event should be sent when user has completed the order process.

```swift
let product1 = EuvicMobileProduct(id: "13", price: "12.22", currency: "EUR", quantity: 3)
let product2 = EuvicMobileProduct(id: "10", price: "1099.99", currency: "PLN", quantity: 1)
EuvicMobile.shared.productsOrderedEvent(orderId: "12/2022", saleValue: "123.3", products: [product1, product2])
```

| Param  | Type | Description | Note |
| --- | --- | --- | --- |
| `orderId` | String | represents the unique id of the order process | Required |
| `saleValue` | String | represents the value of the products user has ordered | Required |
| `products` | [Product] | represents an array of ordered products | Required |
| `currency` | String | represents the currency of the sale value. Should be a three letter value consistent with ISO 4217 norm | Optional |
| `custom` | [String: Any] | represents custom data as dictionary | Optional |


## Types

### EuvicMobileProduct

Represents a product instance

| Param  | Type | Description | Note |
| --- | --- | --- | --- |
| `id` | String | represents products unique identifier | Required |
| `price` | String | represents products value | Required |
| `currency` | String | represents products price currency | Optional |
| `quantity` | String | depending on type of event, it can represents added, removed or in basket quantity of the product | Required |


