-- *Slide* --

# Welcome to the Introduction to Spartan HPC Course

About your trainer:

* Lev Lafayette has worked as an HPC sysadmin for since 2007, first at the Victorian Partnership for Advanced Computing, now at the University of Melbourne. Has worked in IT since 1999.
* Has taught approximately 150 day-long classes at 17 different research institutions across Australia since 2012.
* Collects degrees for fun and profit. Actually doesn't have a Computer Science degree - but does have a postgraduate degee in Adult and Tertiary Education.
* Sometimes talks about himself in the third person, especially when writing introductory blurbs.
* Stalk me at: http://levlafayette.com/ or https://www.linkedin.com/in/levlafayette

-- *Slide End* --

-- *Slide* --

# Goals for today

To become familiar with the new Spartan HPC/Cloud hybrid system by:

* Part 1: Learning about supercomputers and Spartan.
* Part 2: Logging on an exploring the Linux Environment.
* Part 3: Learning about Environment Modules.
* Part 4: Learning about the SLURM job submission system.
* Part 5: Submitting test jobs.

-- *Slide End* --

-- *Slide* --

## Part 1: About Supercomputers and their Friends

* "Supercomputer" means any single computer system that has exceptional processing power for its time. One metric is the number of floating­point operations per second (FLOPS) such a system can carry out.
* High Performance Computer (HPC) is any computer system whose architecture allows for above average performance.
* Clustered computing is when two or more computers serve a single resource. This improves 
performance and provides redundancy in case of failure system. Typically commodity systems with a high-speed local network.
* Scientific computing is the software applications used by the scientific community to aid research. Does not necessarily equate with high performance computing, or the use of clusters ­ it is whatever scientists use and do. 

-- *Slide End* --

-- *Slide* --

## Part 1: Parallel Computing and Parallel Programming

* Cluster computing with data parallelism: The horse and cart example.
* With a cluster architecture, applications can be more easily parallelised across them. Parallel computing refers to the submission of jobs or processes over multiple processors and by splitting up the data or tasks between them.
* Further examples of serial versus parallel; random number generation, driving a car. 
* Some applications have included weather forecasting, aerodynamic design, fluid mechanics, radiation modelling, molecullar dynamics, CGI rendering for popular movies. Reality is a parallel system!

-- *Slide End* --

-- *Slide* --

## Part 1: Generic HPC Cluster Design

<img src="http://levlafayette.com/files/genericcluster.png" />

-- *Slide End* --


-- *Slide* --

## Part 1: What's Different About Spartan?

* University desired a 'more unified experience to access compute services'. A review was conducted looking at the infrastructure and metrics of Edward, the University's general HPC system since 2011.
* Edward's usage statistics show that single-core and low memory jobs dominate; 76.35% of jobs from Feb 9 2015 to Feb 9 2016 were single core, and 96.83% used 1-4GB of memory.
* Recommended solution is to make use of existing NeCTAR Research cloud with an expansion of general cloud compute provisioning and use of a smaller "true HPC" system on bare metal nodes.
* Matches Sparta's citenzship structure; the few Spartiate citizens are bare metal HPC, the more numerous Perioeci free inhabitants are vHPC nodes, and the many Helot slaves are elastic compute nodes.
* Spartan is not "HPC in the Cloud", it's a chimera: an HPC/Cloud Hybrid.

-- *Slide End* --

-- *Slide* --
## Part 1: Spartan HPC/Cloud Hybrid Design

<img src="http://levlafayette.com/files/spartanlayout.png" />

-- *Slide End* --

-- *Slide* --
## Part I: Logging in and Help

