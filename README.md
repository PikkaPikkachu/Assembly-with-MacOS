# Assembly-with-MacOS

A collection of assembly programs specifically with MacOS system calls and nasm intruction set for 8086 microprocessor. 


## Setup 

### MacOS

```bash
brew install nasm
git clone https://github.com/PikkaPikkachu/Assembly-with-MacOS
cd Assembly-with-MacOS
```

Now cd into any program and run it with the specified intruction at the end of code! 

### Linux 

```bash
git clone https://github.com/PikkaPikkachu/Assembly-with-MacOS
cd Assembly-with-MacOS
```
#### Running the programs 

##### 1. Run on Masm using DOSbox 

Run the following command on terminal:
```bash
dosbox
```

This should open the pre-installed DOSBox. Run the following commands in the DOSBox terminal:

```bash
mount c /path/to/directory/of/asm/file

c:

masm <fileName.asm>

link <fileName.obj>

<fileName.exe>

```

Currently the required `.exe` files have been added in the sub-directory itself which can be run directly.

##### 2. Run with emu8086 and Wine (faster and better)

To setup Wine, run on terminal: 
```bash
sudo apt-get update
sudo apt-get install wine
sudo apt-get install virtualbox

```

Download the `8086emu.exe` file from `/Linux` directory. <br>
Right click and `open-with` Wine.

Install and get started by directly editing and running `.asm` files in the IDE. 

## Tutorials

Get started with [Hello World](https://github.com/PikkaPikkachu/Assembly-with-MacOS/blob/master/MacOSX/hello-world/hello.asm) program in 8086. 

## Contributions

Open to [contributions](https://github.com/PikkaPikkachu/Assembly-with-MacOS/blob/master/CONTRIBUTING.md) of other programs as well!
