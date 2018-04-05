-- *Slide* --
### Goals for today
* Part 1: Learning about supercomputers and Spartan.
* Part 2: Logging on an exploring the Linux Environment.
* Part 3: Learning about Environment Modules and the Slurm job submission system.
* Part 4: Submitting test jobs.
* Part 5: TORQUE/Moab and Slurm Command Summaries
-- *Slide End* --

-- *Slide* --
### Slide Respository
* A copy of these slides and sample code is available at: `https://github.com/UoM-ResPlat-DevOps/SpartanIntro`
* A copy of information about HPC at the University of Melbourne is available at `https://dashboard.hpc.unimelb.edu.au`. See also `man spartan` on the cluster and the `/usr/local/common/` directories for more help and code exammples.
* Help is available at: `hpc-support@unimelb.edu.au`. Other courses also conducted by Research Platforms.
-- *Slide End* --

-- *Slide* --
### Part I: Helpdesk
* Read the Message of the Day when you login!
* If a user has problems with submitting a job, or needs a new application or extension to an existing application installed, or if their submissions are generated unexpected errors etc., an email can be sent to the helpdesk: `hpc­-support@unimelb.edu.au`. 
* Do not email individual sysadmins; we need consildated records. Please be informative about the error or issue.
-- *Slide End* --

