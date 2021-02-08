#!/usr/bin/env bash

# Source the optparse.bash file ---------------------------------------------------
source /usr/bin/optparse.bash

# Define options
optparse.define short=m long=minute desc="Minute to execute task." variable=minute default=*
optparse.define short=h long=hour desc="Hour to execute task." variable=hour default=*
optparse.define short=d long=day-of-month desc="Day number of month to execute task." variable=day_of_month default=*
optparse.define short=n long=month desc="Month to execute task." variable=month default=* list="January February March April May June July August September October November December"
optparse.define short=e long=day-of-week desc="Hour to execute task." variable=day_of_week default=* list="Monday Tuesday Wednesday Thursday Friday Saturday Sunday"
optparse.define short=t long=task desc="task command to execute." variable=task

# Generate optparse and autocompletion scripts
script_name="configure_cron_task.sh"
optparse.build $script_name

exit 0

