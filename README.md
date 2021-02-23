# data-project-rspec

Unit testing of Ipl data analysis is done. In this testing, each unit of the problem is checked on the basis:
* Class of data expected
* Range of values expected


## Installation

* Clone the repo in the local system
* Install all the dependencies using the command
```sh
$ bundle
```

## Usage
* Entire code of the Ipl project is refactored
* Simple script is converted into reusable functions
* To run the Ipl project 
```sh
$ ruby lib/ipl_analysis_refactor.rb
```

* To check for functional fitness
```sh
$ bin/rspec
```

* Also confirm the linting using rubocop
```sh
$ rubocop
```

P.S - Run all commands from the main directory of the project to avoid unexpected errors