# Await Service Port
[heading__title]:
  #await-service-port
  "&#x2B06; Top of this page"


[`await-service-port.sh`][await_service_port__master__source_code], contains a function that returns listening ports for a given service, even if it has to wait a few seconds, and even if the listening ports are not known in advance; such as in the case with `librespot` service.


> The following covers how to install this branch as a submodule within your own project, and parameters that `await-service-port.sh` currently responds to.


## [![Byte size of await-service-port.sh][badge__master__await_service_port__source_code]][await_service_port__master__source_code] [![Open Issues][badge__issues__await_service_port]][issues__await_service_port] [![Open Pull Requests][badge__pull_requests__await_service_port]][pull_requests__await_service_port] [![Build Test Status][badge__travis_ci__await_service_port]][travis_ci__await_service_port] [![Latest commits][badge__commits__await_service_port__master]][commits__await_service_port__master]


------


#### Table of Contents


- [&#x2B06; Top of ReadMe File][heading__title]

- [:zap: Quick Start][heading__quick_start]

  - [:memo: Edit Your ReadMe File][heading__edit_your_readme_file]
  - [&#x1F578; Example Usage][heading__example_usage]
  - [:floppy_disk: Commit and Push][heading__commit_and_push]

- [:scroll: API][heading__api]

- [&#x1F5D2; Notes][notes]

- [:copyright: License][heading__license]


------



## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; ...well as quick as it may get with things like this"


**Bash Variables**


```Bash
_module_https_url='https://github.com/bash-utilities/await-service-port.git'
_module_relative_path='modules/await-service-port'
```


**Git Commands**


```Bash
cd "<your-git-project-path>"

git checkout gh-pages
git submodule add -b master --name await-service-port "${_module_https_url}" "${_module_relative_path}"

git submodule update
cd "${_module_relative_path}"
git checkout master
git pull
```


> **Version Locking**; recommended for those that audit every dependency...


```Bash
git checkout tags/<tag_name> -b <branch_name>
```


> ... replace _`<tag_name>`_ with the tag to checkout and _`<branch_name>`_ with a custom name, eg...


```Bash
git checkout tags/v0.0.1 -b loc-v0.0.1
```


### Edit Your ReadMe File
[heading__edit_your_readme_file]:
  #edit-your-readme-file
  "&#x1F4DD; Suggested additions so everyone has a good time with submodules"


Suggested additions so everyone has a good time with submodules


```MarkDown
Clone with the following to avoid incomplete downloads


    git clone --recurse-submodules <url-for-your-project>


Update/upgrade submodules via


    git submodule update --init --recursive
    git submodule update --merge
```


### Example Usage
[heading__example_usage]:
  #example-usage
  "&#x1F578; Example of sourcing and utilize `await_service_port` features"


Example of sourcing and utilize `await_service_port` features


**`example_usage.sh`**

```Bash
#!/usr/bin/env bash


## Find true directory this script resides in
__SOURCE__="${BASH_SOURCE[0]}"
while [[ -h "${__SOURCE__}" ]]; do
    __SOURCE__="$(find "${__SOURCE__}" -type l -ls | sed -n 's@^.* -> \(.*\)@\1@p')"
done
__DIR__="$(cd -P "$(dirname "${__SOURCE__}")" && pwd)"


## Source module code within this script
source "${__DIR__}/modules/await-service-port/await-service-port.sh"


#
# Two examples of waiting for SSHD listening ports
#
_sshd_ports_list=($(await_service_port 'sshd' 'tcp'))
if [ "${#_sshd_ports_list[@]}" -gt '0' ]; then
    printf 'SSHD Port: %s\n' "${_sshd_ports_list[@]}"
else
    printf 'No ports found this time\n' >&2
fi

_sshd_ports_string="$(await_service_port 'sshd' 'tcp')"
if [ -n "${_sshd_ports_string}" ]; then
    printf 'SSHD Port(s): %s\n' "${_sshd_ports_string[@]}"
else
    printf 'No ports found this time\n' >&2
fi
```


**Test that things work!**


### Commit and Push
[heading__commit_and_push]:
  #commit-and-push
  "&#x1F4BE; And congratulate yourself on not having to write something similar!"



```Bash
git add .gitmodules
git add modules/await-service-port
git add README.md


git commit -F- <<'EOF'
:heavy_plus_sign: Adds bash-utilities/await-service-port dependency


**Edits**


- `README.md` file, documentation updates for submodules


**Additions**

- `.gitmodules` file, tracks other Git repository code utilized by this project

- `modules/await-service-port` submodule, Git tracked dependency
EOF


git push origin master
```


**:tada: Excellent :tada:** your project is now ready to begin unitizing code from this one!


___


## Await Service Port API
[heading__api]:
  #await-service-port-api
  "&#x1F4DC; The arguments that `await_service_port` understands"


Lists listening ports for given service and protocol via `netstat`


| Param | Type |  | Description |
|---|---|---|---|
| `$1` | string | **required** | Name of service to `grep` for |
| `$2` | string | `<tcp|udp>` | Protocol that service communicates through |
| `$3` | number | `1` | Number of seconds to sleep between checks |
| `$4` | number | `10` | Max number of loops before function fails silently |


**Returns: `<int|list>`**, number or space separated list of numbers


**Throws** `Parameter_Error: no service name supplied to await_service_port`, when first parameter is not defined


**Example:** as an array


```Bash
_sshd_ports_list=($(await_service_port 'sshd'))

printf 'SSHD listening port: %s\n' "${_sshd_ports_list[@]}"
#> SSHD Port: 22
#> SSHD Port: 2222
```


**Example:** as a string


```Bash
_sshd_ports_string="$(await_service_port 'sshd')"

printf 'SSHD listening port(s): %s\n' "${_sshd_ports_string}"
#> SSH Ports: 22 2222
```


___


## Notes
[notes]:
  #notes
  "&#x1F5D2; Additional notes and links that may be worth clicking in the future"


Opening **new** Issues is supper! However, to avoid attention fragmentation be certain to search for related Issues that could be added to instead. Pull Requests are excellent! However, please clone to a separate directory, then checkout the `example` branch which tracks the `master` branch as a submodule, and prior to issuing a Pull Request check the [Community][await_service_port__community] for any relevant updates.


___



## License
[heading__license]:
  #license
  "&#x00A9; Legal bits of Open Source software"


```
Await Service Port submodule quick start documentation
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
by `jesin`
on
```



[badge__travis_ci__await_service_port]:
  https://img.shields.io/travis/bash-utilities/await-service-port/example.svg

[travis_ci__await_service_port]:
  https://travis-ci.com/bash-utilities/await-service-port
  "&#x1F6E0; Automated tests and build logs"


[badge__commits__await_service_port__master]:
  https://img.shields.io/github/last-commit/bash-utilities/await-service-port/master.svg

[commits__await_service_port__master]:
  https://github.com/bash-utilities/await-service-port/commits/master
  "&#x1F4DD; History of changes on this branch"


[await_service_port__community]:
  https://github.com/bash-utilities/await-service-port/community
  "&#x1F331; Dedicated to functioning code"


[await_service_port__example_branch]:
  https://github.com/bash-utilities/await-service-port/tree/example
  "If it lurches, it lives"


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


[badge__master__await_service_port__source_code]:
  https://img.shields.io/github/size/bash-utilities/await-service-port/await-service-port.sh.svg?label=await-service-port.sh

[await_service_port__master__source_code]:
  https://github.com/bash-utilities/await-service-port/blob/master/await-service-port.sh
  "&#x2328; Project source code!"
