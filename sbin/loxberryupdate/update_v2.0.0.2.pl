#!/usr/bin/perl

# Input parameters from loxberryupdate.pl:
# 	release: the final version update is going to (not the version of the script)
#   logfilename: The filename of LoxBerry::Log where the script can append
#   updatedir: The directory where the update resides
#   cron: If 1, the update was triggered automatically by cron

use LoxBerry::Update;
#use LoxBerry::JSON;

init();

#
# Aktivating Root access via ssh with Key (password still forbidden)
#
LOGINF "Activating Root access via ssh with key authentication (paswword auth still forbidden).";
system ("/bin/sed -i 's:^PermitRootLogin:#PermitRootLogin:g' /etc/ssh/sshd_config");
system ("echo 'PermitRootLogin prohibit-password' >> /etc/ssh/sshd_config");
system ("/bin/sed -i 's:^:PubkeyAuthentication:#PubkeyAuthentication:g' /etc/ssh/sshd_config");
system ("echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config");

LOGINF "Installing new sudoers file...";
copy_to_loxberry("/system/sudoers/lbdefaults", "root");

LOGINF "Installing new daemon for remote support...";
copy_to_loxberry("/system/daemons/system/04-remotesupport", "root");

## If this script needs a reboot, a reboot.required file will be created or appended
#LOGWARN "Update file $0 requests a reboot of LoxBerry. Please reboot your LoxBerry after the installation has finished.";
#reboot_required("LoxBerry Update requests a reboot.");

LOGOK "Update script $0 finished." if ($errors == 0);
LOGERR "Update script $0 finished with errors." if ($errors != 0);

# End of script
exit($errors);
