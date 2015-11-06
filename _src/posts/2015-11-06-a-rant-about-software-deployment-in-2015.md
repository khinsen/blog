    Title: A rant about software deployment in 2015
    Date: 2015-11-06T13:13:32
    Tags: python, scientific computing

We all know that software deployment in a research environment can be a pain, but knowing this as a fact is not quite the same as experiencing it in reality. Over the last days, I spent way more time that I would have imagined on what sounds like a simple task: installing a scientific application written in Python on a Linux machine for use by a group of students in a training session. Here is an outline of the difficulties, in the hope that it will (1) help others who face similar problems and (2) contributes a little bit to improving the situation.

The software that I installed is [nMOLDYN](http://dirac.cnrs-orleans.fr/nMOLDYN/), an analysis tool for Molecular Dynamics trajectories. From a software engineering point of view, this is a rather standard Python program building on [NumPy](http://numpy.scipy.org) and [MMTK](http://dirac.cnrs-orleans.fr/MMTK) for its computations and on [Tkinter](https://wiki.python.org/moin/TkInter) and [matplotlib](http://matplotlib.org/) for the graphical user interface. There is no need for anything on the bleeding edge, a decent three-year old installation of the scientific Python stack would support this perfectly well.

The machine that was set up for the training session is configured much like a typical node in a compute cluster: stable and trusted software installed once and never updated. More specifically, the machine runs [CentOS](https://www.centos.org/) 6.7. Another feature rather typical of compute nodes is the very restricted network connectivity: users can log in via `ssh`, and copy data in and out using `scp`. Everything else is blocked, in particular all outgoing network traffic. The idea is that students will work on desktop or laptop machines, from where they have full network access to search for information, and connect to the compute server only for running scientific software. For my own software installation I had to limit myself to a user account, i.e. no administrator rights, although I could ask the systems administrator to install additional RPMs from CentOS.

A first exploration of the system's Python installation showed a collection of oldies: Python 2.6.6, NumPy 1.4.1, matplotlib 0.99.1.1. That's the state of the art five years ago. I quickly decided not to use it at all, for two reasons. First, I wasn't sure how much of what I had to add would still work with such old versions. All the software was already around five years ago, but I would have had to track down the versions that were current back then. Second, adding modules in a user account to a Python installation at the system level can easily lead to a fragile total. Following Murphy's law such problems would show up during the student sessions. So I decided to start with a fresh install of Python 2.7.

First surprise: no C compiler. An e-mail to the administrator, and I had gcc. Trying to install Python showed that the Tcl/Tk setup was incomplete: the header files were missing. An another e-mail asking for tcl-devel and tk-devel, and that was settled as well. Python, NumPy, netCDF, ScientificPython, and MMTK  were up and running half an hour later. An attempt to install nMOLDYN resulted in the information that I still needed to install Pyro and matplotlib. That can't be so hard, right?

Pyro was no problem indeed, but matplotlib kept me busy for a few more hours. All I had done in the past was `pip install matplotlib`, but `pip` is useless without outgoing network connections. I had to track down source tarballs for matplotlib and all its dependencies. There's a [list](http://matplotlib.org/users/installing.html) of dependencies on the matplotlib Web site, but it's incomplete in two ways: some dependencies are missing (setuptools and six), and others are given by name but without a link. Try googling for "cycler" - you will learn a lot about celestial mechanics before you find a package with this name on [PyPI](https://pypi.python.org/pypi). Of all the matplotlib dependencides, only freetype was already available on my machine, so I had some searching and downloading to do.

The installation instructions for setuptools clearly do not consider the possibility of not having a network connection. They tell me to download a Python script and execute it to download the real software. Fortunately, there is the "advanced" installation option via a tarball. Which ends rather quickly with an error message complaining about the absence of the `zlib` module.

That module is part of the Python standard library, but it is compiled only if zlib (the C library) is installed on the machine. It wasn't on mine. This is not particularly difficult to fix, but rather annoying: I had to install zlib, and then run the Python installation once more. Not to forget: I knew `zlib` was in the standard library, and I immediately saw why it was missing on my machine, because I have been installing Pythons in lots of environments over twenty years. Someone else might well have spent a few hours figuring out what to do about zlib.

From then on everything went smoothly, so this is the end of my story. In order to provide something constructive, here is the complete list of matplotlib dependencies with links, and in the order of installation:

 - [zlib](http://www.zlib.net/)
 - [Python](http://www.python.org/)
 - [numpy](http://www.numpy.org/)
 - [setuptools](http://pypi.python.org/pypi/setuptools)
 - [six](http://pypi.python.org/pypi/six)
 - [cycler](http://pypi.python.org/pypi/Cycler)
 - [pyparsing](http://pypi.python.org/pypi/pyparsing)
 - [python-dateutil](http://pypi.python.org/pypi/python-dateutil)
 - [pytz](http://pypi.python.org/pypi/pytz)
 - [libpng](http://www.libpng.org/pub/png/libpng.html)

Finally, I will pass on a hint that came in this morning via Twitter:

<blockquote class="twitter-tweet" lang="de"><p lang="en" dir="ltr"><a href="https://twitter.com/khinsen">@khinsen</a> <a href="https://twitter.com/MrTheodor">@MrTheodor</a> pip install —download . —no-use-wheel &lt;foobar&gt;&#10;&#10;Won’t work if there are Linux specific dependencies though.</p>&mdash; Donald Stufft (@dstufft) <a href="https://twitter.com/dstufft/status/662620534010740736">6. November 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Using `pip install --download . --no-use-wheel matplotlib`, run of course on a machine that has a network connection, you get tarballs for matplotlib and all its dependencies that pip knows about. You still have to add setuptools (which pip doesn't download because it depends on it itself), the C libraries libpng and zlib, and of course Python's standard but not-always-there `zlib` module.

Looking back at my twenty years using Python, I come to the unfortunate conclusion that software installation is much more of a problem today than it was back in 1995. The main reason is of course that Python software has become more feature-rich and complex - in 1995 something like matplotlib was only a dream. But the state of Python packaging tools is also to blame, with three overlapping and partially compatible tools (distutils, setuptools, and distribute) creating a lot of confusion and various distribution formats (tarballs, eggs, wheels) adding another layer of complexity. What is also sorely missing is a straightforward way to package an application program with all its dependencies in such a way that it can be installed with reasonable effort on all common platforms.
