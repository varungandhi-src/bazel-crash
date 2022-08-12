def make_test(name):
    native.sh_test(
      name = name,
      srcs = ["hello.sh"],
      deps = [],
      env = {
        "TEST_NAME": "ohno",
      },
    )
    native.test_suite(
        name = "suite",
        tests = [name],
    )
