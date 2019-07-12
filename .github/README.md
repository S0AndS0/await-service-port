## Example Usage for Await Service Port


> This branch is an example of how to utilize [`await-service-port.sh`][branch_master__await_service_port] script from the [`master`][master_branch] branch of this project; head over to the `master` branch of this repository if installation and utilization within your-own project is the goal.

## [![Open Issues][badge__issues__await_service_port]][issues__await_service_port] [![Open Pull Requests][badge__pull_requests__await_service_port]][pull_requests__await_service_port] [![Build Test Status][badge__travis_ci__await_service_port]][travis_ci__await_service_port] [![Latest commits][badge__commits__await_service_port__example]][commits__await_service_port__example]



------


#### Table of Contents


- [Example Usage][heading__example_usage]

- [License][heading__license]


------


## Example Usage
[heading__example_usage]:
  #example-usage
  ""


Clone this project and switch to the `examples` Git `branch`...


```Bash
git clone https://github.com/bash-utilities/await-service-port.git
cd await-service-port
git checkout examples
```


Run the [`example-usage.sh`][branch_example__example_usage] script via Bash...


```Bash
bash example-usage.sh
```


Expect output similar to...


```
#> SSHD Port: 22
#> SSHD Port: 2222
#> SSHD Port(s): 22 2222
#> Test for failur success!
```


... or if SSHD was not listening on any ports for a given protocol...


```
#> No ports found this time
#> No ports found this time
#> Test for failure success!
```


## License
[heading__license]:
  #license
  "&#x00A9; Legal bits of Open Source software"


```
Example Usage for Bash Await Service Port, a submodule for Git tracked Bash scripts
Copyright (C) 2019  S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation; version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```



[master_branch]: https://github.com/bash-utilities/await-service-port

[branch_master__await_service_port]: https://github.com/bash-utilities/await-service-port/blob/master/await-service-port.sh


[branch_example__example_usage]:
  https://github.com/bash-utilities/await-service-port/blob/example/example-usage.sh
  "Bash script that shows some ways of utilizing code from the master branch of this repository"


[badge__travis_ci__await_service_port]:
  https://img.shields.io/travis/bash-utilities/await-service-port/example.svg

[travis_ci__await_service_port]:
  https://travis-ci.com/bash-utilities/await-service-port
  "&#x1F6E0; Automated tests and build logs"


[badge__commits__await_service_port__example]:
  https://img.shields.io/github/last-commit/bash-utilities/await-service-port/example.svg

[commits__await_service_port__example]:
  https://github.com/bash-utilities/await-service-port/commits/example
  "&#x1F4DD; History of changes on this branch"


[badge__issues__await_service_port]:
  https://img.shields.io/github/issues/bash-utilities/await-service-port.svg

[issues__await_service_port]:
  https://github.com/bash-utilities/await-service-port/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."


[badge__pull_requests__await_service_port]:
  https://img.shields.io/github/issues-pr/bash-utilities/await-service-port.svg

[pull_requests__await_service_port]:
  https://github.com/bash-utilities/await-service-port/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"
