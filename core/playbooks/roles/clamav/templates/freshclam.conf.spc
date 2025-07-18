##### Adding by SPC v{{ version_spc }}
##### secured-pc ##### auteur: L. Delatte, 2024

##
## freshclam.conf - automatically generated by clamconf 1.0.5
##

# Maximum size of the log file.
# Value of 0 disables the limit.
# You may use 'M' or 'm' for megabytes (1M = 1m = 1048576 bytes)
# and 'K' or 'k' for kilobytes (1K = 1k = 1024 bytes). To specify the size
# in bytes just don't use modifiers.
# Default: 1048576
#LogFileMaxSize 5M
LogFileMaxSize 1M

# Log time with each message.
# Default: no
#LogTime yes

# Use the system logger (can work together with LogFile).
# Default: no
#LogSyslog yes
LogSyslog yes

# Type of syslog messages.
# Please refer to 'man syslog' for the facility names.
# Default: LOG_LOCAL6
#LogFacility LOG_MAIL

# Enable verbose logging.
# Default: no
#LogVerbose yes

# Rotate log file. Requires LogFileMaxSize option set prior to this option.
# Default: no
#LogRotate yes
LogRotate yes

# Save the process ID to a file.
# Default: disabled
#PidFile /var/run/clam.pid

# This option allows you to change the default database directory.
# If you enable it, please make sure it points to the same directory in
# both clamd and freshclam.
# Default: /var/lib/clamav
#DatabaseDirectory /var/lib/clamav

# Don't fork into background.
# Default: no
#Foreground no

# Enable debug messages in libclamav.
# Default: no
#Debug no

# Save all reports to a log file.
# Default: disabled
#UpdateLogFile /var/log/freshclam.log

# When started by root freshclam will drop privileges and switch to the user
# defined in this option.
# Default: clamupdate
#DatabaseOwner clamupdate

# This option defined how many times daily freshclam should check for
# a database update.
# Default: 12
#Checks 24

# Use DNS to verify the virus database version. FreshClam uses DNS TXT records
# to verify the versions of the database and software itself. With this
# directive you can change the database verification domain.
# WARNING: Please don't change it unless you're configuring freshclam to use
# your own database verification domain.
# Default: current.cvd.clamav.net
#DNSDatabaseInfo current.cvd.clamav.net

# DatabaseMirror specifies to which mirror(s) freshclam should connect.
# You should have at least one entry: database.clamav.net.
# Default: disabled
#DatabaseMirror database.clamav.net

# This option allows you to easily point freshclam to private mirrors.
# If PrivateMirror is set, freshclam does not attempt to use DNS
# to determine whether its databases are out-of-date, instead it will
# use the If-Modified-Since request or directly check the headers of the
# remote database files. For each database, freshclam first attempts
# to download the CLD file. If that fails, it tries to download the
# CVD file. This option overrides DatabaseMirror, DNSDatabaseInfo
# and Scripted Updates. It can be used multiple times to provide
# fall-back mirrors.
# Default: disabled
#PrivateMirror mirror1.mynetwork.com
#PrivateMirror mirror2.mynetwork.com

# This option defines how many attempts freshclam should make before giving up.
# Default: 3
#MaxAttempts 5

# With this option you can control scripted updates. It's highly recommended to keep them enabled.
# Default: yes
#ScriptedUpdates yes

# With this option enabled, freshclam will attempt to load new
# databases into memory to make sure they are properly handled
# by libclamav before replacing the old ones. Tip: This feature uses a lot of RAM. If your system has limited RAM and you are actively running ClamD or ClamScan during the update, then you may need to set `TestDatabases no`.
# Default: yes
#TestDatabases yes

# By default freshclam will keep the local databases (.cld) uncompressed to
# make their handling faster. With this option you can enable the compression.
# The change will take effect with the next database update.
# Default: no
#CompressLocalDatabase 

# Include an optional signature databases (opt-in). This option can be used multiple times.
# Default: disabled
#ExtraDatabase dbname1
#ExtraDatabase dbname2

# Exclude a standard signature database (opt-out). This option can be used multiple times.
# Default: disabled
#ExcludeDatabase dbname1
#ExcludeDatabase dbname2

# With this option you can provide custom sources (http:// or file://) for database files.
# This option can be used multiple times.
# Default: disabled
#DatabaseCustomURL http://myserver.com/mysigs.ndb
#DatabaseCustomURL file:///mnt/nfs/local.hdb

# If you're behind a proxy, please enter its address here.
# Default: disabled
#HTTPProxyServer your-proxy

# HTTP proxy's port
# Default: disabled
#HTTPProxyPort 8080

# A user name for the HTTP proxy authentication.
# Default: disabled
#HTTPProxyUsername username

# A password for the HTTP proxy authentication.
# Default: disabled
#HTTPProxyPassword pass

# If your servers are behind a firewall/proxy which does a User-Agent
# filtering you can use this option to force the use of a different
# User-Agent header.
# Default: disabled
#HTTPUserAgent default

# Send the RELOAD command to clamd after a successful update.
# Default: /etc/clamd.d/scan.conf
#NotifyClamd yes

# Run a command after a successful database update. Use EXIT_1 to return 1 after successful database update.
# Default: disabled
#OnUpdateExecute command

# Run a command when a database update error occurs.
# Default: disabled
#OnErrorExecute command

# Run a command when freshclam reports an outdated version.
# In the command string %v will be replaced with the new version number.
# Default: disabled
#OnOutdatedExecute command

# With this option you can provide a client address for the database downloading.
# Useful for multi-homed systems.
# Default: disabled
#LocalIPAddress aaa.bbb.ccc.ddd

# Timeout in seconds when connecting to database server.
# Default: 30
#ConnectTimeout 30

# Timeout in seconds when reading from database server. 0 means no timeout.
# Default: 60
#ReceiveTimeout 60

# This option enables downloading of bytecode.cvd, which includes additional
# detection mechanisms and improvements to the ClamAV engine.
# Default: yes
#Bytecode yes

##### Added by SPC v{{ version_spc }}
