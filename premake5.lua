project "asio"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
    staticruntime "on"

    targetdir 	("%{wks.location}/bin/%{prj.name}/" .. outputDir)
    objdir 		("%{wks.location}/obj/%{prj.name}/" .. outputDir)

	files
	{
		"include/**.hpp",
		"include/**.ipp",
		"src/asio.cpp",
		"src/asio_ssl.cpp"
	}
	
	includedirs
	{
		"include"
	}

    filter "system:windows"
        systemversion "latest"
        
    filter "configurations:Debug"
		runtime "Debug"
        symbols "on"

    filter "configurations:Release"
		runtime "Release"
        optimize "on"
