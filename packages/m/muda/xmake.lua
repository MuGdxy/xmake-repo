package("muda")
    set_kind("library", {headeronly = true})
    set_description("The muda package")
    add_deps("cuda", {optional = false})
    add_urls("https://github.com/MuGdxy/muda.git")
    add_versions("0.0.1", "1e050282b2e34e935950ec416befbc5ecc315638")
    on_install(function (package)
        local configs = {}
        configs["core-only"] = false
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        -- TODO check includes and interfaces
        -- assert(package:has_cfuncs("foo", {includes = "foo.h"})
    end)
package_end()