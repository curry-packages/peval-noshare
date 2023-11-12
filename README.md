peval-noshare
=============

This package contains a partial evaluator for Curry implemented in Curry
by Elvira Albert, German Vidal (UPV), and Michael Hanus (CAU Kiel).
Note that this partial evaluator is based on technical results
published in 2002 and *does not consider sharing*.
As a consequence, the partial evaluator is correct only for programs
which do not contain non-deterministic operations,
i.e., are confluent in the sense of classical term rewriting systems.

This partial evaluator is integrated in PAKCS as follows:

* After loading some program into PAKCS, this
  program can be partially evaluated by the command ":peval".

* The expressions to be partially evaluated must be marked in the
  program by (PEVAL ...) where PEVAL is the identity function
  (defined in the standard prelude).

* The marked expressions are partially evaluated and replaced by
  their partially evaluated versions. This modified program is
  stored in "<prog>_pe.fcy" provided that <prog> is the name
  of the source program.

* The partially evaluated program "<prog>_pe.fcy" is automatically
  loaded into PAKCS. Although there is no Curry source file for this
  program, the (decompiled) source can be viewed by the command ":show"
  (if you are interested to see the result of the partial evaluation).

If you want to run this version stand-alone (i.e., independent from PAKCS),
you can partially evaluate program <prog>.curry by the shell command

    curry-pevalns <prog>

