project "SPIRV-Cross"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    targetdir ("%{wks.location}/bin/%{prj.name}/"..outputdir)
    objdir ("%{wks.location}/bin-int/%{prj.name}/"..outputdir)

    files
    {
        "%{prj.location}/**.cpp"
    }

    includedirs
    {
        VULKAN_HEADER,
        GLM_HEADERS .. "/../",
        "%{prj.location}/include",
        "%{prj.location}"
        
    }
    libdirs { "%{wks.location}/Dependencies/GLFW/lib-vc2019", os.getenv("VULKAN_SDK") .. "/Lib" }
    
    links {  "vulkan-1.lib"}

    flags { "NoPCH" }
    
    filter "configurations:Debug"
        defines "VS_DEBUG"
        symbols "On"
        
    filter "configurations:Release"
        defines "VS_RELEASE"
        defines "TRACY_ENABLE"
        optimize "On"
    filter "configurations:Release"
        defines "VS_RELEASE"
        optimize "On"