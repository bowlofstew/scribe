# Copyright 2016, Stewart Henderson

cc_binary(
    name = "scribe",
    srcs = glob([
    	"src/*.cpp",
 #   	"src/*.c"
    ]),
    deps = [
        "@boost//:filesystem",
        "//third_party/thrift:thrift_headers"
    ],
    includes = [
    	"inc",
    ]
)
