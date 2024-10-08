//
// Copyright 2019 The Abseil Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <iostream>
#include "absl/base/config.h"
#include "absl/strings/substitute.h"

#if !defined(ABSL_LTS_RELEASE_VERSION)
#error ABSL_LTS_RELEASE_VERSION is not set correctly.
#endif

#if !defined(ABSL_LTS_RELEASE_PATCH_LEVEL)
#error ABSL_LTS_RELEASE_PATCH_LEVEL is not set correctly.
#endif

#if defined(BUILD_MONOLITHIC)
#define main   abseil_cmake_test_project_main
#endif

extern "C"
int main(int argc, const char** argv) {
  for (int i = 0; i < argc; ++i) {
    std::cout << absl::Substitute("Arg $0: $1\n", i, argv[i]);
  }
	return 0;
}
