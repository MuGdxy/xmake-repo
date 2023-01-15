package("muda")
    set_kind("library", {headeronly = true})
    set_description("Muda, yet another painless cuda programming paradigm. With features: structured launch, graph, thread only STL.")
    add_deps("cuda", "eigen", {optional = false})
    add_urls("https://github.com/MuGdxy/muda.git")
    add_versions("0.0.1", "ecb48fae772bd1e3ca74ceed376dbb6e4ecd3fee")

    add_configs("ndebug", {description = "disable muda debug check.", default = false})

    on_load(function (package)
        local ndebug = package:config("ndebug")
        package:add("defines","MUDA_NDEBUG=1")
    end)

    on_install(function (package)
        local configs = {}
        configs["core-only"] = false
        configs["example"] = false
        configs["test"] = false
        configs["playground"] = false
        configs["util"] = true
        configs["ext"] = true
        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        -- TODO check includes and interfaces
        -- assert(package:has_cfuncs("foo", {includes = "foo.h"})
    end)
package_end()