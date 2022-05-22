project "asio"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
    staticruntime "on"

    targetdir 	("%{wks.location}/bin/%{prj.name}/" .. outputDir)
    objdir 		("%{wks.location}/obj/%{prj.name}/" .. outputDir)

	defines
	{
		"ASIO_STANDALONE",
		"ASIO_SEPARATE_COMPILATION"
	}

	files
	{
		"include/**.hpp",
		"include/**.ipp",
		"src/asio.cpp"
	}
	
	includedirs
	{
		"include"
	}

    filter "system:windows"
        systemversion "latest"
		defines "_WIN32_WINNT=0x0A00"
        
    filter "system:linux"
		pic "On"

    filter "configurations:x64d"
		runtime "Debug"
        symbols "on"

	filter "configurations:ARMd"
		runtime "Debug"
        symbols "on"

	filter "configurations:ARM64d"
		runtime "Debug"
		symbols "on"

    filter "configurations:x64"
		runtime "Release"
        optimize "on"

	filter "configurations:ARM"
		runtime "Release"
		optimize "on"

	filter "configurations:ARM64"
		runtime "Release"
		optimize "on"
