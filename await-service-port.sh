#!/usr/bin/env bash


## Lists listening ports for given service and protocol via `netstat`
## @returns {number|list}
## @param {string} _service_name      - Name of service to `grep` for
## @param {string[tcp|udp]} _protocal - Protocol that service communicates through
## @param {number} _sleep_intervel    - Number of seconds to sleep between checks
## @param {number} _loop_max          - Max number of loops before function fails silently
## @author S0AndS0
## @copyright AGPL-3.0
## @exampe As an array
##     _sshd_ports_list=($(await_service_port 'sshd'))
##		 printf 'SSHD listening port: %s\n' "${_sshd_ports_list[@]}"
##		 #> SSHD Port: 22
##		 #> SSHD Port: 2222
## @example As a string
##     _sshd_ports_string="$(await_service_port 'sshd')"
##		 printf 'SSHD listening port(s): %s\n' "${_sshd_ports_string}"
##		 #> SSH Ports: 22 2222
await_service_port(){
		local _service_name="${1:?# Parameter_Error: no service name supplied to ${FUNCNAME}}"
		local _protocal="${2:-tcp}"
		local _sleep_intervel="${3:-1}"
		local _loop_max="${4:-10}"

		local _loop_count='0'
		case "${_protocal,,}" in
				tcp)
						local _netstat_opts='plant'
				;;
				udp)
						local _netstat_opts='planu'
				;;
				*)
						return 1
				;;
		esac

		local -a _listen_ports
		until [ "${#_listen_ports[@]}" -gt '0' ]; do
				local _netstat_service="$(netstat -${_netstat_opts} 2>/dev/null | grep -E -- "/${_service_name}( +)")"
				for _port in $(awk '{gsub(":"," "); print $5}' <<<"${_netstat_service}"); do
						_listen_ports+=("${_port}")
				done

				if [ "${#_listen_ports[@]}" -gt '0' ]; then
						break
				elif [ "${_loop_count}" -gt "${_loop_max}" ]; then
						break
				fi
				let _loop_count+='1'
				sleep "${_sleep_intervel}"
		done

		printf '%s\n' "${_listen_ports[*]}"
}
