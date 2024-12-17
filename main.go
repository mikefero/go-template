// Copyright © 2024 Michael Fero
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
package main

import (
	"fmt"

	"go.uber.org/zap"
)

var (
	Version   string
	Commit    string
	OsArch    string
	GoVersion string
	BuildDate string
)

func main() {
	logger, err := zap.NewProduction()
	if err != nil {
		panic(fmt.Sprintf("unable to create logger: %v", err))
	}
	logger.Info("starting app-name",
		zap.String("version", Version),
		zap.String("commit", Commit),
		zap.String("os-arch", OsArch),
		zap.String("go-version", GoVersion),
		zap.String("build-date", BuildDate),
	)
}
