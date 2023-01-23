# Create a dotfile contains $SSH_AUTH_SOCK and $SSH_AGENT_PID
# dot_ssh_agent=~/.ssh-agent.$HOSTNAME
# if [ -f $dot_ssh_agent ]; then
# 	. $dot_ssh_agent > /dev/null
# fi
# if [ -n "$SSH_AUTH_SOCK" -a ! -S "$SSH_AUTH_SOCK" ]; then
#     echo "Killing old ssh-agent (pid=$SSH_AGENT_PID)"
#     kill $SSH_AGENT_PID
#     unset SSH_AGENT_PID
# fi
# if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID >& /dev/null; then
# 	ssh-agent > $dot_ssh_agent
# 	. $dot_ssh_agent > /dev/null
# fi
# unset -f dot_ssh_agent

# # Kill all other ssh-agent than current one
# zombie_ssh_agents="$(ps -u $USER -o pid,comm | grep -w [s]sh-agent | awk '{print $1}' | grep -vw $SSH_AGENT_PID)"
# [ -n "$zombie_ssh_agents" ] && kill $zombie_ssh_agents
# unset -f zombie_ssh_agents

# load_ssh_keys()
# {
# 	local loaded_fps=$(ssh-add -l | awk '{print $2}') fp pkey pkeys2add

# 	for pkey in $(ls ~/.ssh/id_* 2>/dev/null | grep -v '\.pub$'); do
# 		if [ -f $pkey -a ! -L $pkey ]; then
#             fp=$(ssh-keygen -lf $pkey | awk '{print $2}')
#             echo $loaded_fps | grep -wq $fp || pkeys2add="$pkeys2add $pkey"
# 		fi
# 	done

# 	[ -z "$pkeys2add" ] || ssh-add $pkeys2add
# }

# load_ssh_keys
# unset -f load_ssh_keys
