#!/bin/bash
LBHOME="/opt/loxberry"

# LoxBerry Home Directory in Environment

awk -v s="LBHOMEDIR=$LBHOME" '/^LBHOMEDIR=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment

# Main directories for plugins

awk -v s="LBPCGI=$LBHOME/webfrontend/cgi/plugins" '/^LBPCGI=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment
awk -v s="LBPHTML=$LBHOME/webfrontend/html/plugins" '/^LBPHTML=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment
awk -v s="LBPTEMPL=$LBHOME/templates/plugins" '/^LBPTEMPL=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment
awk -v s="LBPDATA=$LBHOME/data/plugins" '/^LBPDATA=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment
awk -v s="LBPLOG=$LBHOME/log/plugins" '/^LBPLOG=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment
awk -v s="LBPCONFIG=$LBHOME/config/plugins" '/^LBPCONFIG=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment

#echo LBPCGI=$LBHOME/webfrontend/cgi/plugins >> /etc/environment
#echo LBPHTML=$LBHOME/webfrontend/html/plugins >> /etc/environment
#echo LBPTEMPL=$LBHOME/templates/plugins >> /etc/environment
#echo LBPDATA=$LBHOME/data/plugins >> /etc/environment
#echo LBPLOG=$LBHOME/log/plugins >> /etc/environment
#echo LBPCONFIG=$LBHOME/config/plugins >> /etc/environment

# Main directories for system

awk -v s="LBSCGI=$LBHOME/webfrontend/cgi/system" '/^LBSCGI=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment
awk -v s="LBSHTML=$LBHOME/webfrontend/html/system" '/^LBSHTML=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment
awk -v s="LBSTEMPL=$LBHOME/templates/system" '/^LBSTEMPL=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment
awk -v s="LBSDATA=$LBHOME/data/system" '/^LBSDATA=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment
awk -v s="LBSLOG=$LBHOME/log/system" '/^LBSLOG=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment
awk -v s="LBSCONFIG=$LBHOME/config/system" '/^LBSCONFIG=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment

# echo LBSCGI=$LBHOME/webfrontend/cgi/system >> /etc/environment
# echo LBSHTML=$LBHOME/webfrontend/html/system >> /etc/environment
# echo LBSTEMPL=$LBHOME/templates/system >> /etc/environment
# echo LBSDATA=$LBHOME/data/system >> /etc/environment
# echo LBSLOG=$LBHOME/log/system >> /etc/environment
# echo LBSCONFIG=$LBHOME/config/system >> /etc/environment

# Set Perl library path for LoxBerry Modules
awk -v s="PERL5LIB=$LBHOME/libs/perllib" '/^PERL5LIB=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/environment
# echo PERL5LIB=$LBHOME/libs/perllib  >> /etc/environment

# LoxBerry global environment variables in Apache
ENVVARS=$LBHOME/system/apache2/envvars

# echo '' >> $ENVVARS
# echo '## LoxBerry global environment variables' >> $ENVVARS
# echo export LBHOMEDIR=$LBHOMEDIR >> $ENVVARS

# echo export LBPCGI=$LBPCGI >> $ENVVARS
# echo export LBPHTML=$LBPHTML >> $ENVVARS
# echo export LBPTEMPL=$LBPTEMPL >> $ENVVARS
# echo export LBPDATA=$LBPDATA >> $ENVVARS
# echo export LBPLOG=$LBPLOG >> $ENVVARS
# echo export LBPCONFIG=$LBPCONFIG >> $ENVVARS
# echo '' >> $ENVVARS
# echo export LBSCGI=$LBSCGI >> $ENVVARS
# echo export LBSHTML=$LBSHTML >> $ENVVARS
# echo export LBSTEMPL=$LBSTEMPL >> $ENVVARS
# echo export LBSDATA=$LBSDATA >> $ENVVARS
# echo export LBSLOG=$LBSLOG >> $ENVVARS
# echo export LBSCONFIG=$LBSCONFIG >> $ENVVARS

awk -v s="## LoxBerry global environment variables" '/^## LoxBerry global environment variables/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS
awk -v s="export LBHOMEDIR=$LBHOMEDIR" '/^export LBHOMEDIR=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS

awk -v s="export LBPCGI=$LBPCGI" '/^export LBPCGI=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS
awk -v s="export LBPHTML=$LBPHTML" '/^export LBPHTML=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS
awk -v s="export LBPTEMPL=$LBPTEMPL" '/^export LBPTEMPL=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS
awk -v s="export LBPDATA=$LBPDATA" '/^export LBPDATA=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS
awk -v s="export LBPLOG=$LBPLOG" '/^export LBPLOG=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS
awk -v s="export LBPCONFIG=$LBPCONFIG" '/^export LBPCONFIG=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS

awk -v s="export LBSCGI=$LBSCGI" '/^export LBSCGI=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS
awk -v s="export LBSHTML=$LBSHTML" '/^export LBSHTML=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS
awk -v s="export LBSTEMPL=$LBSTEMPL" '/^export LBSTEMPL=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS
awk -v s="export LBSDATA=$LBSDATA" '/^export LBSDATA=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS
awk -v s="export LBSLOG=$LBSLOG" '/^export LBSLOG=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS
awk -v s="export LBSCONFIG=$LBSCONFIG" '/^export LBSCONFIG=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' $ENVVARS

# Set PHP include_path directive
awk -v s="include_path=\".:$LBHOME/libs/phplib\"" '/^include_path=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/php/7.0/apache2/conf.d/20-loxberry.ini
awk -v s="include_path=\".:$LBHOME/libs/phplib\"" '/^include_path=/{$0=s;f=1} {a[++n]=$0} END{if(!f)a[++n]=s;for(i=1;i<=n;i++)print a[i]>ARGV[1]}' /etc/php/7.0/cli/conf.d/20-loxberry.ini

# echo include_path=\".:$LBHOME/libs/phplib\" > /etc/php/7.0/apache2/conf.d/20-loxberry.ini
# echo include_path=\".:$LBHOME/libs/phplib\" > /etc/php/7.0/cli/conf.d/20-loxberry.ini