# tth 4.16-0

- Achim Zeileis takes over maintenance from Friedrich Leisch.

- Upgrade to latest TtH version included in Debian (4.16).

- Declare `USE_C17` as a system requirement in order to avoid errors with
  K&R-style declarations in C23, provided by Brian D. Ripley, Kurt Hornik,
  and the CRAN team.

- Improvements in `Makefile.win` from Kurt Hornik and Tomas Kalibera.


# tth 4.12-0

- Upgrade to latest TtH version included in Debian (4.12).

- Updated `Makefile.win` according to "Writing R Extensions".

- Compile executables using flag `-w`.


# tth 4.3-3

- Added a line to the Windows `Makefile` necessary by new R Windows
  toolchain to include appropriate `Makeconf`.


# tth 4.3-2

- Added an optional character entity reference processing to `tth()`
  and `ttm()`. Thus, to unify how character entities are referenced
  a particular `mode` (`"named"`, `"hex"`, or `"dec"`) can be enfored. For
  example, the "GREEK SMALL LETTER MU" can be referenced as
  `&mu;` (or `&mgr;`) in named mode, or `&#x03BC;` (hex) or `&#956;` (dec).


# tth 4.3-1

- The argument `L` in `tth.control()` can now also be a character
  for the base file (no extension) for LaTeX auxiliary input.


# tth 4.03-0

- First CRAN release of R package `tth` with wrappers to the
  TeX-to-HTML converter `tth()` and the TeX-to-HTML/MathML
  converter `ttm()` from the TtH project of Ian H. Hutchinson,
  see <http://silas.psfc.mit.edu/tth/>.
  
- Both C code and R wrappers are distributed under the GPL-2,
  see the `README` file in the R source package for more details.
