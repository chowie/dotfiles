#!/bin/bash
# time-tracker
#export TIMETRACKER_STATE_LOG=${EVC

time-tracker() {    
    export TIMETRACKER_ENTRY_DATE=`date +%Y-%m-%d:%H:%M:%S` 
    export TIMETRACKER_PROJECT="$@"

    entry="${TIMETRACKER_ENTRY_DATE} +time-tracker ${TIMETRACKER_PROJECT}"
    ${TODOTXT_APP_PATH} add "${entry}"
    setTimeTrackerProject
    updateEvidence "$entry"
}

updateEvidence() {
    echo $1
}

setTimeTrackerProject() { 
    echo ${TIMETRACKER_PROJECT}
    
}


timeTrackerLogEntry() {
    timeentry=`date +%Y-%m-%d:%H:%M:%S` 
    logentry="${timeentry} +log $@"
    ${TODOTXT_APP_PATH} add "$logentry"
}

getCurrentState() {
    #currentline=`awk '$0~/\+time-tracker/ {print}'  $TODO_FILE | tail -1`
    currentline=`tail -1 $TODOTXT_EVIDENCE_LOG`
    currentStatus="NO PROJECT STARTED"
    description=""
    for i in $currentline;
    do
        case "$i" in
            '+time-tracker')
                ;;
            'start:')
                currentStatus="IN PROGRESS"
                ;;
            'stop:')
                currentStatus="STOPPED"
                ;;
            *)
                description=$description" "${i}
        esac
    done;

    echo $currentStatus" - "$description
}

export -f time-tracker setTimeTrackerProject 
export -f timeTrackerLogEntry 

alias ttrack="time-tracker $@"
alias tlog="timeTrackerLogEntry $@"
alias tstat="getCurrentState"

complete -F _todo time-tracker
complete -F _todo timeTrackerLogEntry 
complete -F _todo ttrack
complete -F _todo tlog 





 


