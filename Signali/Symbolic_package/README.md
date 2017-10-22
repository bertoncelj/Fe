# Symbolic package

Symbolic package is presented with some basic exampels and how to use it. It uses Pyhton and SymPy which is a Pyhton library for symbolic mathematics. 

## Package

These package is made by [Ocave-Forge](https://octave.sourceforge.io/index.php). On their site you can get some other [Packages](https://octave.sourceforge.io/packages.php). For calculation ODE equations we need symbolic library for ana

### How to Install


1.  The dependencies are Octave, Python, and SymPy.  Consult the SymPy
    website for details on how to install SymPy.

2.  Install SymPy by github repository

Download and installation SymPy
--------

1. Get the latest version of SymPy from [GitHub](https://pypi.python.org/pypi/sympy/) To get git version do
```
$ git clone git://github.com/sympy/sympy.git
```
2. To install SymPy itself, then simply run:
```
 sudo python setup.py install
```
For more info goto [README](https://github.com/sympy/sympy/blob/master/README.rst) of SymPy.

Installation symbolic package
-------

1.  Install the dependencies with (terminal)
    `sudo apt-get install octave liboctave-dev python-sympy`.

2.  Start Octave.

3.  At Octave prompt type `pkg install -forge symbolic`.

4.  At Octave prompt, type `pkg load symbolic`.

5.  At Octave prompt, type `syms x`, then `f = (sin(x/2))^3`,
    `diff(f, x)`, etc.

### Possible problems with installation

1. SymPy older version needs to be updated 
```
configure: error: SymPy version 0.7.5 or later is required
checking for sort... /usr/bin/sort
checking for GNU coreutils... yes
checking for python... /usr/bin/python
checking python module: sympy... yes
checking for SymPy version... 0.7.4.1
checking for gawk... gawk
pkg: error running the configure script for symbolic.
error: called from 'configure_make' in file /usr/share/octave/4.0.0/m/pkg/private/configure_make.m near line 79, column 9? 
```
The solution is to check if you have pip

```
sudo apt-cache policy python-pip
```
if it is installed. If not installed run:

```
sudo apt-get install python-pip
```
Now you can run pip to get the new sympy

```
pip install --user sympy
```
Finally back to octave to run
```
pkg install -forge symbolic
```

If it si somethink new just added soluton down below.

## Usefull information

Symbolic functions are expalined in [Octave-Forge](https://octave.sourceforge.io/symbolic/function/@sym/sym.html), presented with usefull exampels.


## Authors

* **Tine Bertoncelj** - *Initial work* - [GitHub](https://github.com/bertoncelj)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


