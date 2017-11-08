#!/bin/bash
. /usr/sbin/sm_environment.env
export PYTHONPATH="/usr/local/src/security_monkey/"
export SECURITY_MONKEY_SETTINGS="/usr/local/src/security_monkey/env-config/config-local.py"
python /usr/local/src/security_monkey/security_monkey/manage.py run_api_server &
