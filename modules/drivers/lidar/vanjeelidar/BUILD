load("//tools:apollo_package.bzl", "apollo_package", "apollo_cc_library", "apollo_component")
load("//tools:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

VANJEE_COPTS = ['-DMODULE_NAME=\\"vanjeelidar\\"']

cc_import(
    name = "vanjee_filter_lib",
    shared_library = "opt_dll/libVanJeeLaser760Filter_linux.so",
    visibility = ["//visibility:public"],
)

VANJEE_COPTS = VANJEE_COPTS + ["-DFILTER_DLL_ENABLE"]

apollo_component(
    name = "libvanjeelidar_component.so",
    copts = VANJEE_COPTS,
    srcs = [
        "src/vanjeelidar_component.cpp",
    ],
    hdrs = [
        "src/vanjeelidar_component.h",
    ],
    deps = [
        "//modules/common_msgs/sensor_msgs:pointcloud_cc_proto",
        "//modules/drivers/lidar/vanjeelidar/proto:vanjeelidar_config_proto",
        "//modules/drivers/lidar/vanjeelidar/proto:vanjeelidar_proto",
        "//modules/drivers/lidar/common:lidar_common",
        ":vanjee_filter_lib",
    ],
    linkopts = [
        "-Wl,-rpath,'$$ORIGIN'",
        "-Wl,-rpath,'$$ORIGIN/../opt_dll'",
        "-Wl,-rpath,'/opt/apollo/neo/lib/modules/drivers/lidar/vanjeelidar'",
    ]
)

filegroup(
    name = "vanjee_external_lib",
    srcs = ["opt_dll/libVanJeeLaser760Filter_linux.so"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "runtime_data",
    srcs = glob([
        "conf/*.txt",
        "conf/*.conf",
        "dag/*.dag",
        "launch/*.launch",
    ]) + [":vanjee_external_lib"],
)

apollo_package()
cpplint()
