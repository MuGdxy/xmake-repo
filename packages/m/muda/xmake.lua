package("muda")
    set_kind("library")
    set_description("Muda, yet another painless cuda programming paradigm. With features: structured launch, graph, thread only STL.")
    add_deps("cuda", "eigen", {optional = false})
    add_urls("https://github.com/MuGdxy/muda.git")
    add_versions("0.0.2", "a987c9116be554ea73eb1b6d54751d408f843ef3")

    add_configs("ndebug", {description = "disable muda debug check.", default = false})

    on_install(function (package)
        local configs = {}
        
        configs["ndebug"] = package:config("ndebug")
        configs["core-only"] = false
        configs["example"] = false
        configs["test"] = false
        configs["playground"] = false
        configs["util"] = true
        configs["ext"] = true

        import("package.tools.xmake").install(package, configs)
    end)

package_end()