licenses(["notice"])

package(default_visibility = ["//visibility:public"])

cc_library(
  name = "thrift_headers",
  includes = [
    "upstream/lib/cpp/src",
    "osx"
  ],
  hdrs = glob([
      "upstream/lib/cpp/src/thrift/protocol/*.h",
      "upstream/lib/cpp/src/thrift/server/*.h",
      "upstream/lib/cpp/src/thrift/concurrency/*.h",
      "upstream/lib/cpp/src/thrift/async/*.h",
      "upstream/lib/cpp/src/thrift/processor/*.h",
      "upstream/lib/cpp/src/thrift/transport/*.h",
  ]),
  srcs = [
    "osx/thrift/config.h"
  ],
  deps = [
    "//third_party/libevent:libevent"
  ],
  visibility = ["//visibility:public"]
)