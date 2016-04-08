-- *Slide* --

### Welcome to the Introduction to Spartan HPC Course

About your trainer:

* Lev Lafayette has worked as an HPC sysadmin for since 2007, first at the Victorian Partnership for Advanced Computing, now at the University of Melbourne. Has worked in IT since 1999.
* Has taught approximately 150 day-long classes at 17 different research institutions across Australia since 2012.
* Collects degrees for fun. Profit is accidential. Doesn't actually have a computer ccience degree - but does have a postgraduate degee in Adult and Tertiary Education.
* Sometimes talks about himself in the third person, especially when writing introductory blurbs.
* Stalk me at: http://levlafayette.com/ or https://www.linkedin.com/in/levlafayette
* Some live notes for the day will be on https://etherpad.openstack.org/p/SpartanIntro
* A copy of the slides and same code is available at: https://github.com/UoM-ResPlat-DevOps/SpartanIntro

-- *Slide End* --

-- *Slide* --
### Goals for today

To become familiar with the new Spartan HPC/Cloud hybrid system by:

* Part 1: Learning about supercomputers and Spartan.
* Part 2: Logging on an exploring the Linux Environment.
* Part 3: Learning about Environment Modules and the SLURM job submission system.
* Part 4: Submitting test jobs.
* Part 5: TORQUE/Moab and SLURM Command Summaries

-- *Slide End* --

-- *Slide* --

### Part 1: About Supercomputers and their Friends

* "Supercomputer" means any single computer system that has exceptional processing power for its time. One metric is the number of floating­point operations per second (FLOPS) such a system can carry out.
* High Performance Computer (HPC) is any computer system whose architecture allows for above average performance.
* Clustered computing is when two or more computers serve a single resource. This improves 
performance and provides redundancy in case of failure system. Typically commodity systems with a high-speed local network.
* Scientific computing is the software applications used by the scientific community to aid research. Does not necessarily equate with high performance computing, or the use of clusters ­ it is whatever scientists use and do. 

-- *Slide End* --

-- *Slide* --

### Part 1: Parallel Computing and Parallel Programming

* Cluster computing with data parallelism: The horse and cart example.
* With a cluster architecture, applications can be more easily parallelised across them. Parallel computing refers to the submission of jobs or processes over multiple processors and by splitting up the data or tasks between them.
* Further examples of serial versus parallel; random number generation, driving a car. 
* Some applications have included weather forecasting, aerodynamic design, fluid mechanics, radiation modelling, molecullar dynamics, CGI rendering for popular movies. Reality is a parallel system!

-- *Slide End* --

-- *Slide* --

### Part 1: Generic HPC Cluster Design

<img src="https://github.com/UoM-ResPlat-DevOps/SpartanIntro/Images/geneiccluster.png" />

-- *Slide End* --


-- *Slide* --

### Part 1: What's Different About Spartan?

* University desired a 'more unified experience to access compute services'. A review was conducted looking at the infrastructure and metrics of Edward, the University's general HPC system since 2011.
* Edward's usage statistics show that single-core and low memory jobs dominate; 76.35% of jobs from Feb 9 2015 to Feb 9 2016 were single core, and 96.83% used 1-4GB of memory.
* Recommended solution is to make use of existing NeCTAR Research cloud with an expansion of general cloud compute provisioning and use of a smaller "true HPC" system on bare metal nodes.
* Matches Sparta's citenzship structure; the few Spartiate citizens are bare metal HPC, the more numerous Perioeci free inhabitants are vHPC nodes, and the many Helot slaves are elastic compute nodes.
* Spartan is not "HPC in the Cloud", it's a chimera: an HPC/Cloud Hybrid.

-- *Slide End* --

-- *Slide* --
### Part 1: Spartan HPC/Cloud Hybrid Design

<img src="http://levlafayette.com/files/spartanlayout.png" />

-- *Slide End* --

-- *Slide* --
### Part I: Logging in and Help

