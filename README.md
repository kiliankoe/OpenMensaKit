# 🍛 OpenMensaKit

Access canteen and meal data from [OpenMensa](https://openmensa.org).

## Quick Start

There's two types here, `Canteen` and `Meal` (and `Meal.Price` for the sake of completeness), with static funcs to fetch some data.

```swift
// Get a single canteen if you know the ID.
Canteen.get(withID: 79) { result in
    guard let canteen = result.success else { return }
    print(canteen)
}

// Get a list of canteens with known IDs.
Canteen.get(withIDs: [79, 80]) { result in
    guard let canteens = result.success else { return }
    print(canteens)
}

// Find a list of canteens near a given coordinate. A search radius can also be specified.
let coordinate = CLLocationCoordinate2D(latitude: 51.0344374, longitude: 13.7279451)
Canteen.find(near: coordinate) { result in
    guard let canteens = result.success else { return }
    print(canteens)
}

// Get a list of meals if you have a canteen on hand.
canteen.getMeals(forDay: Date()) { result in
    guard let meals = result.success else { return }
    print(meals)
}
```

```swift
// Get a list of meals for a canteen on a specific day.
Meal.get(forCanteen: 79, onDay: Date()) { result in
    guard let meals = result.success else { return }
    print(meals)
}
```

That's basically it. Got any questions, problems or ideas? Please don't hesitate to open an issue.

## Installation

OpenMensaKit is available through Cocoapods, Carthage/Punic and Swift Package Manager, whatever floats your boat.

```
// Cocoapods
pod 'OpenMensaKit'

// Carthage
github "kiliankoe/OpenMensaKit"

// Swift Package Manager
.Package(url: "https://github.com/kiliankoe/OpenMensaKit", majorVersion: 0)
```

## Authors

Kilian Koeltzsch, [@kiliankoe](https://github.com/kiliankoe)
