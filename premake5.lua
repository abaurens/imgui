-- ImGui
project "ImGui"
  kind "StaticLib"
  language "C++"
  cppdialect "C++17"
  staticruntime "on"
  systemversion "latest"


  targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
  objdir ("%{wks.location}/build/" .. outputdir .. "/%{prj.name}")

  IncludeDir["imgui"] = "%{wks.location}/libs/imgui"

  includedirs {
    "%{IncludeDir.imgui}"
  }

  files {
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
  }

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