-- *Slide* --
### Part 1: Supercomputers and High Performance Computers etc
* "Supercomputer" means any single computer system that has exceptional processing power for its time. 
* One popular metric (LINPACK) is the number of floating­ point operations per second (FLOPS) such a system can carry out (http://top500.org). HPC Challenge is a broader, more interesting metric.
* High Performance Computer (HPC) is any computer system whose architecture allows for above average performance. High Throughput Computing (HTC) is an architecture for maximum job completion; capability vs capacity computing.
-- *Slide End* --

-- *Slide* --
### Part 1: Clusters and Research Computing
* Clustered computing is when two or more computers serve a single resource. This improves performance and provides redundancy in case of failure system. Typically commodity systems with a high-speed local network.
* Research computing is the software applications used by the scientific community to aid research. Does not necessarily equate with high performance computing, or the use of clusters.­ It is whatever researchers use and do. Not issues of producibility and environments.
-- *Slide End* --

-- *Slide* --
### Part 1: Parallel Computing
* With a cluster architecture, applications can be more easily parallelised across them. *Data parallel*, running same task in parallel; the horse and cart example, Monte Carlo experiments. *Task parallel*, running indeopendent tasks in parallel with communication; driving a car, molecullar modelling.
* Further examples of serial versus parallel; weather forecasting, aerodynamic design, fluid mechanics, radiation modelling, molecullar dynamics, CGI rendering for popular movies, etc. Reality is a parallel system!
-- *Slide End* --

-- *Slide* --
### Part 1: HPC Cluster and Parallel Processing Components
* A chassis or rack, containing multiple computer system units, interconnect, and providing power.
* Computer system units or nodes, containing memory, local disk, and sockets.
* Sockets contain a processor which has one or more cores which do the processing.
* Logical processes have shared resources (e.g., memory) which may have multiple instruction stream threads.
-- *Slide End* --

-- *Slide* --
### Part 1: Generic HPC Cluster Design
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanIntro/master/Images/genericcluster.png" />
* Image originally from the Victorian Partnership for Advanced Computing.
-- *Slide End* --

-- *Slide* --
### Part 1: King Edward Is No More!
* Since 2011 UniMelb's general cluster was been Edward (previous system was Alfred).
* A review was conducted looking at the infrastructure and metrics of Edward, the University's general HPC system since 2011.
* Edward's usage statistics show that single-core and low memory jobs dominate; 76.35% of jobs from Feb 9 2015 to Feb 9 2016 were single core, and 96.83% used 1-4GB of memory.
-- *Slide End* --

-- *Slide* --
### Part 1: What's Different About Spartan?
* New system is Spartan (not Æthelstan or Ælfweard)
* Recommended solution was to make use of existing NeCTAR Research cloud with an expansion of general cloud compute provisioning and use of a smaller "true HPC" system on bare metal nodes.
* Matches Sparta's citenzship structure. Spartan is not "HPC in the Cloud", it's a chimera HPC/Cloud hybrid.
-- *Slide End* --

-- *Slide* --
### Part 1: Spartan Design
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanIntro/master/Images/spartanlayout.png" />
-- *Slide End* --

-- *Slide* --
### Part 1: Spartan Hardware
* Physical partition is c276 cores, 21 GB per core,  2 socket Intel E5-2643 v3 CPU with 6-core per socket, 3.4GHz, 192GB memory, 2x 1.2TB SAS drives, 2x 40GbE network Mellanox 2100. 
* Cloud partitions is almost 400 virtual machines with over 3,000 cores, dual CPU E5-2683 v4 2.1GHz, 10GBe Cisco Nexus. 
* There is also a GPU partition (Dual Nvidia Tesla K80, *very* big expansion this year), and departmental partitions (water and ashley).
* Storage: 8TB `/scratch` NFS over RDMA, `/project` and `/home` NFS, 65TB.
-- *Slide End* --

-- *Slide* --
### Part I: Logging In
* Spartan uses its an authentication that is tied to the university Security Assertion Markup Language (SAML). The login URL is `https://dashboard.hpc.unimelb.edu.au/karaage`
* Users on Spartan must belong to a project. Projects must be led by a University of Melbourne researcher (the "Principal Investigator") and are subject to approval by the Head of Research Compute Services. Participants in a project can be researchers or research support staff from anywhere.
* Projects have their own project directory for files.
-- *Slide End* --

-- *Slide* --
### Part I: Logging In
* To log on to a HPC system, you will need a user account and password and a Secure Shell (ssh) client. Linux distributions almost always include SSH as part of the default installation as does 
Mac OS 10.x. For MS-­Windows users, the free PuTTY client is recommended (http://putty.org). 
* To transfer files use scp, WinSCP, Filezilla (`https://filezilla-project.org/`), or rsync.
* Example login: `lev@spartan.hpc.unimelb.edu.au`
-- *Slide End* --

-- *Slide* --
### Part I: SSH Keys, Config, Data Transfers
* Consider using an `.ssh/config` file and using passwordless SSH by creating a keypair and adding to your `.ssh/authorized_keys` file on Spartan.
* SSH Keys will make your life easier. Follow the instructions here: `https://dashboard.hpc.unimelb.edu.au/faq/#how-do-setup-passwordless-ssh-login`
* Both useful for data transfers. c.f., `https://dashboard.hpc.unimelb.edu.au/managing_data/` 
-- *Slide End* --

-- *Slide* --
### Part 2: This is a GNU/Linux CLI World 
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanIntro/master/Images/gnulinux.png" align="center" height="25%" width="25%" vspace="5" hspace="5" />
-- *Slide End* --

-- *Slide* --
### Part 2: This is a GNU/Linux World CLI II
* The command­line interface provides a great deal more power and is very resource efficient. 
* GNU/Linux scales and does so with stability and efficiency.
* Critical software such as the Message Parsing Interface (MPI) and nearly all scientific programs are designed to work with GNU/Linux. 
* The operating system and many applications are provided as "free and open source" which are better placed to improve, optimize and maintain.
-- *Slide End* --

-- *Slide* --
### Part 2: Exploring The Environment
* When a user logs in on a Linux or other UNIX-like system on the command line, they start in their home directory (`/home/<<username>>`). Explore file system hierarchy. Project directory in `/data/projects/<<projectID>>`.
* "Everything in the UNIX system is a file" (Kernighan & Pike, 1984, 41). 

| Command     | Explanation                                                                |
|:------------|:--------------------------------------------------------------------------:|
|`whoami`   | "Who Am I?; prints the effective user id                                  |
|`pwd`      | "Print working directory"|
|`ls`       | "List" directory listing                                                   |	
-- *Slide End* --

-- *Slide* --
### Part 2: Command Options
* Linux commands often come with options expressed as: `<command> --<option[s]>`
* Options can be expressed as full words or abbreviated characters.

| Command     | Explanation                                                                |
|-------------|:--------------------------------------------------------------------------:|
|`ls -lart`   | Directory listing with options (long, all, reverse time)                   |
|`ls -lash`   | Directory listing with options (long, all, size in human readable	   |
-- *Slide End* --

-- *Slide* --
### Part 2: The Online Manual
* Linux commands come with "man" (manual) pages, which provide a terse description of the meaning and options available to a command. A verbose alternative to man is info. 

| Command             | Explanation                                                      |
|:--------------------|:-----------------------------------------------------------------|
|`man <command`       | Display the manual entry for the command                         |
|`apropos <command>`  | Search for a particular command. Equivalent to "man -k <command>"|
|`info <command>`     | A verbose description of the command                             |
| `whatis <command>`  | A terse description of the command                               |
-- *Slide End* --

-- *Slide* --
### Part 2: Pipes
* Linux also have very useful 'pipes' and redirect commands. To pipe one command through another use the '|' symbol.

| Command            | Explanation                                                         |
|:-------------------|:-------------------------------------------------------------------:|
| <code>who -u  &#124; less</code> | "Who" shows who is logged on and how long they've been idle.        |
| <code>ps afux &#124; less</code> | "ps" provides a list of current processes.                          |
-- *Slide End* --

-- *Slide* --
### Part 2: Redirects
* To redirect output use the '>' symbol. To redirect input (for example, to feed data to a command) use the '<'. Concatenation is achieved through the use of '>>' symbol. 

| Command           | Explanation                                                          |
|:------------------|:--------------------------------------------------------------------:|
| `w > list.txt`  | 'w' is a combination of who, uptime and ps -a, redirected            |
| `w >> list.txt` | Same command, concatenated                                           |
-- *Slide End* --

-- *Slide* --
### Part 2: Files and Text Editing I
* Linux filenames can be constructed of any characters except the forward slash, which is for directory navigation. However it is best to avoid punctuation marks, non-printing characters (e.g., spaces). It is better to use underscores or CamelCase instead of spaces.
* Linux is case-sensitive with its filenames (e.g., list.txt, LIST.txt lisT.txT are different).
-- *Slide End* --

-- *Slide* --
### Part 2: Files and Text Editing II
* Files do not usually require a program association suffix, although you may find this convenient (a C compiler like files to have .c in their suffix, for example). 
* The type of file can be determined with the `file` command. The type returned will usually be text, executable binaries, archives, or a catch-all "data" file.
* There are three text editors usually available on Linux systems on the command-line. The first is `nano`; easy to use, limited functionality. The others (both from 1976) are `vi` (or `vim`), which is terse but powerful, or `emacs` (Editor Macros) editor and environment is a feature-rich application,
-- *Slide End* --

-- *Slide* --
### Part 2: Copying Files to a Local Systems
* To get a copy of the files from an external source to your home directory, you will probably want to use `wget`, or `git`, or `scp`.

| Command           | Explanation                                                          |
|:------------------|:--------------------------------------------------------------------:|
| `wget URL`      | Non-interactive download of files over http, https, ftp etc.         |
| `git clone URL` | Clone a repository into a new directory.                                        |
-- *Slide End* --

-- *Slide* --
### Part 2: Copying Files Within a Local Systems 
* To copy a file from within a system use the `cp` command. Common options include `-r` to copy and entire directory

| Command           | Explanation                                                          |
|:------------------|:--------------------------------------------------------------------:|
| `cp source destination`      | Copy a file from source to destination         |
| `cp -r source destination` | Recursive copy (e.g., a directory) from source to destination                                        |
| `cp -a source destination` | Recursive copy as archive (with permissions, links)                                        |
-- *Slide End* --

-- *Slide* --
### Part 2: Copying Files Between Systems
* To copy files to between systems desktop use SCP (secure copy protocol) or SFTP (secure file transfer protocol), combining the ssh and cp functionality. The `cp` options can also be used. The source or destination address should also require a remote shell login.

| Command           | Explanation                                                          |
|:------------------|:--------------------------------------------------------------------:|
| `scp source.address:/path/ destination.address:/path/`| Copies files on a network |
-- *Slide End* --

-- *Slide* --
### Part 2: Synchronising Files and Directories I
* The `rsync` utility provides a fast way to keep two collections of files "in sync" by tracking changes. The source or destination address should also require a remote shell login. 
For example; `rsync -avz --update lev@spartan.hpc.unimelb.edu.au:files/workfiles .`
-- *Slide End* --

-- *Slide* --
### Part 2: Synchronising Files and Directories II

| Command           | Explanation                                                          |
|:------------------|:--------------------------------------------------------------------:|
| `rsync source destination`| General rsync command  |
| `rsync -avze ssh username@remotemachine:/path/to/source .` | With ssh encryption |
-- *Slide End* --

-- *Slide* --

### Part 2: Synchronising Files and Directories III
* The `rsync -avz` command ensures that it is in archive mode (recursive, copies symlinks, preserves permissions), is verbose, and compresses on transmission. 
* The --update restricts the copy only to files that are newer than the destination. 
* Note that rsync is "trailing slash sensitive". A trailing / on a source means "copy the contents of this directory". Without a trailing slash it means "copy the directory".
-- *Slide End* --

-- *Slide* --

### Part 2: Synchronising Files and Directories IV
* Rsync can be used in a synchronise mode with the --delete flag.  Consider this with the `-n`, or `--dry-run` options first!

| Command           | Explanation                                                          |
|:------------------|:--------------------------------------------------------------------:|
| `rsync -avz --update source/ username@remotemachine:/path/to/destination| Synchronise source and destination, keep older files  |
| `rsync -avz --delete source/ username@remotemachine:/path/to/destination| Synchronise source and destination absolutely |
-- *Slide End* --

-- *Slide* --
### Part 2: Creating Directories, Moving Files
* Directories can be created with the `mkdir` command (e.g., `mkdir braf`).
* Files can be copied with the `cp` command (e.g., `cp gattaca.txt gattaca2.txt`)
* Files can be moved with the `mv` command (e.g., `mv gattaca2.txt braf`)

-- *Slide* --
### Part 2: File Differences
* File differences can be determined by timestamp (e.g., `ls -l gattaca.txt braf/gattaca2.txt`)
* Content differences can be determined by the `diff` command (e.g., `diff gattaca.txt braf/gattaca.txt`)
* For a side-by-side representation use the command `sdiff` instead.
-- *Slide End* --

-- *Slide* --
### Part 2: Searches and Wildcards
* To search for files use the find command (e.g., `find . -name '*.txt'`). Compare with `locate` and `whereis`.
* To search within files, use the `grep` command (e.g., `grep -i ATEK braf/*`)
* The most common wildcare is `*`, but there is also `?` (single character).
* There are also range searches (e.g., `[a-z]` any character between a and z, inclusive)
-- *Slide End* --

-- *Slide* --
### Part 2: Deletions
* Files can be deleted with the `rm` command (e.g., `rm gattaca.txt`)
* Empty directories can be deleted with the `rmdir` command (e.g., `rmdir braf`)
* Directories, files, subdirectories etc can be delted with `rm -rf <<dir>>`
* BE VERY CAREFUL!
-- *Slide End* --

-- *Slide* --
### Part 2: Why The File Differences Mattered
<blockquote>
BRAF is a human gene that makes a protein (imaginatively) named B-Raf. This protein is involved in sending signals inside cells, which are involved in directing cell growth. In 2002, it was shown to be faulty (mutated) in human cancers. In particular the difference that between the two files "ATVKSRWSGS" and "ATEKSRWSGS" is the difference which leads to susceptibility to metastatic melanoma. 
</blockquote>
-- *Slide End* --

-- *Slide* --
### Part 3: A Dynamic Environment
* Environment modules provide for the dynamic modification of the user's environment via module files, such as the location of the application's executables, its manual path, the library path, and so forth.
* Modulefiles also have the advantages of being shared on many users on a system (such as an HPC system) and easily allowing multiple installations of the same application but with different versions and compilation options.
* Check the current environment with the `env` (environment) command.
-- *Slide End* --

-- *Slide* --
### Part 3: Environment Modules  Commands
* The are two implementations of environment modules. The classic modules system is available on the Edward HPC, and the newer Lmod is on Spartan. LMod is considered superior for hierarchies of modules.
-- *Slide End* --

-- *Slide* --
### Part 3: Module Commands I
| Command                         | Explanation                                            |
|---------------------------------|:------------------------------------------------------:|
| `module help`                 | List of switches, commands and arguments for modules   |
| `module avail`                | Lists all the modules which are available to be loaded.|
| `module display <modulefile>` | Display paths etc for modulefile                       |
| `module load <modulefile>`    | Loads paths etc to user's environment                  |
| `module unload <modulefile>`  | Unloads paths etc from user's environment.             |
| `module list`                 | lists all the modules currently loaded.                |
-- *Slide End* --

-- *Slide* --
### Part 3: Module Commands II
* There is also the `module switch <modulefile1> <modulefile2>`, which unloads one modulefile (modulefile1) and loads another (modulefile2).
* On Spartan there is also the lmod-specific `module spider <modulename`, which traverses through the system for all modules and provides a description.
-- *Slide End* --

-- *Slide* --
### Part 3: Portable Batch System
* The Portable Batch System (or simply PBS) is a utility software that performs job scheduling by assigning unattended background tasks expressed as batch jobs, among the available resources.
* Originally developed by MRJ Technology Solutions under contract to NASA in the early 1990s. Released as an open-source product as OpenPBS. Forked by Adaptive Computing as TORQUE (Terascale Open-source Resource and QUEue Manager). Many of the original engineering team now part of Altair Engineering who have their own commercial version, PBSPro. TORQUE is used on the Edward HPC system.
* A batch system typically consists of a resource manager (e.g., TORQUE) and a job scheduler (e.g., Maui, Moab), or a combination (e.g., PBSPro, Slurm).
-- *Slide End* --

-- *Slide* --
### Part 3: Slurm Workload Manager
* Slurm, used on Spartan, began development as a collaborative effort primarily by Lawrence Livermore National Laboratory, SchedMD, Linux NetworX, Hewlett-Packard, and Groupe Bull as a Free Software resource manager. As of November 2015, TOP500 list of most powerful computers in the world indicates that Slurm is the workload manager on six of the top ten systems. Slurm's design is very modular with about 100 optional plugins.
* There is a repository for converting PBS to Slurm: https://github.com/bjpop/pbs2Slurm
-- *Slide End* --

-- *Slide* --
### Part 3: Job Submission Principles
* The steps for job submission are (a) setup and launch., (b) monitor., and (c) retrieve results and analyse. Jobs are launched from the login node with resource requests and, when the job scheduler decides, run on compute nodes. Some directories (e.g.,. user home or project directories) are shared across the entire cluster so output is an accessible place.
* Job scripts are simply resource requests (understood by scheduler), a batch of commands (understood by shell) with output to files.
* A cluster is a shared environment thus a a resource requesting system. Policies ensure that everyone has a "fair share" to the resources (e.g., user processor limits).
-- *Slide End* --

-- *Slide* --
### Part 3: DON'T RUN JOBS ON THE LOGIN NODE!
* The login node is a **particularly** shared resource. All users will access the login node in order to check their files, submit jobs etc. If one or more users start to run computationally or I/O intensive tasks on the login node (such as forwarding of graphics, copying large files, running multicore jobs), then that will make operations difficult for everyone.
-- *Slide End* --

-- *Slide* --
<img src="http://levlafayette.com/files/rabbitjobs.png" width="100%" height="100%" title="Job submission using rabbits" />
* From the IBM 'Red Book' on Job Submission.
-- *Slide End* --

-- *Slide* --
### Part 2: Partitions and Queues
* Setup and launch consists of writing a short script that initially makes resource requests 
(walltime, processors, memory, queues) and then commands (loading modules, changing 
directories, running executables against datasets etc), and optionally checking queueing system.
* Core command for checking paritions is `sinfo -s`, or `sinfo -p` for partition and node status. Major partitions are: `cloud`, `physical`, `gpgpu`. Note also `shortcloud`, `longcloud`, and `shortgpgpu`.
* Core command for checking queue `squeue` or `showq` (on Spartan).
-- *Slide End* --

-- *Slide* --
### Part 2: Job Status
* Core command for job submission `sbatch [jobscript]` 
* Core command for checking job `squeue -j [jobid]`, detailed command `scontrol show job [jobid]` (SLURM), or all user's jobs `squeue -u [username]`.
* Core command for deleting job `scancel [jobid]`
-- *Slide End* --

-- *Slide* --
### Part 3: Single Core Job
`#!/bin/bash`<br />
`#SBATCH -­p cloud`<br />
`#SBATCH ­­--time=01:00:00`<br />
`#SBATCH ­­--ntasks=1`<br />
`module load my­app­compiler/version`<br />
`my­app data`<br />
* Examples at `/usr/local/common/MATLAB` and `/usr/local/common/R`; note that the job can call other scripts. Note that Slurm has full and abbreviated directives.
-- *Slide End* --

-- *Slide* --
### Part 3 : Multicore and Multithreaded Jobs
* In Slurm, `ntasks` means number of tasks, whereas `cpus-per-task` allocates processor cores. In most jobs (serial, MPI) this is 1 by default.
* With shared-memory multithreaded jobs on (e.g., OpenMP), modify the `--cpus-per-task` to a maximum of 8, which is the maximum number of cores on a single cloud VM (or 12 for physical).<br />
`#SBATCH ­­--cpus-­per-­task=8`
* See examples at `/usr/local/common/FSL/`
-- *Slide End* --

-- *Slide* --
### Part 3 : Multinode Jobs I
* For distributed-memory multicore job using message passing, the multinode partition has to be 
invoked and the resource requests altered e.g.,
`#!/bin/bash`<br />
`#SBATCH -­p physical`<br />
`#SBATCH ­­--nodes=2`<br />
`#SBATCH ­­--ntasks-per-node=8`<br />
`module load my­app­compiler/version`<br />
`srun my­mpi­app`
-- *Slide End* --

-- *Slide* --
### Part 3 : Multinode Jobs II
* Multinodes jobs should be run on the `physical` partition which has the higher interconnect speed.
* Multinode jobs on Spartan may be slower if they have a lot of interprocess communication and they cross compute nodes.
* This said, multinodes jobs can also request total tasks/cores rather than allocating them per node. e.g., `#SBATCH ­­--ntasks=16`<br />
* See examples at `/usr/local/common/Python`
-- *Slide End* --

-- *Slide* --
### Part 4 : Job/Batch Arrays
* With a job or batch array the same batch script, and therefore the same resource requests, is used multiple  times. A typical example is to apply the same task across multiple datasets. The following example submits 10 batch jobs with myapp running against datasets dataset1.csv, dataset2.csv, ... 
dataset10.csv
`#SBATCH ­­array=1­-10`<br />
`myapp ${Slurm_ARRAY_TASK_ID}.csv`
* Examples at `/usr/local/common/array` and `/usr/local/common/Octave`.
-- *Slide End* --

-- *Slide* --
### Part 4 : Job/Batch Dependencies
* A dependency condition is established on which the launching of a batch script depends, creating a conditional pipeline. The dependency directives consist of `after`, `afterok`, `afternotok`, `before`, `beforeok`, `beforenotok`. A typical use case is where the output of one job is required as the input of the next job. Multiple job dependencies are specified with colon separated values.
`#SBATCH ­­dependency=afterok:myfirstjobid mysecondjob`
* Examples at `/usr/local/common/depend/`
-- *Slide End* --

-- *Slide* --
### Part 4: Interactive Jobs
* An interactive job, based on the resource requests made on the command  line, puts the user on to a compute node. This is typically done if they user wants to run a  large script (and shouldn't do it on the login node), or wants to test or debug a job. The  following command would launch one node with two processors for ten minutes.
`sinteractive ­­--nodes=1 --­­ntasks-­per-­node=2 --­­time=0:10:0`
* Example and instructions at `/usr/local/common/interact`
-- *Slide End* --

-- *Slide* --
### Part 4 : Multiple Job Steps
* Sometimes a job needs to consist of several steps that need to be carried on sequence, even if the individual components are in parallel. In this case the entire job resource set can be called with an aggregation of walltime and with a maximum reduction operation for memory and resources. e.g.,
`#!/bin/bash`<br />
`#SBATCH --­partition physical`<br />
`#SBATCH ­­--nodes=2`<br />
`#SBATCH ­­--ntasks=12`<br />
`#SBATCH --time=24:00:00`<br />
`srun -N 2 -n 12 -t 06:00:00 ./my­mpi­app`<br />
`export OMP_NUM_THREADS=6`<br />
`srun -N 1 -n2 -c $OMP_NUM_THREADS -t 12:00:00 ./myompapp`<br />
`srun -N 1 -n 1 -t 06:00:00 ./myserialapp`<br />
-- *Slide End* --

-- *Slide* --
### Part 4: Backfilling
* Many schedulers and resource managers use a backfilling algorithm to improve system utilisation and maximise job throughout. 
* When more resource intensive (e.g., multiple node) jobs are running it is possible that gaps ends up in the resource allocation. To fill these gaps a best effort is made for low-resource jobs to slot into these spaces.
-- *Slide End* --

-- *Slide* --
### Part 4: Memory Allocation
* By default the scheduler will set memory equal to the total amount on a compute node divided by the number of cores requested. In some cases this might not be enough (e.g., very large dataset that needs to be loaded with low level of parallelisation).
* Additional memory can be allocated with the `--mem=[mem][M|G|T]` directive (entire job) or `--mem-per-cpu=[mem][M|G|T]` (per core). Maximum should be based around total cores -1 (for system processes). The --mem-per-cpu directive is for threads for OpenMP applications and processor ranks for MPI.
* Not a good allocation of resources. Use only when absolutely necessary.
-- *Slide End* --

-- *Slide* --
### Part 5: Slurm User Commands

| User Commad    | Slurm Command           | 
|----------------|------------------------:|
|Job submission  |sbatch [script_file]     |
|Job delete      |scancel [job_id]         |
|Job status      |squeue [job_id]          |
|Job status      |squeue -u [user_name]    |
|Node list       |sinfo -N                 |
|Queue list      |squeue                   |
|Cluster status  |sinfo               	   |
-- *Slide End* --

-- *Slide* --
### Part 5: Slurm Job Job Commands
| Job Specification     | Slurm Command              | 
|-----------------------|---------------------------:|
|Script directive       |`#SBATCH`                   |
|Queue                  |`-p [queue]`                |
|Job Name               |`--job-name=[name]`         |
|Nodes                  |`-N [min[-max]]`            |
|CPU Count              |`-n [count]`                |
|Wall Clock Limit       |`-t [days-hh:mm:ss]`        |
|Event Address          |`--mail-user=[address]`     |
|Event Notification     |`--mail-type=[events]`      |
|Memory Size            |`--mem=[mem][M|G|T]`        |
|Proc Memory Size       |`--mem-per-cpu=[mem][M|G|T]`|
-- *Slide End* --

-- *Slide* --
### Part 5: Slurm Environment Commands
| Environment Command   | Slurm (Command)         | 
|-----------------------|------------------------:|
|Job ID                 |`$SLURM_JOBID`           |
|Submit Directory       |`$SLURM_SUBMIT_DIR`      |
|Submit Host            |`$SLURM_SUBMIT_HOST`     |
|Node List              |`$SLURM_JOB_NODELIST`    |
|Job Array Index        |`$SLURM_ARRAY_TASK_ID`   |
-- *Slide End* --

-- *Slide* --
### Part 5: Performance Test
* Compare the performance of NAMD/VMD Ubiquitin protein test case under `/usr/local/common/NAMD` under different configurations

| Nodes and Tasks       | Partition             | Time                    | 
|-----------------------|-----------------------|------------------------:|
|ntasks=4               | cloud                 |                         |
|ntaks=8                | cloud                 |                         |
|nodes=2, ntasks=16     | cloud                 |                         |
|nodes=2, ntasks=16     | physical              |                         |
-- *Slide End* --

-- *Slide* --
<img src="https://raw.githubusercontent.com/UoM-ResPlat-DevOps/SpartanIntro/master/Images/hypnotoad.png" width="150%" height="150%" />
-- *Slide End* --