* To log on to a HPC system, you will need a user account and password and a Secure Shell (ssh) client. Linux distributions almost always include SSH as part of the default installation as does 
Mac OS 10.x. For MS-­Windows users, the free PuTTY client is recommended (http://putty.org). 
* To transfer files use scp, WinSCP, Filezilla (https://filezilla-project.org/), or rsync.
* Logins to Spartan are based on University Active Directory credentials.
* If a user has problems with submitting a job, needs a new application or extension to an existing application installed, if their submissions are generated unexpected errors etc., an email can be sent to: hpc­-support@unimelb.edu.au

``ssh your­unimelb­email@spartan.hpc.unimelb.edu.au`` or
``ssh 'your­unimelb­email'@spartan.hpc.unimelb.edu.au`` or
``ssh UNIMELB\\yourUniID@spartan.hpc.unimelb.edu`` e.g.,

``ssh llafayette@spartan.hpc.unimelb.edu.au``

* An ~/.ssh/config file on you device will make all this easier!

``Host spartan``
``        Hostname spartan.hpc.unimelb.edu.au``
``        User llafayette@unimelb.edu.au``

-- *Slide End* --

-- *Slide* --
### Part 2: This is a GNU/Linux World 

* In November 2015 of the Top 500 Supercomputers worldwide, every single machine used a  "UNIX­like" operating system; 98.8% used Linux, 1.2% used AIX.
* The command­line interface provides a great deal more power and is very resource efficient. 
* GNU/Linux scales and does so with stability and efficiency.
* Critical software such as the Message Parsing Interface (MPI) and nearly all scientific programs are designed to work with GNU/Linux. 
* The operating system and many applications are provided as "free and open source" whiich are better placed to improve, optimize and maintain. 

-- *Slide End* --

-- *Slide* --
### Part 2: Exploring The Environment


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
### Part 2: The Online Manual

* Linux commands come with "man" (manual) pages, which provide a terse description of the meaning and options available to a command. A more verbose alternative to man with a simple hypertext system is info. 

| Command     | Explanation                                                                |
|-------------|:--------------------------------------------------------------------------:|
|``man ls``             | Display the manual entry for the command "ls"                    |
|``apropos <command>``  | Search for a particular command. Equivalent to "man -k <command>"|
|``info <command>``     | A verbose description of the command                             |

-- *Slide End* --

-- *Slide* --
### Part 2: Pipes and Redirects

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
### Part 2: Files and Text Editing

* Linux filenames can be constructed of any characters except the forward slash, which is for directory navigation. However it is best to avoid punctuation marks, non-printing characters (e.g., spaces). It is better to use underscores or CamelCase instead of spaces.
* Linux is case-sensitive with its filenames (e.g., list.txt, LIST.txt lisT.txT are different).
* Files do not usually require a program association suffix, although you may find this convenient (a C compiler like files to have .c in their suffix, for example). 
* The type of file can be determined with the ``file`` command. The type returned will usually be text, executable binaries, archives, or a catch-all "data" file.
* There are three text editors usually available on Linux systems on the command-line. The first is ``nano``; easy to use, limited functionality. The others (both from 1976) are ``vi`` (or ``vim``), which is terse but powerful, or ``emacs`` (Editor Macros) editor and environment is a feature-rich application,

-- *Slide End* --

-- *Slide* --
### Part 2: Copying and Transferring Files on Local Systems

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
### Part 2: Copying and Transferring Files Between Systems

* To copy files to between systems desktop use SCP (secure copy protocol) or SFTP (secure file transfer protocol), combining the ssh and cp functionality. The ``cp`` options can also be used. The source or destination address should also require a remote shell login. For example; ``scp -r testdir llafayette@unimelb.edu.au@spartan.hpc.unimelb.edu.au:`` Note the colon at the end!

| Command           | Explanation                                                          |
|-------------------|:--------------------------------------------------------------------:|
| ``scp source.address:/path/ destination.address:/path/``| Secure copy with paths |

-- *Slide End* --
-- *Slide* --

### Part 2: Synchronising Files and Directories

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
### Part 2: Creating Directories, Moving Files


We are going to copy the file gattaca.txt from the supercomputer to the local machine. From the local machine enter the following command:

scp <username>@trifid.vpac.org:gattaca.txt .

Be sure to replace <username> with your username on the supercomputer (e.g., train01, train02, train03 etc). When the transfer is complete check on the local machine that the file has transferred with ls.

We know have gattaca.txt on the local computer. Let's add some new material to it before sending it back to the supercomputer. On the local computer enter:

nano gattaca.txt

Our next step will be to create a directory to put this file in and then move the file into that directory. The navigate to the directory and make sure that it is there. On the local computer enter:

mkdir braf
mv gattaca.txt braf/

Change to the braf directory and check the contents of the directory. The output should be the gatta.txt file from the ls command and /home/<user>/braf from the pwd command.


-- *Slide End* --

-- *Slide* --
### Part 2: File Differences

The next step will be to copy the directory and its contents from the local computer to the supercomputer. This uses the scp command again, but this time with the -r (recursive) option, which will copy the directory and all sub-directories and files within it. On the local computer enter the following commands:

cd ~
scp -r braf/ <username>@trifid.vpac.org:

Now on the supercomputer do a directory listing but specify the file you want and with the time option. You should see a gattaca.txt in your home directory (the original one) and a braf directory. Move into the braf directory and run a directory listing again with the same option. There should be another gattaca.txt file, the one you just moved, but you will notice it has a different timestamp.

ls -l gattaca.txt
cd braf
ls -l gattaca.txt

Sometimes you may wish to compare the content of files as well as when they were created. To do this use the diff command. This compares files line-by-line and prints the differences to the screen. As usual there are a number of options which can be ascertained from the command man diff, but for now we'll just use the basic command. The command uses brackets to indicate where additional material is located. To illustrate this, let's add some lines to the first list.txt file and then run the diff comparison.

Write out (Cntrl-O) and exit (Cntl-X) and run the diff command.

diff gattaca.txt braf/gattaca.txt

The output should be something like the following:

[lev@trifid ~]$ diff gattaca.txt braf/gattaca.txt
4c4
< ATVKSRWSGS HQFEQLSGSI LWMAPEVIRM QDKNPYSFQS DVYAFGIVLY
---
> ATEKSRWSGS HQFEQLSGSI LWMAPEVIRM QDKNPYSFQS DVYAFGIVLY

For a side-by-side representation use the command sdiff instead.

The diff command is often used by programmers to create a patch file between two programs. For example, if one wanted to a patch of braf/gattaca.txt to gattaca.txt one would generate the patch file like follows:

diff -u gattaca.txt braf/gattaca.txt > gattaca.patch

-- *Slide End* --

-- *Slide* --
### Part 2: Searches and Wildcards

Often you will want to search for files or search within files for a particular phrase. The find command, which will find files according to the directory and sub-directories offered, by name, modification time, size etc, and with filter operations, all of which are available through man find. To find all files with the suffix .txt on your supercomputer account use the following command:

``cd ~
find . -name '*.txt'``

Note that the filter is within quotes, to ensure that the command is not expanded due to the wildcard.

To search within a collection of files use the grep command. It originally an abbreviation of "global search for a regular expression and print to standard output". The command searches the named input files for lines containing a match to the given pattern, including regular expressions, and prints the matching lines. As usual there are a variety of options available through man grep. The following command will search for the pattern 'ATEKSRWSGS', ignoring case, within the directory braf. Enter the following on the supercomputer:

cd ~
grep -i ATEK braf/*

Note that the files being searched must be specified, even with a wildcard character. Simply stating a directory is insufficient. Where there are multiple results, grep will also display the filename. Compressed or gzipped files can be searched with zgrep.

The wildcard you see most often is * (asterisk), but we'll start with something simpler: ? (question mark). When it appears in a filename, the ? matches any single character. For example, letter? refers to any filename that begins with letter and has one character after that. This would include letterA, letter1, as well as filenames with a non-printing character as their last letter, like letter^C.

The * wildcard matches any character or group of zero or more characters. For example,``*.txt`` matches all files whose names end with .txt,``*.c`` matches all files whose names end with .c (by convention, source code for programs in the C language), and so on.

Wildcard
Matches
?
Any single character
*
Any group of zero or more characters
[ab]
Either a or b
[a-z]
any character between a and z, inclusive


-- *Slide End* --

-- *Slide* --
### Part 2: Deletions
Sometimes you'll want to remove files and directories from your account. Be very careful and very selective with this because when you're operating on the command line there's no "trashcan" to easily undelete files. Somewhere, delete really means what it says, and that somewhere is here.

On the supercomputer we'll carefully delete the file in the home directory and then change the directory to braf and delete the file there. We'll delete the file in that directory, change out of that directory and delete the directory.

cd ~
rm gattaca.txt
cd braf
rm gattaca.txt
cd ~
rmdir braf

Then on the local computer we'll use a shortcut; a command which deletes the entire directory, all sub-directories and all files within the directory tree. This is remove with the recursive and force options.

cd ~
rm -rf braf

Be very careful with rm, especially with the -rf option and especially with wildcards. Consider what would happen to someone who wishes to delete all their backup files in a directory with the helpful suffix .BAK. Choosing a wildcard and the suffix they intend to type rm ``*.BAK`` but instead, they mistype the command and type rm * .BAK. The result of this typing error is that they have just deleted everything in that directory. Worse still imagine a user running as root thinking that they are about to delete a directory and instead types rm -rf / ; a command that will delete everything or, more commonly rm -rf ./ ; a command which deletes the current directory and all sub-directories.

-- *Slide End* --

-- *Slide* --
### Part 2: Why The File Differences Mattered

BRAF is a human gene that makes a protein (imaginatively) named B-Raf. This protein is involved in sending signals inside cells, which are involved in directing cell growth. In 2002, it was shown to be faulty (mutated) in human cancers.

In particular the difference that between the two files "ATVKSRWSGS" and "ATEKSRWSGS" is the difference which leads to susceptibility to metastatic melanoma. Fortunately, because of high performance computing, massive databases, and molecular modelling applications, science has begun to develop specific inhibitors of mutated B-raf protein for anticancer treatments.


-- *Slide End* --

-- *Slide* --
### Part 3: Environment Modules 

* Environment modules provide for the dynamic modification of the user's environment via module files, such as the location of the application's executables, its manual path, the library path, and so forth
* Modulefiles also have the advantages of being shared on many users on a system (such as an HPC system) and easily allowing multiple installations of the same application but with different versions and compilation options.
* The are two implementations of environment modules. The classic modules system is available on the Edward HPC, and the newer Lmod is on Spartan. LMod is considered superior for hierarchies of modules.

-- *Slide End* --

-- *Slide* --
### Part 3: Module Commands

| Command                         | Explanation                                            |
|---------------------------------|:------------------------------------------------------:|
| ``module help``                 | List of switches, commands and arguments for modules   |
| ``module avail``                | Lists all the modules which are available to be loaded.|
| ``module display <modulefile>`` | Display paths etc for modulefile                       |
| ``module load <modulefile>``    | Loads paths etc to user's environment                  |
| ``module unload <modulefile>``  | Unloads paths etc from user's environment.             |
| ``module list``                 | lists all the modules currently loaded.                |


* There is also the ``module switch <modulefile1> <modulefile2>``, which unloads one modulefile (modulefile1) and loads another (modulefile2).
* On Spartan there is also the lmod-specific ``module spider <modulename``, which traverses through the system for modules not available for the user to load.

-- *Slide End* --

-- *Slide* --
### Part 3: Batch Job Submissions

* The Portable Batch System (or simply PBS) is a utility software that performs job scheduling by assigning unattended background tasks expressed as batch jobs, among the available resources.
* Originally developed by MRJ Technology Solutions under contract to NASA in the early 1990s. In 1998 the original version of PBS was released as an open-source product as OpenPBS. This was forked by Adaptive Computing (formally, Cluster Resources) who developed TORQUE (Terascale Open-source Resource and QUEue Manager). Many of the original engineering team and what commercial property of exists from the original product is now part of Altair Engineering who have their own version, PBSPro. TORQUE is used on the Edward HPC system.
* Slurm, used on Spartan, began development as a collaborative effort primarily by Lawrence Livermore National Laboratory, SchedMD, Linux NetworX, Hewlett-Packard, and Groupe Bull as a Free Software resource manager. As of November 2015, TOP500 list of most powerful computers in the world indicates that Slurm is the workload manager on six of the top ten systems. Slurm's design is very modular with about 100 optional plugins.

-- *Slide End* --

-- *Slide* --
### Part 3: Job Submission Principles

* The steps for job submission are (a) setup and launch., (b) monitor., and (c) retrieve results and analyse. Jobs are launched from the login node with resource requests and, when the job scheduler decides, run on compute nodes. Some directories (e.g.,. user home or project directories) are shared across the entire cluster so output is an accessible place.
* A cluster is a shared environment thus a a resource requesting system. Policies ensure that everyone has a "fair share" to the resources (e.g., user processor limits).
* Users must not run jobs on the login node! The login node is a **particularly** shared resource. All users will access the login node in order to check their files, submit jobs etc. If one or more users start to run computationally or I/O intensive tasks on the login node (such as forwarding of graphics, copying large files, running multicore jobs), then that will make operations difficult for everyone.

-- *Slide End* --

-- *Slide* --
### Part 3: Graphic from IBM 'Red Book' on Job Submission

<img src="http://levlafayette.com/files/rabbitjobs.png" title="Job submission using rabbits" />


-- *Slide End* --

-- *Slide* --
### Part 3: Job Setup

* Setup and launch consists of writing a short script that initially makes resource requests 
(walltime, processors, memory, queues) and then commands (loading modules, changing 
directories, running executables against datasets etc), and optionally checking queueing system.
* Core command for checking queue in TORQUE: showq
* Core command for checking queue in SLURM:   squeue
* Core command for job submission in TORQUE:  qsub [jobscript]
* Core command for job submission in SLURM:   sbatch [jobscript]
* TORQUE jobs must include ``cd $PBS_O_WORKDIR`` to change to the directory where they were launched. SLURM jobs do not require this. 
* TORQUE jobs do not parse the user's environment to the compute node by default; the ``#$PBS -V`` command is required. SLURM does this by default.

-- *Slide End* --

-- *Slide* --
### Part 3: Status and Output

* Core command for checking job in TORQUE:qstat [jobid]
* Core command for checking job in Moab:      checkjob [jobid] 
* Core command for checking job in Slurm:      squeue -j [jobid]
* Detailed command in Slurm:                           scontrol show job [jobid] 
* Core command for deleting job in TORQUE:  qdel [jobid]
* Core command for deleting job in Slurm:        scancel [jobid]
* Both TORQUE and Slurm provide error and output files (combined into one by default in 
SLURM). They may also have files for post-job processing. Graphic visualisation is best done on 
the desktop.

-- *Slide End* --

-- *Slide* --
### Part 4: Single Core Job on Edward and Spartan

``#!/bin/bash``
``#PBS ­q compute``
``#PBS ­l walltime=01:00:00``
``#PBS ­l nodes=1:ppn=1``
``cd $PBS_O_WORKDIR``
``module load my­app­compiler/version``
``my­app data``

``#!/bin/bash``
``#SBATCH ­p cloud``
``#SBATCH ­­time=01:00:00``
``#SBATCH ­­nodes=1``
``#SBATCH ­­ntasks=1``
``module load my­app­compiler/version``
``my­app data``

-- *Slide End* --

-- *Slide* --
### Part 4 : Multicore Jobs on Edward and Spartan

* Modifying resource allocation requests can improve job efficiency. For TORQUE/Edward use the 
same script as previously provided but change the resource request as follows:
``#PBS ­l nodes=2:ppn=2``
* For example shared-memory multithreaded jobs on SLURM/Spartan (e.g., OpenMP), modify the 
--cpus-per-task to a maximum of 16, which is the maximum number of cores on a single instance.
``#SBATCH ­­cpus­per­task=16``
* For distributed-memory multicore job using message passing, the multinode partition has to be 
invoked and the resource requests altered e.g.,

``#!/bin/bash``
``#SBATCH -­p cloud``
``#SBATCH ­­nodes=2``
``#SBATCH ­­ntasks=2``
``#SBATCH ­­cpus­per­task=1``
``module load my­app­compiler/version``
``srun my­mpi­app``

* Multinode jobs on Spartan may be slower if they have a lot of interprocess 
communication and they cross compute nodes.

-- *Slide End* --

-- *Slide* --

### Part 4 : Job/Batch Arrays and Dependencies

* With a job or batch array the same batch script, and therefore the same resource requests, is used multiple  times. A typical example is to apply the same task across multiple datasets. The following example submits 10 batch jobs with myapp running against datasets dataset1.csv, dataset2.csv, ... 
dataset10.csv

``#PBS ­t 1­10``
``myapp ${PBS_ARRAYID}.csv``

``#SBATCH ­­array=1­-10``
``myapp ${SLURM_ARRAY_TASK_ID}.csv``

* A dependency condition is established on which the launching of a batch script 
depends, creating a conditional pipeline. The dependency directives consist of `after`, `afterok`, 
`afternotok`, `before`, `beforeok`, `beforenotok`. A typical use case is where the output of one job is required as the input of the next job.

``#PBS ­W x=depend:afterok:myfirstjob``
``#SBATCH ­­dependency=afterok:myfirstjobid mysecondjob``

### Part 4: Interactive Jobs

* In the third case TORQUE or SLURM, based on the resource requests made on the command 
line, puts the user on to a compute node. This is typically done if they user wants to run a 
large script (and shouldn't do it on the login node), or wants to test or debug a job. The 
following command would launch one node with two processors for ten minutes.

``[lev@edward ~]$ qsub ­l nodes=1:ppn=2,walltime=0:10:0 ­I``
``qsub: waiting for job 2132478.edward­m to start``
``qsub: job 2132478.edward-­m ready``
``[lev@edward042 ~]$ ``

``[llafayette@unimelb.edu.au@spartan interact]$ sinteractive ­­nodes=1 ­­ntasks­per­node=2 ­­time=0:10:0``
``srun: job 164 queued and waiting for resources``
``srun: job 164 has been allocated resources``
``[llafayette@unimelb.edu.au@spartan001 interact]$``

### Part 5: Command Summaries for Edward and Spartan

User Commands PBS/Torque SLURM
Job submission qsub [script_file] sbatch [script_file]
Job submission qdel [job_id] scancel [job_id]
Job status (by job) qstat [job_id] squeue [job_id]
Job status (by user) qstat -u [user_name] squeue -u [user_name]
Node list pbsnodes -a sinfo -N
Queue list qstat -Q squeue
Cluster status showq, qstatus -a squeue -p [partition]
Environment 
Job ID $PBS_JOBID $SLURM_JOBID
Submit Directory $PBS_O_WORKDIR $SLURM_SUBMIT_DIR
Submit Host $PBS_O_HOST $SLURM_SUBMIT_HOST
Node List $PBS_NODEFILE $SLURM_JOB_NODELIST
Job Array Index $PBS_ARRAYID $SLURM_ARRAY_TASK_ID

Job Specification PBS SLURM
Script directive #PBS #SBATCH
Queue -q [queue] -p [queue]
Job Name -N [name] --job-name=[name]
Nodes -l nodes=[count] -N [min[-max]]
CPU Count -l ppn=[count] -n [count]
Wall Clock Limit -l walltime=[hh:mm:ss] -t [days-hh:mm:ss]
Event Address -M [address] --mail-user=[address]
Event Notification -m abe --mail-type=[events]
Memory Size -l mem=[MB] --mem=[mem][M|G|T]
Proc Memory Size -l pmem=[MB] --mem-per-cpu=[mem][M|G|T]



