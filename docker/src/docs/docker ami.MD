
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
tmpfs                    64.0M         0     64.0M   0% /dev
tmpfs                   495.4M         0    495.4M   0% /sys/fs/cgroup
shm                      64.0M         0     64.0M   0% /dev/shm
/dev/xvdb1               19.7G   1016.7M     17.7G   5% /var/log
tmpfs                   495.4M    219.2M    276.1M  44% /etc/group
tmpfs                   495.4M    219.2M    276.1M  44% /etc/shadow
/dev/xvdb1               19.7G   1016.7M     17.7G   5% /etc/ssh
tmpfs                   495.4M    219.2M    276.1M  44% /home/docker
tmpfs                   495.4M    219.2M    276.1M  44% /etc/passwd
/dev/xvdb1               19.7G   1016.7M     17.7G   5% /etc/hosts
/dev/xvdb1               19.7G   1016.7M     17.7G   5% /etc/hostname
/dev/xvdb1               19.7G   1016.7M     17.7G   5% /etc/resolv.conf
tmpfs                    99.1M    368.0K     98.7M   0% /var/run/docker.sock
/dev/xvdb1               19.7G   1016.7M     17.7G   5% /var/etc/docker
tmpfs                   495.4M    219.2M    276.1M  44% /usr/bin/docker
tmpfs                   495.4M         0    495.4M   0% /proc/acpi
tmpfs                    64.0M         0     64.0M   0% /proc/kcore
tmpfs                    64.0M         0     64.0M   0% /proc/keys
tmpfs                    64.0M         0     64.0M   0% /proc/timer_list
tmpfs                    64.0M         0     64.0M   0% /proc/sched_debug
tmpfs                   495.4M         0    495.4M   0% /proc/scsi
tmpfs                   495.4M         0    495.4M   0% /sys/firmware

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