* To log on to a HPC system, you will need a user account and password and a Secure Shell (ssh) client. Linux distributions almost always include SSH as part of the default installation as does 
Mac OS 10.x. For MS-­Windows users, the free PuTTY client is recommended (http://putty.org). 
* To transfer files use scp, WinSCP, Filezilla, or rsync.
* Logins to Spartan are based on University Active Directory credentials.
* If a user has problems with submitting a job, needs a new application or extension to an existing application installed, if their submissions are generated unexpected errors etc., an email can be sent to: hpc­support@unimelb.edu.au

<pre>ssh your­unimelb­email@spartan.hpc.unimelb.edu.au</pre>
or
<pre>ssh 'your­unimelb­email'@spartan.hpc.unimelb.edu.au</pre>
or
<pre>ssh UNIMELB\\yourUniID@spartan.hpc.unimelb.edu</pre>

-- *Slide End* --

-- *Slide* --
## Part 2: This is a GNU/Linux World 

* In November 2015 of the Top 500 Supercomputers worldwide, every single machine used a  "UNIX­like" operating system; 98.8% used Linux, 1.2% used AIX.
* The command­line interface provides a great deal more power and is very resource efficient. 
* GNU/Linux scales and does so with stability and efficiency.
* Critical software such as the Message Parsing Interface (MPI) and nearly all scientific programs are designed to work with GNU/Linux. 
* The operating system and many applications are provided as "free and open source" whiich are better placed to improve, optimize and maintain. 

-- *Slide End* --

-- *Slide* --
## Part 2: Exploring The Environment


* When a user logs in on a Linux or other UNIX-like system on the command line, they start in their home directory (``/home/<<username>>``). 
* "Everything in the UNIX system is a file" (Kernighan and Pike, 1984, p41) - which means that files, directories, and any input-output resources (disks, keyboard, memory, etc) are treated as a stream of bytes through the filesystem.

The following are basic Linux environment commands to test.

| Command     | Explanation                                                                |
|-------------|:--------------------------------------------------------------------------:|
|``whoami``   | "Who Am I?; prints the effective user id.                                  |
|``pwd``      | "Print working directory";  prints the directory where you're currently in.|
|``ls``       | Directory listing                                                          |	

Linux commands often come with options expressed as:
``<command> --<option[s]>``

| Command     | Explanation                                                                |
|-------------|:--------------------------------------------------------------------------:|
|``ls -lart`` | Directory listing with options (long, all, reverse time)                   |


-- *Slide End* --

-- *Slide* --
## Part 2: The Online Manual

* Linux commands come with "man" (manual) pages, which provide a terse description of the meaning and options available to a command. A more verbose alternative to man with a simple hypertext system is info. 

| Command     | Explanation                                                                |
|-------------|:--------------------------------------------------------------------------:|
|``man ls``             | Display the manual entry for the command "ls"                    |
|``apropos <command>``  | Search for a particular command. Equivalent to "man -k <command>"|
|``info <command>``     | A verbose description of the command                             |

-- *Slide End* --

-- *Slide* --
## Part 2: Pipes and Redirects

* Linux also have very useful 'pipes' and redirect commands. To pipe one command through another use the '|' symbol.

| Command           | Explanation                                                          |
|-------------------|:--------------------------------------------------------------------:|
| ``who -u | less`` | "Who" shows who is logged on and how long they've been idle.         |
| ``ps afux | less``| "ps" provides a list of current processes.                           |


* To redirect output use the '>' symbol. To redirect input (for example, to feed data to a command) use the '<'. Concatenation is achieved through the use of '>>' symbol. 

| Command           | Explanation                                                          |
|-------------------|:--------------------------------------------------------------------:|
| ``w > list.txt``  | 'w' is a combination of who, uptime and ps -a, redirected            |
| ``w >> list.txt`` | Same command, concatenated                                           |

-- *Slide End* --

-- *Slide* --
## Part 2: Files and Text Editing

* Linux filenames can be constructed of any characters except the forward slash, which is for directory navigation. However it is best to avoid punctuation marks, non-printing characters (e.g., spaces). It is better to use underscores or CamelCase instead of spaces.
* Linux is case-sensitive with its filenames (e.g., list.txt, LIST.txt lisT.txT are different).
* Files do not usually require a program association suffix, although you may find this convenient (a C compiler like files to have .c in their suffix, for example). 
* The type of file can be determined with the ``file`` command. The type returned will usually be text, executable binaries, archives, or a catch-all "data" file.
* There are three text editors usually available on Linux systems on the command-line. The first is ``nano``; easy to use, limited functionality. The others (both from 1976) are ``vi`` (or ``vim``), which is terse but powerful, or ``emacs`` (Editor Macros) editor and environment is a feature-rich application,

-- *Slide End* --

-- *Slide* --
## Part 2: Copying and Transferring Files on Local Systems

* To get a copy of the files from an external source to your home directory, you will probably want to use ``wget`` or ``git``. 

| Command           | Explanation                                                          |
|-------------------|:--------------------------------------------------------------------:|
| ``wget URL``      | Non-interactive download of files over http, https, ftp etc.         |
| ``git clone URL`` | Clone a repository into a new directory.                                        |

* To copy a file from within a system use the ``cp`` command. Common options include ``-r`` to copy and entire directory
 
| Command           | Explanation                                                          |
|-------------------|:--------------------------------------------------------------------:|
| ``cp source destination``      | Copy a file from source to destination         |
| ``cp -r source destination`` | Recursive copy (e.g., a directory) from source to destination                                        |
| ``cp -a source destination`` | Recursive copy as archive (with permissions, links)                                        |


-- *Slide End* --

-- *Slide* --
## Part 2: Copying and Transferring Files Between Systems

* To copy files to between systems desktop use SCP (secure copy protocol) or SFTP (secure file transfer protocol), combining the ssh and cp functionality. The ``cp`` options can also be used. The source or destination address should also require a remote shell login. For example; ``scp -r testdir llafayette@unimelb.edu.au@spartan.hpc.unimelb.edu.au:`` Note the colon at the end!

| Command           | Explanation                                                          |
|-------------------|:--------------------------------------------------------------------:|
| ``scp source.address:/path/ destination.address:/path/``| Secure copy with paths |

-- *Slide End* --
-- *Slide* --

## Synchronising Files and Directories

* The ``rsync`` utility provides a way to keep two collections of files "in sync". The nice feature of rsync is that it is very fast - after the initial run - and versatile. The reason for its speed is that it tracks changes. The source or destination address should also require a remote shell login. For example; ``rsync -avz testdir llafayette@unimelb.edu.au@spartan.hpc.unimelb.edu.au:``

| Command           | Explanation                                                          |
|-------------------|:--------------------------------------------------------------------:|
| ``rsync source destination``| General rsync command; however there are numerous options  |
| ``rsync -avze ssh username@remotemachine:/path/to/source .`` | With ssh encryption |

* The ``rsync -avz`` command ensures that it is in archive mode (recursive, copies symlinks, preserves permissions), is verbose, and compresses on transmission. 
* Note that rsync is "trailing slash sensitive". A trailing / on a source means "copy the contents of this directory". Without a trailing slash it means "copy the directory".

* Rsync can be used in a synchronise mode with the --delete flag. This will delete anything in the destination that is not in source directory. Handle with care! Consider running rsync with the ``-n`` or ``--dry-run`` option to see what it will do first, before running the command for real.

| Command           | Explanation                                                          |
|-------------------|:--------------------------------------------------------------------:|
| ``rsync -avz --delete source/ username@remotemachine:/path/to/destination| Synchronise source and destination  |
-- *Slide End* --

-- *Slide* --



