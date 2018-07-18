#!/bin/bash
# LinuxGSM alert_email.sh function
# Author: Daniel Gibbs
# Website: https://linuxgsm.com
# Description: Sends email alert.

local commandname="ALERT"
local commandaction="Alert"
function_selfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

fn_print_dots "Sending Email alert: ${email}"
sleep 0.5

if [ -n "${emailfrom}" ]; then
	mail -s "${alertsubject}" -r "${emailfrom}" "${email}" < "${alertlog}"
else
	mail -s "${alertsubject}" "${email}" < "${alertlog}"
fi
exitcode=$?
if [ "${exitcode}" == "0" ]; then
	fn_print_ok_nl "Sending Email alert: ${email}"
	fn_script_log_pass "Sending Email alert: ${email}"
else
	fn_print_fail_nl "Sending Email alert: ${email}"
	fn_script_log_fatal "Sending Email alert: ${email}"
fi