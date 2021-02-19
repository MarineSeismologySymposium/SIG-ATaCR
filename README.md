# Special Interest Group on OBS Data Processing at the 2021 Marine Seismology Symposium

---

**Instructors**: [`Helen Janiszewski`](https://helenjaniszewski.squarespace.com) and [`Pascal Audet`](https://www.uogeophysics.com/authors/admin/)

**When**: Wednesday, March 10, 2021 at 9 PM (GMT), 11 AM (HST = GMT - 10:00) 4 PM (EST = GMT - 5:00)

**Where**: On zoom (link to follow)

**What**: This SIG will provide hands-on tutorials to process broadband ocean-bottom seismic (BBOBS) data using the Automatic Tilt and Comliance Removal (ATaCR, pronounced "attacker") software. As the name suggests, this software was designed to automate (as best as possible) the process of correcting vertical component BBOBS data for contaminating noise effects due to instrument tilt and infra-gravity noise on the seafloor. The software is available in two languages: Matlab and Python. The session will first introduce common practice and pitfalls when working with noisy BBOBS data and perform basic quality control, then break out into two rooms where participants will follow live tutorials using ATaCR. 

**How to prepare**: To streamline the live tutorial sessions, we ask participants to pre-register to either the Matlab or Python session and install ATaCR with demo data. Details are outlined below.

---

### Installing the Matlab version

- Git repository: [`ATaCR`](https://github.com/helenjanisz/ATaCR)

Documentation can be found [`here`](https://github.com/helenjanisz/ATaCR/blob/master/ATaCR_Manual.pdf)

To install the Matlab version of ATaCR, navigate on the command line to a path where the software will be installed

- Clone the `atacr` repository ([`fork`](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) it first, if you consider contributing):

```bash
git clone https://github.com/helenjanisz/ATaCR
cd ATaCR
```

You are ready to go!

---

### Installing the Python version

ATaCR is implemented as a separate module in the open-source Python package OBStools:

- Git repository: [`OBStools`](https://github.com/nfsi-canada/OBStools)

Documentation can be found [`here`](https://nfsi-canada.github.io/OBStools/)

To install `obstools`, we strongly recommend creating a `conda environment` where the code can be installed alongside its dependencies. This **significantly reduces** the potential conflicts in package versions. In a bash (or zsh) terminal, follow these steps:

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

Now you're ready to install `obstools`. There are two options: 1) you want to look at the source code and are considering contributing to the code (awesome!!); 2) you are only interested in using the code and not bother with the source.

#### 1) Installing from source

- Navigate on the command line to a path where the software will be installed

- Clone the `obstools` repository ([`fork`](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) it first, if you are serious about contributing):

```bash
git clone https://github.com/paudetseis/OBStools.git
cd OBStools
```

- Install using `pip`:

```bash
pip install -e .
```

#### 2) Installing from the Python Package Index (PyPI):

```bash
pip install obstools
```

##### Getting the demo data

Finally, download the demo data provided on this github repository by navigating to some work folder (where the data and results of the processing will be located) and typing:

```bash
git clone https://github.com/MarineSeismologySymposium/SIG-ATaCR
cd SIG-ATaCR
```

The `DATA` folder should now be on your computer and you are ready to start the tutorial!

##### Testing your installation

If you want to make sure everything is installed properly, make sure your conda environment has been activated and open a python window:

```bash
python
```

which will produce 

```bash
Python 3.8.5 (default, Sep  4 2020, 02:22:02) 
[Clang 10.0.0 ] :: Anaconda, Inc. on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> 
```

Then

```bash
>>> import stdb
>>> import obstools
```

If nothing happens, you're good to go!
