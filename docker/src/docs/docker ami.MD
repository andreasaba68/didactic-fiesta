
# OS and Version
~ $ ls /etc/*rel*
/etc/alpine-release  /etc/os-release

~ $ cat /etc/os-release
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.6.3
PRETTY_NAME="Alpine Linux v3.6"
HOME_URL="http://alpinelinux.org"
BUG_REPORT_URL="http://bugs.alpinelinux.org"

~ $ cat /etc/alpine-release
3.6.3

# FileSystem (about 20 GB)
~ $ df -h
Filesystem                Size      Used Available Use% Mounted on
overlay                  19.7G   1016.7M     17.7G   5% /
shm                      64.0M         0     64.0M   0% /dev/shm
tmpfs                    64.0M         0     64.0M   0% /dev
tmpfs                   495.4M         0    495.4M   0% /sys/fs/cgroup
tmpfs                    99.1M    368.0K     98.7M   0% /var/run/docker.sock
tmpfs                   495.4M    219.2M    276.1M  44% /etc/group
tmpfs                   495.4M    219.2M    276.1M  44% /etc/shadow
tmpfs                   495.4M    219.2M    276.1M  44% /home/docker
tmpfs                   495.4M    219.2M    276.1M  44% /etc/passwd
tmpfs                   495.4M    219.2M    276.1M  44% /usr/bin/docker
tmpfs                   495.4M         0    495.4M   0% /proc/acpi
tmpfs                    64.0M         0     64.0M   0% /proc/kcore
tmpfs                    64.0M         0     64.0M   0% /proc/keys
tmpfs                    64.0M         0     64.0M   0% /proc/timer_list
tmpfs                    64.0M         0     64.0M   0% /proc/sched_debug
tmpfs                   495.4M         0    495.4M   0% /proc/scsi
tmpfs                   495.4M         0    495.4M   0% /sys/firmware

/dev/xvdb1               19.7G   1016.7M     17.7G   5% /etc/ssh
/dev/xvdb1               19.7G   1016.7M     17.7G   5% /etc/hosts
/dev/xvdb1               19.7G   1016.7M     17.7G   5% /etc/hostname
/dev/xvdb1               19.7G   1016.7M     17.7G   5% /etc/resolv.conf
/dev/xvdb1               19.7G   1016.7M     17.7G   5% /var/log
/dev/xvdb1               19.7G   1016.7M     17.7G   5% /var/etc/docker

===
1) Choose a pure alpine latest contaier
2) open an interactive session and see what's in (particularly in terms of repositories)
docker container run -it alpine:3.9.3
vi /etc/apk/repositories
3) [better not to]can I use my containers jdk / maven [/ git] and install those in my containers ?

~ $ apk info -vv | grep 'j'
java-cacerts-1.0-r0 - Script to update java cacerts store
openjdk8-jre-lib-8.201.08-r0 - OpenJDK 8 Java Runtime (class libraries)
java-common-0.1-r0 - Java common (updates java links)
openjdk8-jre-base-8.201.08-r0 - OpenJDK 8 Java Runtime (no GUI support)
openjdk8-jre-8.201.08-r0 - OpenJDK 8 Java Runtime
maven-3.3.9-r1 - A Java project management and project comprehension tool.

openjdk9-jre-headless-9.0.4_p12-r0 - Oracle OpenJDK 9 (JRE headless)
openjdk9-jre-9.0.4_p12-r0 - Oracle OpenJDK 9 (JRE)
openjdk9-jdk-9.0.4_p12-r0 - Oracle OpenJDK 9 (JDK)


jq-1.5-r4 - A lightweight and flexible command-line JSON processor
java-common-0.1-r0 - Java common (updates java links)
java-cacerts-1.0-r0 - Script to update java cacerts store
libelf-0.8.13-r3 - libelf is a free ELF object file access library
openjdk9-jre-headless-9.0.4_p12-r0 - Oracle OpenJDK 9 (JRE headless)
libjpeg-turbo-2.0.2-r0 - Accelerated baseline JPEG compression and decompression library
openjdk9-jre-9.0.4_p12-r0 - Oracle OpenJDK 9 (JRE)
openjdk9-jdk-9.0.4_p12-r0 - Oracle OpenJDK 9 (JDK)





mkdir ../helloworld9
cd ../helloworld9/

vi ./Dockerfile
-------- THIS TEST CAN'T WORK AS ONLY INSTALLED THE JRE WHERE JSHELL DOESN'T (OBVIOUSLY) BELONG TO
FROM alpinejava:latest

CMD ["jshell", "-J-XX:+UnlockExperimentalVMOptions", \
               "-J-XX:+UseCGroupMemoryLimitForHeap", \
               "-R-XX:+UnlockExperimentalVMOptions", \
               "-R-XX:+UseCGroupMemoryLimitForHeap"]

--------

docker build --tag=alpinejavatest .
docker run alpinejavatest











musl-1.1.16-r14 - the musl c library (libc) implementation
busybox-1.26.2-r11 - Size optimized toolbox of many common UNIX utilities
alpine-baselayout-3.0.4-r0 - Alpine base dir structure and init scripts
alpine-keys-2.1-r1 - Public keys for Alpine Linux packages
libressl2.5-libcrypto-2.5.5-r2 - libressl libcrypto library
libressl2.5-libssl-2.5.5-r2 - libressl libssl library
libressl2.5-libtls-2.5.5-r2 - libressl libtls library
ssl_client-1.26.2-r11 - EXternal ssl_client for busybox wget
zlib-1.2.11-r0 - A compression/decompression Library
apk-tools-2.7.6-r0 - Alpine Package Keeper - package manager for alpine
scanelf-1.2.2-r0 - Scan ELF binaries for stuff
musl-utils-1.1.16-r14 - the musl c library (libc) implementation
libc-utils-0.7.1-r0 - Meta package to pull in correct libc
ncurses-terminfo-base-6.0_p20171125-r1 - Descriptions of common terminals
ncurses-terminfo-6.0_p20171125-r1 - Console display library
ncurses-libs-6.0_p20171125-r1 - Ncurses libraries
readline-6.3.008-r5 - GNU readline library
bash-4.3.48-r1 - The GNU Bourne Again shell
ca-certificates-20161130-r2 - Common CA certificates PEM files
libssh2-1.8.0-r1 - library for accessing ssh1/ssh2 protocol servers
libcurl-7.61.1-r1 - The multiprotocol file transfer library
curl-7.61.1-r1 - URL retrival utility and library
oniguruma-6.3.0-r0 - a regular expressions library
jq-1.5-r4 - A lightweight and flexible command-line JSON processor
openssh-keygen-7.5_p1-r3 - ssh helper program for generating keys
openssh-client-7.5_p1-r3 - OpenBSD's SSH client
openssh-sftp-server-7.5_p1-r3 - ssh sftp server module
openssh-server-7.5_p1-r3 - OpenSSH server
openssh-7.5_p1-r3 - Port of OpenBSD's free SSH release
sudo-1.8.19_p2-r0 - Give certain users the ability to run some commands as root
glibc-2.23-r3 - GNU C Library compatibility layer
glibc-compat-0 - virtual meta package
java-common-0.1-r0 - Java common (updates java links)
libffi-3.2.1-r6 - A portable, high level programming interface to various calling conventions.
p11-kit-0.23.15-r0 - Library for loading and sharing PKCS#11 modules
libtasn1-4.13-r0 - The ASN.1 library used in GNUTLS
p11-kit-trust-0.23.15-r0 - System trust module from p11-kit
java-cacerts-1.0-r0 - Script to update java cacerts store
libelf-0.8.13-r3 - libelf is a free ELF object file access library
openjdk9-jre-headless-9.0.4_p12-r0 - Oracle OpenJDK 9 (JRE headless)
libxau-1.0.9-r0 - X11 authorisation library
libbsd-0.8.3-r3 - commonly-used BSD functions not implemented by all libcs
libxdmcp-1.1.3-r0 - X11 Display Manager Control Protocol library
libxcb-1.13.1-r0 - X11 client-side library
libx11-1.6.7-r0 - X11 client-side library
libxext-1.3.3-r3 - X11 miscellaneous extensions library
libxi-1.7.9-r2 - X11 Input extension library
libxrender-0.9.10-r3 - X Rendering Extension client library
libxtst-1.2.3-r2 - X11 Testing -- Resource extension library
alsa-lib-1.1.8-r0 - Advanced Linux Sound Architecture (ALSA) library
libbz2-1.0.6-r6 - Shared library for bz2
libpng-1.6.35-r0 - Portable Network Graphics library
freetype-2.10.0-r0 - TrueType font rendering library
giflib-5.1.4-r2 - A library for reading and writing GIF images
libjpeg-turbo-2.0.2-r0 - Accelerated baseline JPEG compression and decompression library
lcms2-2.9-r1 - Color Management Engine
openjdk9-jre-9.0.4_p12-r0 - Oracle OpenJDK 9 (JRE)
openjdk9-jdk-9.0.4_p12-r0 - Oracle OpenJDK 9 (JDK)
expat-2.2.6-r0 - An XML Parser library written in C
pcre2-10.33-r0 - Perl-compatible regular expression library
git-2.21.0-r1 - Distributed version control system
~/didactic-fiesta/docker/src/docker $
