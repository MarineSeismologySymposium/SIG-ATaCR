## Special Interest Group on OBS Data Processing at the 2021 Marine Seismology Symposium


**Instructors**: [Helen Janiszewski](https://helenjaniszewski.squarespace.com) and [Pascal Audet](https://www.uogeophysics.com/authors/admin/)

**When**: Wednesday, March 10, 2021 at 9 PM (GMT). *Note*, this is 11 AM in Honolulu (HST = GMT - 10:00) and 4 PM in Ottawa (EST = GMT - 5:00)

**Where**: On zoom (link available via Marine Seismology Symposium pathables registration)

**What**: This SIG will provide hands-on tutorials to process broadband ocean-bottom seismic (BBOBS) data using the Automatic Tilt and Compliance Removal (ATaCR, pronounced "attacker") software. This software is designed to automate, as best as possible, the process of characterizing and removing tilt and compliance noise from vertical component BBOBS data. The software is available in two scripting languages: Matlab and Python. Both versions are open source, and installation instructions are described below. The session will first introduce common practices and pitfalls when working with noisy BBOBS data and perform basic quality control, then break out into two separate rooms where participants will follow live tutorials using ATaCR. 

**How to prepare**: To ensure that the live tutorial sessions run seamlessly, we ask participants to pre-register to either the Matlab or Python session via pathables and install ATaCR with demo data. Details are outlined below.

---

### Installing the Matlab version

- Git repository: [ATaCR](https://github.com/helenjanisz/ATaCR)

- Documentation can be found [here](https://github.com/helenjanisz/ATaCR/blob/master/ATaCR_Manual.pdf)

To install the Matlab version of ATaCR, navigate on the command line to a path where the software will be installed

- Clone the ATaCR repository ([fork](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) it first, if you consider contributing):

```bash
git clone https://github.com/helenjanisz/ATaCR
cd ATaCR
```

### Getting and preparing the demo data

Download the demo data provided on this github repository by navigating from a terminal to some work folder and typing:

```bash
git clone https://github.com/MarineSeismologySymposium/SIG-ATaCR
cd SIG-ATaCR
```

The `DATA`, `EVENTS`, and `Matlab_Setup` folders should now be on your computer. Prior to the start of the workshop, move these and the contents of Matlab_Setup into your main ATaCR directory, and run `ATaCRSIG_matlabsetup.m` to set up the file and folder structure appropriately.

You are ready to go!

---

### Installing the Python version

*Note!! See the video showing how to install `OBStools` [here](https://www.dropbox.com/s/fsxbzvob8o2vekq/MSS2021_SIG_Python_Installation.mp4?dl=0)* 

ATaCR is implemented as a separate module in the open-source Python package OBStools:

- Git repository: [OBStools](https://github.com/nfsi-canada/OBStools)

- Documentation can be found [here](https://nfsi-canada.github.io/OBStools/)

To install `obstools`, we strongly recommend installing and creating a `conda` environment (either from the [Anaconda](https://anaconda.org) distribution or [mini-conda](https://docs.conda.io/en/latest/miniconda.html)) where the code can be installed alongside its dependencies. This **significantly reduces** the potential conflicts in package versions. In a bash (or zsh) terminal, follow these steps:

- Create a conda environment (here we call it `mss` for the name of the symposium) and install `python=3.8` and `obspy`:

```bash
conda create -n mss python=3.8 obspy -c conda-forge
```

- Activate the environment:

```bash
conda activate mss
```

- Install the required [`stdb`](https://github.com/schaefferaj/StDb) package using `pip`:

```bash
pip install stdb
```

Now you're ready to install `obstools`. You might consider one of two options: 1) you want to look at the source code and are considering contributing (awesome!!); 2) you are only interested in using the software and are not interested in the source code.

##### 1) Developer mode: Installing from source

- Navigate on the command line to a path where the software will be installed

- Clone the OBStools repository ([fork](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) it first, if you are serious about contributing):

```bash
git clone https://github.com/paudetseis/OBStools.git
cd OBStools
```

- Install using `pip`:

```bash
pip install -e .
```

##### 2) User mode: Installing from the Python Package Index (PyPI):

```bash
pip install obstools
```

### Getting the demo data

Finally, download the demo data provided on this github repository by navigating to some work folder (where the data and results of the processing will be located) and typing:

```bash
git clone https://github.com/MarineSeismologySymposium/SIG-ATaCR
cd SIG-ATaCR
```

The `DATA` and `EVENTS` folders should now be on your computer and you are ready to start the tutorial.

### Testing your installation

If you want to make sure everything is installed properly, make sure your conda environment has been activated and open a python window by typing in a terminal:

```bash
python
```

which will produce something like:

```bash
Python 3.8.5 (default, Sep  4 2020, 02:22:02) 
[Clang 10.0.0 ] :: Anaconda, Inc. on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> 
```

Then type:

```bash
>>> import stdb
>>> import obstools
```

If nothing happens, you're good to go! If you run into a problem, let us know by [raising an issue](https://github.com/MarineSeismologySymposium/SIG-ATaCR/issues). 

