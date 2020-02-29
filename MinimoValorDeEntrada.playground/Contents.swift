// Mínimo Valor de Entrada
// Daniel Esteban Salinas SUárez
// Para resolver este problema hago uso de 2 funciones de arreglos de Swift: reduce() y min().
// Cada una tiene una complejidad de tiempo de O(n) por lo que el tiempo de ejecución siempre será constante, con relación a la longitud del arreglo.

import UIKit

// Minimum value of entrance function
// Complexity O(n)
func minimumStaringValue(input: [Int], limit: Int) -> Int {
    
    var values: [Int] = []
    var tempMinValue = 0 {
        didSet {
            values.append(tempMinValue)
        }
    }
    var prev = input.first ?? 0
    
    input.reduce(0, {
        if ($1 > 0) && (prev < 0) {
            tempMinValue += $0
            prev = $1
            return $1
        } else if ($1 == input.last) && ($1 < 0) {
            tempMinValue += $0 + $1
            return $1
        } else {
            prev = $1
            return $0 + $1
        }
    })
    
    if let minValue = values.min(), minValue < 1 {
        return abs(minValue) + limit
    } else {
        return 1
    }
    
}

// Examples

let limit: Int = 1
let input: [Int] = [1, -10, 10, 7, 0, 9, -7, 2, -5, -6, 10, 3, 7]
let input2: [Int] = [2, 7, 3, -10, -5, 10, -9, -8, -9, 5, -10, 10, -9, -1, -2]
let input3: [Int] = [8, 6, 10, 1, -7, -5, 4, -3, 8, 10, -5, -7, 9, -3]
let input4: [Int] = [3, 9, -9, -10, -8, 1, 1, 3, -9, -6, 6, 10, -3, 3, -5, -9, -2, 7]
let input5: [Int] = [-3, 3, 8, 5, -7, -4, 0, -9, -5, 6, -6, 6, -7, -2, 4]

minimumStaringValue(input: input, limit: limit)
minimumStaringValue(input: input2, limit: limit)
minimumStaringValue(input: input3, limit: limit)
minimumStaringValue(input: input4, limit: limit)
minimumStaringValue(input: input5, limit: limit)
