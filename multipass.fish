# multipass.fish - multipass completions for fish shell
#
# To install the completions:
# mkdir -p ~/.config/fish/completions
# cp multipass.fish ~/.config/fish/completions

function __fish_print_multipass_instances --description 'Print a list of multipass instances' -a select
  switch $select
    case running
      multipass list --format=csv | grep Running | cut -d ',' -f 1
    case stopped
      multipass list --format=csv | grep Stopped | cut -d ',' -f 1
    case all
      multipass list --format=csv | tail +2 | cut -d ',' -f 1
  end
end

complete -f -c multipass -n '__fish_use_subcommand' -a delete -d "Delete instances"
complete -f -c multipass -n '__fish_use_subcommand' -a exec -d "Run a command on an instance"
complete -f -c multipass -n '__fish_use_subcommand' -a find -d "Display available images to create instances from"
complete -f -c multipass -n '__fish_use_subcommand' -a get -d "Get a configuration setting"
complete -f -c multipass -n '__fish_use_subcommand' -a help -d "Display help about a command"
complete -f -c multipass -n '__fish_use_subcommand' -a info -d "Display information about instances"
complete -f -c multipass -n '__fish_use_subcommand' -a launch -d "Create and start an Ubuntu instance"
complete -f -c multipass -n '__fish_use_subcommand' -a list -d "List all available instances"
complete -f -c multipass -n '__fish_use_subcommand' -a mount -d "Mount a local directory in the instance"
complete -f -c multipass -n '__fish_use_subcommand' -a purge -d "Purge all deleted instances permanently"
complete -f -c multipass -n '__fish_use_subcommand' -a recover -d "Recover deleted instances"
complete -f -c multipass -n '__fish_use_subcommand' -a restart -d "Restart instances"
complete -f -c multipass -n '__fish_use_subcommand' -a set -d "Set a configuration setting"
complete -f -c multipass -n '__fish_use_subcommand' -a shell -d "Open a shell on a running instance"
complete -f -c multipass -n '__fish_use_subcommand' -a start -d "Start instances"
complete -f -c multipass -n '__fish_use_subcommand' -a stop -d "Stop running instances"
complete -f -c multipass -n '__fish_use_subcommand' -a suspend -d "Suspend running instances"
complete -f -c multipass -n '__fish_use_subcommand' -a transfer -d "Transfer files between the host and instances"
complete -f -c multipass -n '__fish_use_subcommand' -a umount -d "Unmount a directory from an instance"
complete -f -c multipass -n '__fish_use_subcommand' -a version -d "Show version details"

# delete
complete -f -c multipass -n '__fish_seen_subcommand_from delete' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from delete' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from delete' -l all -d 'Delete all instances'
complete -f -c multipass -n '__fish_seen_subcommand_from delete' -s purge -l purge -d 'Purge instances immediately'
complete -f -c multipass -n '__fish_seen_subcommand_from delete' -a '(__fish_print_multipass_instances all)' -d "Instance"

# exec
complete -f -c multipass -n '__fish_seen_subcommand_from exec' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from exec' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from exec' -a '(__fish_print_multipass_instances running)' -d "Instance"

# find
complete -f -c multipass -n '__fish_seen_subcommand_from find' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from find' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from find' -l show-unsupported -d "Show unsupported cloud images as well"
complete -f -c multipass -n '__fish_seen_subcommand_from find' -l format -d "Output list in the requested format. Valid formats are: table (default), json, csv and yaml"

# get
complete -f -c multipass -n '__fish_seen_subcommand_from get' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from get' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."

# info
complete -f -c multipass -n '__fish_seen_subcommand_from info' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from info' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from info' -l all -d 'Delete all instances'
complete -f -c multipass -n '__fish_seen_subcommand_from info' -l format -d "Output list in the requested format. Valid formats are: table (default), json, csv and yaml"
complete -f -c multipass -n '__fish_seen_subcommand_from info' -a '(__fish_print_multipass_instances all)' -d "Instance"

