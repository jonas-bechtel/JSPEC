project "JSPEC"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files 
    { 
        "src/**.cc", 
        "include/**.h"
    }

    includedirs
    {
        "include"
    }

    filter "system:windows":
        systemversion "latest"

        libdirs
        {
            "lib" 
        }

    filter "system:linux"
        pic "On"
        systemversion "latest"

        libdirs
        {
            "/usr/lib/x86_64-linux-gnu"
        }

    links 
    { 
        "gsl",
        "gslcblas", 
        "muparser"
    }
    
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

