add_rules("mode.debug", "mode.release")

-- Electonic Art Standard Template Library
add_requires("eastl")

target("AngelScriptJIT")
    set_kind("static")
    set_languages("c++latest")
    set_warnings("none")

    add_packages("eastl", { public = true })
    add_defines("EASTL_OPENSOURCE")
    add_deps("AngelScript")

    add_includedirs("../angelscript/sdk/angelscript/source")
    
    add_files("as_jit.cpp")
    add_headerfiles("as_jit.h", "virtual_asm.h")
    
    if is_plat("windows") then
        add_files("virtual_asm_windows.cpp")
        add_defines("_CRT_SECURE_NO_WARNINGS")
    elseif is_plat("linux") then
        add_files("virtual_asm_linux.cpp")
    end
    
    if is_arch("x64", "x86_64") then
        add_files("virtual_asm_x64.cpp")
    elseif is_arch("x86", "i386") then
        add_files("virtual_asm_x86.cpp")
    end
    
    add_includedirs(".", {public = true})