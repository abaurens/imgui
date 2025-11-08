-- ImGui
project "ImGui"
  kind "StaticLib"
  language "C++"
  cppdialect "C++17"
  staticruntime "on"
  systemversion "latest"

  targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
  objdir ("%{wks.location}/build/" .. outputdir .. "/%{prj.name}")

  --includedirs {
  --  "%{IncludeDir.glfw}",
  --  "%{IncludeDir.imgui}"
  --}

  files {
    "premake5.lua",

    "imconfig.h",
    "imgui.h",
    "imgui.cpp",
    "imgui_draw.cpp",
    "imgui_internal.h",
    "imgui_tables.cpp",
    "imgui_widgets.cpp",
    "imstb_rectpack.h",
    "imstb_textedit.h",
    "imstb_truetype.h",
    "imgui_demo.cpp",

    "backends/**",
  }

  filter "files:backends/**"
    flags "ExcludeFromBuild"

  filter "system:windows"
    defines {
      "_CRT_SECURE_NO_WARNINGS"
    }

  filter "system:linux"
    pic "On"

  filter "system:macosx"
    pic "On"

  filter "configurations:Debug"
    runtime "Debug"
    symbols "On"

  filter "configurations:Release"
    runtime "Release"
    optimize "On"

  usage "PUBLIC"
    includedirs { "./" }

  usage "INTERFACE"
    defines { "GLFW_INCLUDE_NONE" } -- Require any dependent project to implement it's own opengl loader
    links { "ImGui" }
