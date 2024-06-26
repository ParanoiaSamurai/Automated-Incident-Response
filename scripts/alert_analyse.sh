#!/bin/bash

# Define the log directory and alert report file
LOG_DIR="~/Desktop/ansible_playbooks/automated_Incident_Response/logs"
ALERT_REPORT="~/Desktop/ansible_playbooks/automated_Incident_Response/logs/alert_logs.txt"
ALERT_REPORT_SAVED="~Desktop/ansible_playbooks/automated_Incident_Response/logs/alert_saved.txt"

# Define patterns to search for
PATTERNS=("ERROR" "FAILURE" "UNAUTHORIZED ACCESS")

# Initialize the alert report
echo "Alert Analysis Report" > $ALERT_REPORT
echo "=====================" >> $ALERT_REPORT
echo "" >> $ALERT_REPORT

# Function to analyze logs
analyze_logs() {
    local logfile=$1
    local pattern_found=0

    echo "Analyzing log file: $logfile" >> $ALERT_REPORT
    for pattern in "${PATTERNS[@]}"; do
        if grep -q "$pattern" "$logfile"; then
            echo "Pattern found: $pattern" >> $ALERT_REPORT
            grep "$pattern" "$logfile" >> $ALERT_REPORT
            pattern_found=1
        fi
    done

    if [[ $pattern_found -eq 0 ]]; then
        echo "No patterns found." >> $ALERT_REPORT
    fi

    echo "" >> $ALERT_REPORT
    return $pattern_found
}

# Analyze each log file in the log directory
for logfile in $LOG_DIR/*-running-config.txt; do
    if [[ -f $logfile ]]; then
        analyze_logs "$logfile"
        if [[ $? -ne 0 ]]; then
            exit 1
        fi
    fi
done

echo "Alert analysis completed. Report saved to $ALERT_REPORT_SAVED"
exit 0
