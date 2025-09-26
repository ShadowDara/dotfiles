const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    // Change to ReleaseFast for Export Builds
    const optimize = b.standardOptimizeOption(.{});
    // const optimize = b.ReleaseFast;

    const exe = b.addExecutable(.{
        // Name of the export binary
        .name = "zig_wit",

        .target = target,
        .optimize = optimize,

        // Use null when the main function is either in C or C++
        .root_source_file = null,
    });

    // Add an C++ Source File
    exe.addCSourceFiles(.{
        .files = &.{"src/main.cpp"},
        // Version of the Standard Library
        .flags = &.{"-std=c++17"},
    });
    exe.addCSourceFiles(.{
        .files = &.{"src/function.cpp"},
        // Version of the Standard Library
        .flags = &.{"-std=c++17"},
    });

    // Link Standard Library for C
    exe.linkLibC();

    // Link Standard Library for C++
    exe.linkLibCpp();

    // include src Path
    exe.addIncludePath(b.path("src"));

    b.installArtifact(exe);

    // to run the programm
    const run_cmd = b.addRunArtifact(exe);
    const run_step = b.step("run", "Build and execute the programm");
    run_step.dependOn(&run_cmd.step);

    // Building and Running the Testprogramm
    const tests = b.addExecutable(.{
        // Executable Name
        .name = "tests",

        .target = target,
        .optimize = optimize,

        .root_source_file = null,
    });

    // Add C++ Source File to the Test executable
    tests.addCSourceFiles(.{
        .files = &.{"src/test.cpp"},
        // Version of the Standard Library
        .flags = &.{"-std=c++17"},
    });
    tests.addCSourceFiles(.{
        .files = &.{"src/function.cpp"},
        // Version of the Standard Library
        .flags = &.{"-std=c++17"},
    });

    // Add C and C++ Standarf Library to the tests
    tests.linkLibC();
    tests.linkLibCpp();

    const run_tests = b.addRunArtifact(tests);
    b.step("test", "Build and run tests").dependOn(&run_tests.step);

    // Run Tests after the Build
    b.getInstallStep().dependOn(&run_tests.step);
}
