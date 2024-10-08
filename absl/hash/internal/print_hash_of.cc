// Copyright 2018 The Abseil Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <cstdlib>

#include "absl/hash/hash.h"

#if defined(BUILD_MONOLITHIC)
#define main  abseil_print_hash_of_util_main
#endif

// Prints the hash of argv[1].
extern "C"
int main(int argc, const char** argv) {
  if (argc < 2) return 1;
  printf("%zu\n", absl::Hash<int>{}(std::atoi(argv[1])));  // NOLINT
	return 0;
}
