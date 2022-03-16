import Foundation

/// The spec
// We have a UIView with maximum and minimum heights.
// When the height of view is at its maximum, the corner radius is at its smallest, and vice versa.
// The corner radius value will be automatically changed if there are any changes from the height of the view.

// y-coordinate
var maxY: Double = 116.0
var minY: Double = 40.0
// max-min radius
var maxR: Double = 8.0
var minR: Double = 20.0

/// The Approach
/*
(116 - 40)/2 + 40 = 78 (find out the center position on the y-coordinate)
Find x
(8 - 20)/x + 20 = 14 ==> x = 2
Now, there are no matter what is the value of the random Y, let's apply it to this expression
(116 - 40)/x + 40 = 90 => x = 1.52
Find x
(8 - 20)/1.52 + 20 = 12.10526315789474
 */

/// Find out the corder radius
///
/// - Parameter randomY: Double
/// - Returns: A double represents the `cornerRadius` of the value.
func getCornerRadius(with randomY: Double) -> Double {
    var tempRandomY = randomY
    if randomY >= maxY {
        tempRandomY = maxY
    }
    if randomY <= minY {
        tempRandomY = minY
    }
    let yFromOrigin = maxY - minY
    let ratio = (tempRandomY - minY != 0) ? yFromOrigin / (tempRandomY - minY) : 0
    let cornerRadius = (ratio != 0 ? (maxR - minR) / ratio : 0) + minR
    return cornerRadius
}

getCornerRadius(with: 90)   // 12.10526315789474
getCornerRadius(with: 40)   // 20
getCornerRadius(with: 116)  // 8
getCornerRadius(with: 78)   // 14
getCornerRadius(with: 120)  // 8
