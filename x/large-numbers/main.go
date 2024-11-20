package main

import (
	"math"
	"math/big"

	. "github.com/stevegt/goadapt"
)

func main() {
	// 1 terabyte = 8 * 10^12 bits
	bits := int64(8 * math.Pow(10, 12))
	// possible states = 2^bits
	bitsBig := big.NewInt(bits)
	// Pl(bitsBig)
	statesBig := new(big.Int).Exp(big.NewInt(2), bitsBig, nil)
	// Pl(statesBig)

	// assume 1 ms per state
	seconds := new(big.Int).Div(statesBig, big.NewInt(1000))

	// convert to years
	years := new(big.Int).Div(seconds, big.NewInt(60*60*24*365))
	// Pl(years)

	trillion := big.NewInt(1000000000000)
	billion := big.NewInt(1000000000)
	million := big.NewInt(1000000)

	if years.Cmp(trillion) == 1 {
		Pl("More than a trillion years")
	} else if years.Cmp(billion) == 1 {
		Pl("More than a billion years")
	} else if years.Cmp(million) == 1 {
		Pl("More than a million years")
	} else {
		Pl("Less than a million years")
	}

}
