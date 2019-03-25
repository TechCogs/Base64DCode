/**************************************************************************
 * Base64DCode                                                            *
 * by Tech Cogs                                                           *
 * Copyright (C) 2019 Tech Cogs                                           *
 * Licensed under the GPLv3                                               *
 *                                                                        *
 * A simple command line program for encoding and decoding data           *
 * in base64.                                                             *
 **************************************************************************/

import std.stdio;
import std.base64;
import std.string;

enum VERSION = 1.0;

void main() {
  writeln();
  writeln("Welcome to Base64DCode v", VERSION);
  writeln("Copyright (C) 2019 Tech Cogs");
  writeln("Code licensed under GPLv3");
  writeln();
  write("(E)ncode or (D)code >");
  string input = toUpper(strip(readln()));
  writeln();
  write("Enter string >");
  string text = strip(readln());
  if (input == "E") {
    writeln("Encoding ", text);
    try {
      // Convert text into a ubyte array
      ubyte[] data;
      foreach (c; text) {
        data ~= c;
      }
      string result = Base64.encode(data);
      writeln();
      writeln("Text version:");
      writeln(result);
    }
    catch(Exception e) {
      writeln("Exception while encoding:  ", e.msg);
    }
  }
  else if (input == "D") {
    writeln("Decoding ", text);
    try {
      ubyte[] result = Base64.decode(text);
      writeln();
      writeln("Text version:");
      // Convert ubyte array into text
      foreach (i; result) {
        char c = i;
        write(c);
      }
      writeln();
      writeln();
      writeln("Byte array version:");
      writeln(result);
    }
    catch(Exception e) {
      writeln("That doesn't appear to be valid data.");
    }
  }
  else {
    writeln("That command isn't recognized.");
  }
}
