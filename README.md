# OpenDaytona
Understanding Daytona USA ...
The primary focus of this project is to understand, fix and possibly port Daytona USA to modern platforms without the need for emulation, so the failing model2 boards can rest.

## Status
Currently data is being gathered and code is being documented ;-)

## Steps
* Documenting the Assembly
  - the first step is to understand what the i960 is actually doing
  - the second step is to understand the TGP copros, which is used for most math stuff.

* fix / enhance the i960 code
  - there might be some things to fix or add
    - spectator mode?
    - 16 player network?

* porting the game code
  - The assembly could be converted to C or C++ at some point, and then ported to various platforms, also the 3D math and rendering use OpenGL

* provide a __real__ replacement for the Model2 boards
  - possibly rasbperry pi based
