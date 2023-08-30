
# depends on task warrior, shows pending tasks at shell login

function pending_tasks() {
    task_count=$(task status:pending count)
    echo "You have $task_count pending tasks"
}

