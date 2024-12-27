
#pragma once

#include "benchmark/benchmark.h"

#if defined(BUILD_MONOLITHIC) && defined(BUILDING_LIBABSEIL_CPP)
#define BENCHMARK_FAMILY_ID    "abseil"
#endif
