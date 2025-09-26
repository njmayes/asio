project "asio"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
    staticruntime "off"

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

    filter "configurations:Debug"
		runtime "Debug"
        symbols "on"

    filter "configurations:Release"
		runtime "Release"
        optimize "on"

	filter "configurations:Profile"
		runtime "Release"
		optimize "on"
