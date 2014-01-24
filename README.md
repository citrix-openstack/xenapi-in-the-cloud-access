# xenapi-in-the-cloud-access

Scripts to access a clouded xenapi hypervisor, and its guests

# Set your IP address

    ./set_host.sh <public ip>

This will generate the `vncviewer` executable, and an ssh configuration file
`ssh_config`.

## Access domU

    ssh -F ssh_config domu

## Access dom0

    ssh -F ssh_config domzero

## Access a guest's console

    ./vncviewer 2
