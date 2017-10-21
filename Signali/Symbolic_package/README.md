# Symbolic package

Symbolic package is presented with some basic exampels and how to use it. It uses Pyhton and SymPy which is a Pyhton library for ymbolic mathematics.

## Package

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

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

### Possible problems

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

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc