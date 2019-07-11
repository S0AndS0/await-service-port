## Example Usage for Await Service Port


> This branch is an example of how to utilize [`await-service-port.sh`][branch_master__await_service_port] script from the [`master`][master_branch] branch of this project; head over to the `master` branch of this repository if installation and utilization within your-own project is the goal.



------


#### Table of Contents


- [Example Usage][heading__example_usage]

- [License](#license)


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


Run the [`example_usage.sh`][branch_example__example_usage] script via Bash...


```Bash
bash example_usage.sh
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
#> Test for failur success!
```


## License


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

[branch_example__example_usage]: https://github.com/bash-utilities/await-service-port/blob/example/example_usage.sh
