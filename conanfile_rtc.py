from conans import ConanFile

class AbseilConan(ConanFile):
    name = "abseil-cpp"
    version = "0.0.1"
    url = "https://github.com/duncanthomson/abseil-cpp"
    license = "https://github.com/duncanthomson/abseil-cpp/blob/master/LICENSE"
    description = "Abseil is an open-source collection of C++ code (compliant to C++14) designed to augment the C++ standard library."

    # RTC specific triple
    settings = "platform_architecture_target"

    def package(self):
        base = self.source_folder
        relative = "3rdparty/abseil-cpp"

        # headers
        self.copy("*.h", src=base + "/absl", dst=relative + "/absl")
        self.copy("*.hpp", src=base + "/absl", dst=relative + "/absl")

        # libraries
        output = "output/" + str(self.settings.platform_architecture_target) + "/staticlib"
        self.copy("*" + self.name + "*", src=base + "/../../" + output, dst=output)
