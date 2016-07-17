POS
===

Simple OS for stuff and things...

Building
========

Requires:
 * cc 
 * nasm
 * ld
 * make

To build just run the following from the root of the project::
   
    make kernel

For cleaning use::

    make clean

Running
=======

Should work on any x86 system with grub. In theory just copy kernel onto a disk and point grub at it.

The most simple thing is to use qemu (http://qemu.org) and run with -kernel flag. There is a
helper script to make this even easier. Just run::

	./run-pos.sh

And it will run the OS in qemu. If you built qemu from source (recommended) make sure you have it on
your system ``$PATH`` as 'qemu' or set a ``QEMU`` environment variable for the helper script to use.