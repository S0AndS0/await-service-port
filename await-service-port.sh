#!/usr/bin/env bash


## Lists listening ports for given service and protocol via `netstat`
## @returns {number|list}
## @param {string} _service_name      - Name of service to `grep` for
## @param {string[tcp|udp]} _protocol - Protocol that service communicates through
## @param {number} _sleep_interval    - Number of seconds to sleep between checks
## @param {number} _loop_limit        - Max number of loops before function returns error code
## @author S0AndS0
## @copyright AGPL-3.0
## @exampe As an array
##     _sshd_ports_list=($(await_service_port 'sshd'))
##     printf 'SSHD listening port: %s\n' "${_sshd_ports_list[@]}"
##     #> SSHD Port: 22
##     #> SSHD Port: 2222
## @example As a string
##     _sshd_ports_string="$(await_service_port 'sshd')"
##     printf 'SSHD listening port(s): %s\n' "${_sshd_ports_string}"
##     #> SSH Ports: 22 2222
await_service_port(){
    local _service_name="${1:?# Parameter_Error: no service name supplied to ${FUNCNAME}}"
    local _protocol="${2:-tcp}"
    local _sleep_interval="${3:-1}"
    local _loop_limit="${4:-10}"

    if [ "${_sleep_interval}" -le '0' ] || [ "${_loop_limit}" -le '0' ]; then
        printf 'Parameter_Error: %s requires positive numbers for third and forth parameters\n' "${FUNCNAME[0]}" >&2
        return 1
    fi

    case "${_protocol,,}" in
        tcp)
            local _netstat_opts='plant'
        ;;
        udp)
            local _netstat_opts='planu'
        ;;
        *)
            printf '# Parameter_Error: protocol must either be "tcp" or "udp"' >&2
            return 1
        ;;
    esac

    local _loop_count='0'
    local -a _listen_ports
    while true; do
        local _netstat_service="$(netstat -${_netstat_opts} 2>/dev/null | grep -E -- "/${_service_name}( +)")"
        for _port in $(awk '{gsub(":"," "); print $5}' <<<"${_netstat_service}"); do
            _listen_ports+=("${_port}")
        done

        if [ "${#_listen_ports[@]}" -gt '0' ]; then
            printf '%s\n' "${_listen_ports[*]}"
            break
        elif [ "${_loop_count}" -gt "${_loop_limit}" ]; then
            break
        fi

        let _loop_count+='1'
        sleep "${_sleep_interval}"
    done

    [[ "${#_ipv4_addresses[@]}" -gt '0' ]]; return "${?}"
}
