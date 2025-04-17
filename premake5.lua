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

    libdirs
    {
        "lib" 
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

