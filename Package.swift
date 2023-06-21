// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "abseil-cpp",
	platforms: [
		.iOS(.v12),
		.macOS(.v10_13),
		.macCatalyst(.v13),
		.watchOS(.v5),
		.tvOS(.v11)
	],
	products: [
		.library(name: "absl_algorithm", targets: ["absl_algorithm"]),
		.library(name: "absl_base", targets: ["absl_base"]),
		.library(name: "absl_cleanup", targets: ["absl_cleanup"]),
		.library(name: "absl_container", targets: ["absl_container"]),
		.library(name: "absl_crc", targets: ["absl_crc"]),
		.library(name: "absl_debugging", targets: ["absl_debugging"]),
		.library(name: "absl_flags", targets: ["absl_flags"]),
		.library(name: "absl_functional", targets: ["absl_functional"]),
		.library(name: "absl_hash", targets: ["absl_hash"]),
		.library(name: "absl_log", targets: ["absl_log"]),
		.library(name: "absl_memory", targets: ["absl_memory"]),
		.library(name: "absl_meta", targets: ["absl_meta"]),
		.library(name: "absl_numeric", targets: ["absl_numeric"]),
		.library(name: "absl_profiling", targets: ["absl_profiling"]),
		.library(name: "absl_string_view", targets: ["absl_string_view"]),
		.library(name: "absl_strings", targets: ["absl_strings"]),
		.library(name: "absl_status", targets: ["absl_status"]),
		.library(name: "absl_synchronization", targets: ["absl_synchronization"]),
		.library(name: "absl_time", targets: ["absl_time"]),
		.library(name: "absl_types", targets: ["absl_types"]),
		.library(name: "absl_utility", targets: ["absl_utility"]),
	],
	targets: [
		.target(
			name: "absl_algorithm",
			dependencies: [
				"absl_base",
			],
			path: "absl/algorithm",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_base",
			dependencies: [
			],
			path: "absl/base",
			sources: [
				"internal/cycleclock.cc",
				"internal/low_level_alloc.cc",
				"internal/raw_logging.cc",
				"internal/scoped_set_env.cc",
				"internal/spinlock.cc",
				"internal/spinlock_wait.cc",
				"internal/strerror.cc",
				"internal/sysinfo.cc",
				"internal/thread_identity.cc",
				"internal/throw_delegate.cc",
				"internal/unscaledcycleclock.cc",
				"log_severity.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_cleanup",
			dependencies: [
				"absl_base",
				"absl_utility",
			],
			path: "absl/cleanup",
			sources: [],
			publicHeadersPath: "include"
		),		
		.target(
			name: "container_compressed_tuple",
			dependencies: [
				"absl_utility",
			],
			path: "absl/container",
			sources: [],
			publicHeadersPath: "compressed_tuple/include"
		),
		.target(
			name: "absl_container_fixed_array",
			dependencies: [
				"absl_algorithm",
				"absl_base",
				"container_compressed_tuple",
				"absl_memory",
			],
			path: "absl/container",
			sources: [],
			publicHeadersPath: "fixed_array/include"
		),
		.target(
			name: "absl_container_inlined_vector",
			dependencies: [
				"absl_algorithm",
				"absl_base",
				"absl_memory",
			],
			path: "absl/container",
			sources: [],
			publicHeadersPath: "inlined_vector/include"
		),
		.target(
			name: "absl_container",
			dependencies: [
				"absl_algorithm",
				"absl_base",
				"absl_debugging",
				"absl_hash",
				"absl_memory",
				"absl_meta",
				"absl_numeric",
				"absl_profiling",
				"absl_strings",
				"absl_synchronization",
				"absl_time",
				"absl_types",
				"absl_utility",
			],
			path: "absl/container",
			sources: [
				"internal/raw_hash_set.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_crc",
			dependencies: [
				"absl_base",
				"absl_memory",
				"absl_numeric",
				"strings_str_format",
			],
			path: "absl/crc",
			sources: [
				"crc32c.cc",
				"internal/cpu_detect.cc",
				"internal/crc.cc",
				"internal/crc_cord_state.cc",
				"internal/crc_memcpy_fallback.cc",
				"internal/crc_memcpy_x86_arm_combined.cc",
				"internal/crc_non_temporal_memcpy.cc",
				"internal/crc_x86_arm_combined.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_debugging",
			dependencies: [
				"absl_base",
				"absl_meta",
				"absl_numeric",
				"absl_string_view",
			],
			path: "absl/debugging",
			sources: [
				"failure_signal_handler.cc",
				"leak_check.cc",
				"stacktrace.cc",
				"symbolize.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_flags",
			dependencies: [
				"absl_base",
				"absl_meta",
				"absl_utility",
			],
			path: "absl/flags",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_functional",
			dependencies: [
				"absl_base",
				"absl_meta",
				"absl_utility",
			],
			path: "absl/functional",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_hash",
			dependencies: [
				"absl_base",
				"absl_container_fixed_array",
				"absl_functional",
				"absl_meta",
				"absl_numeric",
				"absl_strings",
				"absl_types",
				"absl_utility",
			],
			path: "absl/hash",
			sources: [
				"internal/hash.cc",
			],
			publicHeadersPath: "include"
		),		
		.target(
			name: "absl_log",
			dependencies: [
				"absl_base",
				"absl_cleanup",
				"absl_container_inlined_vector",
				"absl_flags",
				"absl_hash",
				"absl_memory",
				"absl_strings",
				"absl_synchronization",
				"absl_time",
				"absl_types",
			],
			path: "absl/log",
			sources: [
				"die_if_null.cc",
				"flags.cc",
				"globals.cc",
				"initialize.cc",
				"log_entry.cc",
				"log_sink.cc",
				"internal/check_op.cc",
				"internal/conditions.cc",
				"internal/log_format.cc",
				"internal/globals.cc",
				"internal/log_message.cc",
				"internal/log_sink_set.cc",
				"internal/nullguard.cc",
				"internal/proto.cc",
				"internal/fnmatch.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_memory",
			dependencies: [
				"absl_base",
			],
			path: "absl/memory",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_meta",
			dependencies: [
				"absl_base",
			],
			path: "absl/meta",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_numeric",
			dependencies: [
				"absl_base",
			],
			path: "absl/numeric",
			sources: [
				"int128.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_profiling",
			dependencies: [
				"absl_base",
			],
			path: "absl/profiling",
			sources: [
				"internal/exponential_biased.cc",
				"internal/periodic_sampler.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_string_view",
			dependencies: [
				"absl_base",
			],
			path: "absl/strings",
			sources: [
				"string_view.cc"
			],
			publicHeadersPath: "include"
		),		
		.target(
			name: "strings_internal",
			dependencies: [
				"absl_base",
				"absl_meta",
			],
			path: "absl/strings",
			sources: [
				"internal/escaping.cc",
				"internal/ostringstream.cc",
				"internal/utf8.cc",
			],
			publicHeadersPath: "include"
		),		
		.target(
			name: "strings_str_format",
			dependencies: [
				"absl_base",
				"absl_container",
				"absl_functional",
				"absl_meta",
				"absl_numeric",
				"absl_types",
				"absl_utility",
			],
			path: "absl/strings",
			sources: [
				"internal/str_format/arg.cc",
				"internal/str_format/bind.cc",
				"internal/str_format/extension.cc",
				"internal/str_format/float_conversion.cc",
				"internal/str_format/output.cc",
				"internal/str_format/parser.cc",
			],
			publicHeadersPath: "include"
		),		
		.target(
			name: "absl_strings",
			dependencies: [
				"absl_base",
				"strings_internal",
				"absl_memory",
				"absl_numeric"
			],
			path: "absl/strings",
			sources: [
				"ascii.cc",
				"charconv.cc",
				"escaping.cc",
				"internal/charconv_bigint.cc",
				"internal/charconv_bigint.h",
				"internal/charconv_parse.cc",
				"internal/charconv_parse.h",
				"internal/damerau_levenshtein_distance.cc",
				"internal/memutil.cc",
				"internal/memutil.h",
				"internal/stringify_sink.h",
				"internal/stringify_sink.cc",
				"internal/stl_type_traits.h",
				"internal/str_join_internal.h",
				"internal/str_split_internal.h",
				"match.cc",
				"numbers.cc",
				"str_cat.cc",
				"str_replace.cc",
				"str_split.cc",
				"substitute.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_status",
			dependencies: [
				"absl_base",
				"absl_container_inlined_vector",
				"container_compressed_tuple",
				"absl_crc",
				"absl_debugging",
				"absl_functional",
				"absl_memory",
				"absl_strings",
				"absl_types"
			],
			path: "absl/status",
			sources: [
				"internal/status_internal.cc",
				"status.cc",
				"status_payload_printer.cc",
				"statusor.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_synchronization",
			dependencies: [
				"absl_base",
				"absl_debugging",
				"absl_time",
			],
			path: "absl/synchronization",
			sources: [
				 "barrier.cc",
				 "blocking_counter.cc",
				 "mutex.cc",
				 "notification.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_time",
			dependencies: [
				"absl_base",
				"absl_numeric",
				"absl_strings",
				"absl_types",
			],
			path: "absl/time",
			sources: [
				"civil_time.cc",
				"clock.cc",
				"duration.cc",
				"format.cc",
				"time.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_utility",
			dependencies: [
				"absl_base",
				"absl_meta",
			],
			path: "absl/utility",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "absl_types",
			dependencies: [
				"absl_base",
				"absl_memory",
				"absl_meta",
				"absl_utility",
			],
			path: "absl/types",
			sources: [
				"bad_any_cast.cc",
				"bad_optional_access.cc",
				"bad_variant_access.cc",
			],
			publicHeadersPath: "include"
		),
	],
	cLanguageStandard: .gnu11,
	cxxLanguageStandard: .gnucxx20
)
