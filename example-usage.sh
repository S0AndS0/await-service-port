#!/usr/bin/env bash


# Example usage for Await Service Port
# Copyright (C) 2019  S0AndS0
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


## Find true directory this script resides in
__SOURCE__="${BASH_SOURCE[0]}"
while [[ -h "${__SOURCE__}" ]]; do
    __SOURCE__="$(find "${__SOURCE__}" -type l -ls | sed -n 's@^.* -> \(.*\)@\1@p')"
done
__DIR__="$(cd -P "$(dirname "${__SOURCE__}")" && pwd)"


## Source module code within this script
source "${__DIR__}/modules/await-service-port/await-service-port.sh"


_sshd_ports_list=($(await_service_port 'sshd' 'tcp' '1' '2'))
if [ "${#_sshd_ports_list[@]}" -gt '0' ]; then
    printf 'SSHD Port: %s\n' "${_sshd_ports_list[@]}"
else
    printf 'No ports found this time\n' >&2
fi


_sshd_ports_string="$(await_service_port 'sshd' '' '' '2')"
if [ -n "${_sshd_ports_string}" ]; then
    printf 'SSHD Port(s): %s\n' "${_sshd_ports_string[@]}"
else
    printf 'No ports found this time\n' >&2
fi


if ! [ "$(await_service_port 2>/dev/null)" ]; then
  echo "Test for failure success!"
fi
