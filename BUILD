# Copyright 2016, Stewart Henderson

cc_binary(
    name = "scribe",
    srcs = glob([
    	"src/*.cpp",
        "inc/*.h"
 #   	"src/*.c"
    ]),
    deps = [
        "@boost//:filesystem",
        "@boost//:algorithm",
        "@boost//:assert",
        "//third_party/thrift:thrift_headers",
    ],
    copts = [
        "-Wno-deprecated"   
    ]
)
