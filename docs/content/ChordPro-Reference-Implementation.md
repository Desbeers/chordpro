---
title: "The ChordPro Reference Implementation"
description: "The ChordPro Reference Implementation"
---

# The ChordPro program

The ChordPro program provides support for the ChordPro file format. It
is a reference implementation, it augments the file specification in
cases that are insufficiently clear.

# Overview of features

{{< toc >}}

## Native PDF generation

While PostScript was a good choice in 1992, nowadays PDF is much
better. Not only for printing, but also for viewing on PCs, phones,
tablets and so on. ChordPro produces PDF documents natively, i.e.,
without the help of 3rd party tools.

Collections of songs can be combined in a songbook with clickable
table of contents, cover and back pages, and much more.

## Unicode support

The original `chord` program was already revolutionary in supporting
the ISO-8859.1 character set for input, allowing most european
languages to be processed. ChordPro takes all input in UTF-8 encoded
UNICODE but falls back to ISO-8859.1 if needed.
When the input files contain a [Byte Order
Mark](https://en.wikipedia.org/wiki/Byte_order_mark), UTF-16 and
UTF-32 are also handled automatically.

Note that the default fonts that ChordPro uses only have limited support for
non-Latin1 characters. If you need more extensive Unicode support, you
must configure ChordPro to use TrueType or OpenType fonts that have
sufficient Unicode support.

See [ChordPro supports UNICODE. Then why can't I see my russian (vietnamese, greek, ...) characters?]({{< relref "FAQ-Unicode-characters" >}})

## User defined note naming systems

The most common way to write chords is by using the Dutch (common) system of note names: `C`, `D`, `E` and so on.

ChordPro supports alternative note naming systems by means of settings
in the configuration files. Built-in support is provided for Latin
names (`Do`, `Re`, `Mi`, ...) and German names (`C`, `D`, `E` ... `A`,
`B`, `H`).

ChordPro can _transcode_ between note naming systems. You can provide
a song with common names and have it print Latin names and so on.

## User defined chords and tunings, not limited to 6 strings

Originally developed for guitar players, `chord` was hard coded to
support 6-string instruments. This frustrated mandolin, banjo and
ukulele players. ChordPro lifts this limitation and allows an
arbitrary number of strings.

## Support for keyboard diagrams

For keyboard players, ChordPro can show  keyboard
diagrams instead of string diagrams.

![]({{< asset "images/ex_kbdiagram.png" >}})

## Support for Nashville Numbering and Roman Numbering

Often asked for, and ChordPro got it: Nashville Numbering and Roman Numbering of chords.

## Fully customizable layout, fonts and sizes

Using configuration files you can not just change fonts and sizes, but you get total control over the appearance of the output. Margins, headers, footers, columns, and more.

## Support for external TrueType and OpenType fonts

While this may be considered a feature, it is in fact a necessity since most basic fonts do not have sufficient support for UNICODE.

## A basic but effective GUI version

Traditionally a command line program, `chord` was not a trivial tool
for users of Windows based systems. ChordPro adds WxChordPro, a GUI
version of the program.
Available on Microsoft Windows, Linux and macOS.

## What is missing?

There are just a few Chord<sub>ii</sub> features that ChordPro does not, and will not, support:

* The notion of ‘easy’ and ‘hard’ chords.  
The [chord]({{< relref "Directives-chord" >}}) directive can be used if you want diagrams for specific chords.

* The asterisk mark for user defined chords. It is more confusing than
  helpful.

* Logical pages, i.e. 2-up and 4-up printing.  
PDF viewers and print tools can do that for you.

## More information

* [Installation]({{< relref "ChordPro-Installation" >}})
* [Configuration]({{< relref "ChordPro-Configuration" >}})
* [User guide]({{< relref "Using-ChordPro" >}})
* [Release info]({{< relref "ChordPro-Reference-RelNotes" >}})
