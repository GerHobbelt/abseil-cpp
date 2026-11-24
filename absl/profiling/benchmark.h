
#pragma once

#define ABSL_DEFINE_HASH_FOR_STD_CONTAINER
#define ABSL_DEFINE_HASH_FOR_STD_WRAPPER

#include "absl/base/config.h"
#include "benchmark/benchmark.h"

#if defined(BUILD_MONOLITHIC) && defined(BUILDING_LIBABSEIL_CPP)
#define BENCHMARK_FAMILY_ID    "abseil"
#endif
