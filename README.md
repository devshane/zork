```
Welcome to Dungeon.        This version created 11-MAR-91.
You are in an open field west of a big white house with a boarded front door.
There is a small mailbox here.
>
```

# DUNGEON (AKA Zork)

**Public Domain Source Code for the Mainframe Game "Dungeon"**

This repository contains the Public Domain source code for *Dungeon*, the mainframe version of the game that served as the precursor to Infocom's commercial *Zork* trilogy.
This codebase is a C port derived from the FORTRAN source of **Zork 2.6**.


## Installation

### Fedora Linux

This package is available in the official Fedora Linux repositories.
You can install it directly via the command-line:

```bash
sudo dnf install zork
```

### Building from Source

To build the game from the source files in this repository:

```bash
make
```


## Modern Maintainership & Philosophy (2013-12 to present)

**Current Maintainers:**

* Shane Thomas ([@devshane](https://github.com/devshane))
* Jan Drögehoff ([@Jan200101](https://github.com/Jan200101))
* Justin Wheeler ([@justwheel](https://github.com/justwheel))

**Project Philosophy:**

This project utilizes the FORTRAN source of *Dungeon* (Zork 2.6) as its foundation.
The primary design goal is code preservation.
We aim to maintain the logic and behavior of the game as accurately as possible while updating the codebase to compile and run on modern C compilers and operating systems.


## History of the Implementation

This version of *Dungeon* has been modified from FORTRAN to C.
The historical lineage of this code is as follows:

1. **Original Development (MDL)**:
   The original game (initially titled *Zork*) was written in the MDL programming language (MUDDLE) at the MIT Laboratory for Computer Science.
2. **PDP-11 Translation (FORTRAN)**:
   Bob Supnik translated the MDL source into DEC FORTRAN for the PDP-11, renaming the game *Dungeon*.
3. **UNIX Port (f77)**:
   The FORTRAN version was subsequently ported to `f77` for UNIX systems.
4. **C Translation**:
   The C translation was generated from the `f77` version using `f2c`.
   `f2c` is a FORTRAN-to-C translator written by David Gay (AT&T Bell Labs), Stu Feldman (Bellcore), Mark Maimone (Carnegie-Mellon University), and Norm Schryer (AT&T Bell Labs).

*Note on Zork I:*
While often conflated, *Dungeon* differs from *Zork I*.
*Zork I* is a microcomputer adaptation comprising approximately one-third of the original mainframe game's map and puzzles.
*Dungeon* represents the more complete, albeit earlier, mainframe experience.

### I. From original game documentation

To: Dungeon Players
From: "The Translator"
Subj: Game Information
Date: 8-OCT-80


This is the first (and last) source release of the PDP-11 version of 
Dungeon.

Please note that Dungeon has been superceded by the game ZORK(tm).
The following is an extract from the new product announcement for
ZORK in the September, 1980 issue of the RT-11 SIG newsletter:

  "'ZORK:  The Great Underground Empire - Part I' ...was developed
   by the original authors based on their ZORK (Dungeon) game for
   the PDP-10.  It features a greatly improved parser;  command
   input and transcript output files;  SAVEs to any device and
   file name;  and adaptation to different terminal types,
   including a status line on VT100s.  Note:  this is not the
   FORTRAN version that has been available through DECUS.  This
   version has been completely rewritten to run efficiently on
   small machines - up to 10 times as fast as the DECUS version.

   ...ZORK runs under RT-ll, HT-ll, or RSTS/E and requires as
   little as 20K words of memory and a single floppy disk drive.
   The game package, consisting of an RX01-format diskette and
   an instruction booklet, is available from Infocom, Inc.,
   P.O. Box 120, Kendall Station, Cambridge, Ma. 02142."

ZORK(tm) is a trademark of Infocom, Inc.  It is available for several
popular personal computers as well as for the PDP-ll.

### II. DEC FORTRAN to f77 Conversion (1981-11-17)

The conversion from DEC FORTRAN to Unix f77 was done by **Randy Dietrich, Lynn Cochran and Sig Peterson**.
Much hacking was done to get it to fit in the limited address space of a PDP-11/44 (split I/D).
Suffice it to say that by leaving out the debugging package and not linking in the f77 i/o library, they managed to get it to run.

### III. PDP to VAX (1985-12)

Based on the work of Randy, Lynn and Sig, **Bill Randle** folded in the full save/restore functions and the game debugging package (gdt) into the PDP version to create a Vax/Unix version.
This version also uses f77 i/o, thus eliminating the extra speak and listen processes needed on the PDP.

### IV. Cleanup I (1986-12-11)

**John Gilmore** (hoptoad!gnu) cleaned up the source files by moving most of the common declarations into include files and added comments from the original (_FORTRAN or MDL?_) source.
His efforts are greatly appreciated.

### V. Cleanup II (1987-02-09)

**Bill Randle** added the PDP dependencies back into the Vax source files with `#ifdef`s in order to have just one set of sources.
Previously, there were two sets of source: one for the PDP and one for the Vax.
In addition, a shell escape of the form `!cmd` was added and the wizard can enter the gdt without having to recompile the source.
Finally, a man page was generated, based on the `dungeon.doc` file.

### VI. f77 to C (1991-03-11)

**Ian Lance Taylor** used the `f2c` translator to generate C source code.
The resulting code was modified to remove the FORTRAN I/O library, to add simple more processing, and to change the format of the database file.
**Andre Srinivasan** helped test it.
**Jonathan Mark** made it work under MS-DOS and Microsoft C.
