package main

import "fmt"

var indicatifMapping map[string]string

func init() {
	indicatifMapping = map[string]string{
		"01": "Région parisienne",
		"02": "Région nord-ouest et « Océan Indien » (La Réunion et Mayotte)",
		"03": "Région nord-est",
		"04": "Région sud-est dont Corse",
		"05": "Région sud-ouest et « Océan Atlantique » (Les autres départements, collectivités et territoires d'outre-mer)",
	}
}

func main() {
	for _, indicatif := range []string{"01", "02", "03", "04", "05"} {
		fmt.Printf("# %s\n\n", indicatif)
		fmt.Printf("## %s\n\n", indicatifMapping[indicatif])

		for b := 0; b < 100; b++ {
			for c := 0; c < 100; c++ {
				for d := 0; d < 100; d++ {
					for e := 0; e < 100; e++ {
						fmt.Printf("* %s:%02d:%02d:%02d:%02d ............\n", indicatif, b, c, d, e)
					}
				}
			}
		}

		fmt.Printf("---\n\n")
	}
}
