# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/clouduser/system_diary"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/clouduser/system_diary/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/home/clouduser/system_diary/log/unicorn.log"
stdout_path "/home/clouduser/system_diary/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.[System Diary].sock"
listen "/tmp/unicorn.systemdiary.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
