[![Go Reference](https://pkg.go.dev/badge/github.com/willie68/WeightedRoundRobinSimple.svg)](https://pkg.go.dev/github.com/willie68/WeightedRoundRobinSimple)

# WeightedRoundRobinSimple
A simple implementation of a weighted round robin (WRR) algorithm.

This is a simple implementation of a weighted round-robin algorithm.
The selection list is implemented with generics, allowing almost any type of item to be selected. The algorithm then selects which item to select next based on the weight. A deterministic procedure is used. This means that the order in a cycle is always the same and is not determined randomly.
Procedure:
Each item has a weight and a weight buffer.
In each round, the buffer for each item is increased by its own weight. The item with the highest buffer level is selected. This level is then decreased by the sum of all weights.
Example:
Item 1: Weight 9
Item 2: Weight 6
Item 3: Weight 2
Item Output: 1,2,1,3,2,1,1,2,1,2,1,3,1,2,1,2,1

| Step | weight buffer | item choosed | weight buffer |
| ---- | ------------- | ------------ | ------------- |
| 1    | 9,6,2         | 1            | -8,6,2        |
| 2    | 1,12,4        | 2            | 1,-5, 4       |
| 3    | 10, 1,6       | 1            | -7, 1,6       |
| 4    | 2, 7,8        | 3            | 2,7,-9        |
| 5    | 11,13,-7      | 2            | 11,-4,-7      |

...

## Install 

simply do

`go get github.com/willie68/WeightedRoundRobinSimple`

## Usage

```go
import (
	"fmt"
    wrrsimple "github.com/willie68/WeightedRoundRobinSimple"
)

func main() {
    wrr := wrrsimple.New[string]()

    wrr.Add("1", 10)
	wrr.Add("2", 5)
	wrr.Add("3", 2)

    id, _ := wrr.GetNext()
    fmt.Printf("id is %s", *id)
}
```