# launch
complete -f -c multipass -n '__fish_seen_subcommand_from launch' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from launch' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from launch' -s c -l cpus -d "Number of CPUs to allocate. Minumum: 1, default: 1."
complete -f -c multipass -n '__fish_seen_subcommand_from launch' -s d -l disk  -d "Disk space to allocate. Positive integers, in bytes, or with K, M, G suffix. Minimum: 512M, default: 5G."
complete -f -c multipass -n '__fish_seen_subcommand_from launch' -s m -l mem -d "Amount of memory to allocate. Positive integers, in bytes, or with K, M, G suffix. Minimum:128M, default: 1G."
complete -f -c multipass -n '__fish_seen_subcommand_from launch' -s n -l name -d "Name for the instance. If it is 'primary' (the configured primary instance name), the user's home directory is mounted inside the newly launched instance, in 'Home'."
complete -f -c multipass -n '__fish_seen_subcommand_from launch' -l cloud-init -d "Path to a user-data cloud-init configuration, or '-' for stdin"

# list
complete -f -c multipass -n '__fish_seen_subcommand_from list' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from list' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from list' -l format -d "Output list in the requested format. Valid formats are: table (default), json, csv and yaml"

# mount
complete -f -c multipass -n '__fish_seen_subcommand_from mount' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from mount' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from mount' -s g -l gid-map -d "A mapping of group IDs for use in the mount. File and folder ownership will be mapped from <host> to <instance> inside the instance. Can be used multiple times."
complete -f -c multipass -n '__fish_seen_subcommand_from mount' -s u -l uid-map -d "A mapping of user IDs for use in the mount. File and folder ownership will be mapped from <host> to <instance> inside the instance. Can be used multiple times."

# purge
complete -f -c multipass -n '__fish_seen_subcommand_from purge' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from purge' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."

# recover
complete -f -c multipass -n '__fish_seen_subcommand_from recover' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from recover' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from recover' -l all -d 'Recover all deleted instances'
complete -f -c multipass -n '__fish_seen_subcommand_from recover' -a '(__fish_print_multipass_instances all)' -d "Instance"

# restart
complete -f -c multipass -n '__fish_seen_subcommand_from restart' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from restart' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from restart' -l all -d 'Restart all instances'
complete -f -c multipass -n '__fish_seen_subcommand_from restart' -a '(__fish_print_multipass_instances all)' -d "Instance"

# set
complete -f -c multipass -n '__fish_seen_subcommand_from set' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from set' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."

# shell
complete -f -c multipass -n '__fish_seen_subcommand_from shell' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from shell' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from shell' -a '(__fish_print_multipass_instances running)' -d "Instance"

# start
complete -f -c multipass -n '__fish_seen_subcommand_from start' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from start' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from start' -l all -d 'Start all instances'
complete -f -c multipass -n '__fish_seen_subcommand_from start' -a '(__fish_print_multipass_instances all)' -d "Instance"

# stop
complete -f -c multipass -n '__fish_seen_subcommand_from stop' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from stop' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from stop' -l all -d 'Stop all instances'
complete -f -c multipass -n '__fish_seen_subcommand_from stop' -s t -l time -d 'Time from now, in minutes, to delay shutdown of the instance'
complete -f -c multipass -n '__fish_seen_subcommand_from stop' -s c -l cancel -d 'Cancela pending deplayed shutdown'
complete -f -c multipass -n '__fish_seen_subcommand_from stop' -a '(__fish_print_multipass_instances all)' -d "Instance"

# suspend
complete -f -c multipass -n '__fish_seen_subcommand_from suspend' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from suspend' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
complete -f -c multipass -n '__fish_seen_subcommand_from suspend' -l all -d 'Suspend all instances'
complete -f -c multipass -n '__fish_seen_subcommand_from suspend' -a '(__fish_print_multipass_instances all)' -d "Instance"

# transfer
complete -f -c multipass -n '__fish_seen_subcommand_from transfer' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from transfer' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."

# umount
complete -f -c multipass -n '__fish_seen_subcommand_from umount' -s h -l help -d 'Display this help'
complete -f -c multipass -n '__fish_seen_subcommand_from umount' -s v -l verbose -d "Increase logging verbosity. Repeat the 'v' in the short option for more detail. Maximum verbosity is obtained with 4 (or more) v's, i.e. -vvvv."
