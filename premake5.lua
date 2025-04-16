workspace "jspec"
    configurations { "Release" }
    architecture "x86_64"
    language "C++"
    cppdialect "C++17"
    location "build"

project "jspec"
    kind "StaticLib"
    targetname "jspec"
    targetdir "bin"
    objdir "obj"

    defines { "UNICODE", "_UNICODE" }
    removedefines { "UNICODE", "_UNICODE" }

    -- Include and source directories
    includedirs { "include" }
    files { "src/**.cc", "include/**.h" }

    -- Compiler flags
    filter "configurations:Release"
        optimize "Full"
        symbols "Off"
       -- warnings "Extra"
        --buildoptions { "-Wall", "-fPIC" }

    -- Linker flags and libraries
    libdirs { "lib" }
    links { "gsl", "gslcblas", "muparser"}
    --linkoptions {
    --    "-Wl,-rpath=lib",         -- Runtime search path
    --    "-s",                     -- Strip symbols
    --    "-l:libmuparser.so.2"     -- Exact shared object
    --}

    -- Optional: if OpenMP is used
    -- buildoptions { "-fopenmp" }
    -- linkoptions { "-fopenmp" }
