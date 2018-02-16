# bin

My set of useful scripts.

## Installation

Usually should be cloned to `$HOME/bin` user's directory and added to path.

### On Linux

Debian should include `$HOME/bin` folder to path out of the box.

If not then add this line to `.profile` file:

```
PATH="$HOME/bin:$PATH"
```

### On Windows

Append absolute path to `bin` folder to `Path` variable in _Control Panel_ → _System_.

## Highlights

### Run SSH agent on Windows

Add file `~/.bashrc` with the following content:

```
# Add alias for ssh-agent-connect script from ~/bin repo
alias sac='source ssh-agent-connect'

# Try to connect to ssh-agent to have `ssh-add` working in every bash window
sac
```

Now every time when open a new bash window it will try to connect to ssh-agent.

If ssh-agent is not started yet it has to be started:

```
ssh-agent-start
```

Then `ssh-add` will work in new bash windows. To make it work in the current bash window you need to execute `sac` or `source ssh-agent-connect` and the current session will connect to ssh-agent successfully.

I tested this only for a terminal emulator provided by [Git for Windows](https://git-scm.com/) package.

### "Disable user input" and "Turn off monitor" features for TeamViewer on Debian

`teamviewer-always-disable-user-input.sh` script automatically detects TeamViewer active session and turns off monitors and optionally disables mouse/keyboard.

Add this line to `~/.profile` file:

```
~/bin/teamviewer-always-disable-user-input.sh --no-devices &
```

This scripts is just watching for a TeamViewer sessions and executes another script `teamviewer-disable-user-input.sh` which does the trick.

Also it is possible to disable input devices (e.g. mouse or keyboard) together with monitors by passing device IDs to the script.

When TeamViewer session ends the script [locks user](https://www.jwz.org/xscreensaver/man1.html).

Just in case there is a script `teamviewer-recover-devices.sh` which recovers monitors and input devices if something went wrong.
