# Symbolic package

Symbolic package is presented with some basic exampels and how to use it. It uses Pyhton and SymPy which is a Pyhton library for ymbolic mathematics.

## Package

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### How to Install


1.  The dependencies are Octave, Python, and SymPy.  Consult the SymPy
    website for details on how to install SymPy.

2.  Install SymPy by github repository
* Get the latest version of SymPy from [GitHub](https://pypi.python.org/pypi/sympy/) To get git version do
```
$ git clone git://github.com/sympy/sympy.git
```
* To install SymPy itself, then simply run:
```
 sudo python setup.py install
```
For more info goto [README](https://github.com/sympy/sympy/blob/master/README.rst) of SymPy.

2.  Start Octave.

3.  At Octave prompt type `pkg install -forge symbolic`.

4.  At Octave prompt, type `pkg load symbolic`.

5.  At Octave prompt, type `syms x`, then `f = (sin(x/2))^3`,
    `diff(f, x)`, etc.

### Usage

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

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
