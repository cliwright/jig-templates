// Command {{.PROJECT_NAME}} — {{.DESCRIPTION}}
package main

import (
	"flag"
	"fmt"
)

// version is overridden at release time:
//
//	go build -ldflags "-X main.version=v1.2.3" ./cmd/{{.PROJECT_NAME}}
var version = "dev"

func greet(name string) string {
	return fmt.Sprintf("hello, %s", name)
}

func main() {
	name := flag.String("name", "world", "name to greet")
	showVersion := flag.Bool("version", false, "print the version and exit")
	flag.Parse()

	if *showVersion {
		fmt.Println(version)
		return
	}

	fmt.Println(greet(*name))
}
