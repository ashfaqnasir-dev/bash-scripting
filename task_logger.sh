#!/bin/bash

LOG_FILE="tasks.log"

add_task() {
    local task="\$1"
    if [ -z "\$task" ]; then
        echo "Error: Please provide a task description."
        exit 1
    fi
    echo "[\$(date '+%Y-%m-%d %H:%M:%S')] $task" >> "$LOG_FILE"
    echo "Task added: \$task"
}

list_tasks() {
    if [ ! -f "\$LOG_FILE" ]; then
        echo "No tasks logged yet."
        return
    fi
    nl -w2 -s'. ' "\$LOG_FILE"
}

case "\$1" in
    add)
        add_task "\$2"
        ;;
    list)
        list_tasks
        ;;
    *)
        echo "Usage: \$0 {add \"task description\" | list}"
        exit 1
        ;;
esac