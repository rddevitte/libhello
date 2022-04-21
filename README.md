# libhello

This project was created mostly for educational, self-learning purposes only, having no practical
use in itself.

What it does is build a shared lib. (`libhello.so`), link into a sample executable (`hello`) and
build and run a unit test executable with GTest (`test/_build/hello_test`).

The shared lib. has only one function, `hello_print()`, which prints a &ldquo;hello&rdquo; message
onto the standard output.

## Dependencies

The project was built and run successfully on a x86-64 machine, with Ubuntu GNU/Linux 20.04 LTS
operating system, and with the following packages installed:

* `gcc`/`g++` 9.4.0
* `make` 4.2.1
* `cmake` 3.16.3
* `libgtest-dev` 1.10.0-2
