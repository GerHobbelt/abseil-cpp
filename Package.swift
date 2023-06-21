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
		.library(name: "algorithm", targets: ["algorithm"]),
		.library(name: "base", targets: ["base"]),
		.library(name: "cleanup", targets: ["cleanup"]),
		.library(name: "container", targets: ["container"]),
		.library(name: "container_fixed_array", targets: ["container_fixed_array"]),
		.library(name: "container_inlined_vector", targets: ["container_inlined_vector"]),
		.library(name: "crc", targets: ["crc"]),
		.library(name: "debugging", targets: ["debugging"]),
		.library(name: "flags", targets: ["flags"]),
		.library(name: "functional", targets: ["functional"]),
		.library(name: "hash", targets: ["hash"]),
		.library(name: "log", targets: ["log"]),
		.library(name: "memory", targets: ["memory"]),
		.library(name: "meta", targets: ["meta"]),
		.library(name: "numeric", targets: ["numeric"]),
		.library(name: "profiling", targets: ["profiling"]),
		.library(name: "string_view", targets: ["string_view"]),
		.library(name: "strings", targets: ["strings"]),
		.library(name: "strings_str_format", targets: ["strings_str_format"]),
		.library(name: "strings_internal", targets: ["strings_internal"]),
		.library(name: "status", targets: ["status"]),
		.library(name: "synchronization", targets: ["synchronization"]),
		.library(name: "time", targets: ["time"]),
		.library(name: "types", targets: ["types"]),
		.library(name: "utility", targets: ["utility"]),
	],
	targets: [
		.target(
			name: "algorithm",
			dependencies: [
				"base",
			],
			path: "absl/algorithm",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "base",
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
			name: "cleanup",
			dependencies: [
				"base",
				"utility",
			],
			path: "absl/cleanup",
			sources: [],
			publicHeadersPath: "include"
		),		
		.target(
			name: "container_compressed_tuple",
			dependencies: [
				"utility",
			],
			path: "absl/container",
			sources: [],
			publicHeadersPath: "compressed_tuple/include"
		),
		.target(
			name: "container_fixed_array",
			dependencies: [
				"algorithm",
				"base",
				"container_compressed_tuple",
				"memory",
			],
			path: "absl/container",
			sources: [],
			publicHeadersPath: "fixed_array/include"
		),
		.target(
			name: "container_inlined_vector",
			dependencies: [
				"algorithm",
				"base",
				"memory",
			],
			path: "absl/container",
			sources: [],
			publicHeadersPath: "inlined_vector/include"
		),
		.target(
			name: "container",
			dependencies: [
				"algorithm",
				"base",
				"debugging",
				"hash",
				"memory",
				"meta",
				"numeric",
				"profiling",
				"strings",
				"synchronization",
				"time",
				"types",
				"utility",
			],
			path: "absl/container",
			sources: [
				"internal/raw_hash_set.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "crc",
			dependencies: [
				"base",
				"memory",
				"numeric",
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
			name: "debugging",
			dependencies: [
				"base",
				"meta",
				"numeric",
				"string_view",
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
			name: "flags",
			dependencies: [
				"base",
				"meta",
				"utility",
			],
			path: "absl/flags",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "functional",
			dependencies: [
				"base",
				"meta",
				"utility",
			],
			path: "absl/functional",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "hash",
			dependencies: [
				"base",
				"container_fixed_array",
				"functional",
				"meta",
				"numeric",
				"strings",
				"types",
				"utility",
			],
			path: "absl/hash",
			sources: [
				"internal/hash.cc",
			],
			publicHeadersPath: "include"
		),		
		.target(
			name: "log",
			dependencies: [
				"base",
				"cleanup",
				"container_inlined_vector",
				"flags",
				"hash",
				"memory",
				"strings",
				"synchronization",
				"time",
				"types",
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
			name: "memory",
			dependencies: [
				"base",
			],
			path: "absl/memory",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "meta",
			dependencies: [
				"base",
			],
			path: "absl/meta",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "numeric",
			dependencies: [
				"base",
			],
			path: "absl/numeric",
			sources: [
				"int128.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "profiling",
			dependencies: [
				"base",
			],
			path: "absl/profiling",
			sources: [
				"internal/exponential_biased.cc",
				"internal/periodic_sampler.cc",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "string_view",
			dependencies: [
				"base",
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
				"base",
				"meta",
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
				"base",
				"container",
				"functional",
				"meta",
				"numeric",
				"types",
				"utility",
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
			name: "strings",
			dependencies: [
				"base",
				"strings_internal",
				"memory",
				"numeric"
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
			name: "status",
			dependencies: [
				"base",
				"container_inlined_vector",
				"container_compressed_tuple",
				"crc",
				"debugging",
				"functional",
				"memory",
				"strings",
				"types"
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
			name: "synchronization",
			dependencies: [
				"base",
				"debugging",
				"time",
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
			name: "time",
			dependencies: [
				"base",
				"numeric",
				"strings",
				"types",
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
			name: "utility",
			dependencies: [
				"base",
				"meta",
			],
			path: "absl/utility",
			sources: [],
			publicHeadersPath: "include"
		),
		.target(
			name: "types",
			dependencies: [
				"base",
				"memory",
				"meta",
				"utility",
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
