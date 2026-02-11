def _cc_static_library_impl(ctx):
    cc = ctx.attr.dep[CcInfo]
    libraries = []
    for link_input in cc.linking_context.linker_inputs.to_list():
        for library in link_input.libraries:
            # On macOS, the Apple Clang toolchain does not populate pic_objects
            # (all code is position-independent by default), so fall back to
            # library.objects when pic_objects is empty.
            libraries += library.pic_objects if library.pic_objects else library.objects
    args = ["r", ctx.outputs.out.path] + [f.path for f in libraries]
    ctx.actions.run(
        inputs = libraries,
        outputs = [ctx.outputs.out],
        executable = "/usr/bin/ar",
        arguments = args,
    )
    return [DefaultInfo()]
cc_static_library = rule(
    implementation = _cc_static_library_impl,
    attrs = {
        "dep": attr.label(providers = [CcInfo]),
    },
    outputs = {"out": "%{name}.a"},
)
