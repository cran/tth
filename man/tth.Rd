\name{tth}
\alias{tth}
\alias{ttm}
\alias{tth.control}

\title{R Interface to the tth/ttm TeX to HTML Converter}

\description{ Convert TeX or LaTeX markup to HTML or HTML+MathML. Works
  for snippets as well as complete documents.
}

\usage{
tth(x, \dots, fixup = TRUE, Sweave = TRUE, mode = NULL)
ttm(x, \dots, fixup = TRUE, Sweave = TRUE, mode = NULL)

tth.control(a = FALSE, c = FALSE, d = FALSE, e = 2, f = NULL, g = FALSE,
  i = FALSE, j = NULL, L = TRUE, n = NULL, p = NULL, r = TRUE,
  t = FALSE, u = FALSE, w = NULL, y = 2, xmakeindxcmd = NULL, v = FALSE)
}
\arguments{
  \item{x}{character vector of (La)TeX code.}
  \item{fixup}{logical. Should the resulting code be fixed up by deleting blank or
    empty lines and by replacing certain math symbols (such as not lower/greater etc.)?}
  \item{Sweave}{logical. Should the Sweave code environments Sinput/Soutput be
    replaced by verabtim (and Schunk deleted) prior to conversion with \code{tth}/\code{ttm}?}
  \item{mode}{character. If this is set to \code{"hex"}, \code{"dec"}, or \code{"named"},
    the corresponding mode is enforced for all character entity references. See also the details.}
  \item{\dots}{arguments passed to \code{tth.control}.}
  \item{a}{logical. Attempt automatic picture environment conversion
    using \code{latex2gif}? Default omit.}
  \item{c}{logical. Prefix header \code{"Content-type: text/HTML"} (for direct web serving)?}
  \item{d}{logical. Disable definitions with delimited arguments? Default enable.}
  \item{e}{numeric specifying epsfbox handling: \code{0} no conversion, just ref.
    \code{1} convert to png/gif using user-supplied ps2png/gif.
    \code{2} (default) convert and include inline.}
  \item{f}{numeric specifying limit for built-up fraction nesting in display
    equations to \code{0} to \code{9}. Default is \code{5}. For \code{tth} only.}
  \item{g}{logical. Remove (instead of guessing intent of) font commands. Default guess font/size.}
  \item{i}{logical. Use italic font for equations (like TeX)? Default roman.
    For \code{tth} only.}
  \item{j}{numeric specifying index page length. Default is 20 lines.}
  \item{L}{logical or character. If logical: Should LaTeX commands (e.g., frac) be enabled
    without a docmentclass line? If character: The base file (no extension) for LaTeX
    auxiliary input.}
  \item{n}{numeric HTML title format control: \code{0} raw, \code{1} expand macros, \code{2} expand
    equations.}
  \item{p}{character specifying additional directories (paths) to search for input files.}
  \item{r}{logical. Raw HTML output (omit header and tail) for inclusion in other files?}
  \item{t}{logical. Display built-up items in textstyle equations? Default is inline.
    For \code{tth} only.}
  \item{u}{logical. Use unicode character encoding? Default is ISO-8859-1 (latin1).}
  \item{w}{numeric specifying HTML writing style. Default is no head/body tags,
    \code{0} no title, \code{1} single title only, head/body tags. \code{2} XHTML.
    For \code{tth} only.}
  \item{y}{numeric specifying equation style:\code{1} compress vertically,
    \code{2} inline overaccents.}
  \item{xmakeindxcmd}{character specifying command for making index. Default is makeindex.}
  \item{v}{logical or numeric. Give verbose commentary? Verbosity level can also be
    \code{0} (none, same as \code{FALSE}), \code{1} (same as \code{TRUE}),
    \code{2} (even higher verbosity for debugging).}
}

\details{
  \code{tth} and \code{ttm} are simple R wrapper functions,
  calling command line tools of the same name which either need to be
  provided by the R package \pkg{tth} or be installed on the system (and
  available in the search path). The command line tools have been
  written by Hutchinson (2017) and a detailed manual is available online
  at \url{http://silas.psfc.mit.edu/tth/}.

  By default, the results of \code{tth} and \code{ttm} are processed further
  to accomodate the \code{Sweave} environments and \code{fixup} certain
  math symbols. Furthermore, optionally a particular \code{mode} for character
  entity references (mathematical symbols, greek letters, and other special characters)
  can be enforced. For example, the greek small letter mu
  can be represented in \code{"named"} mode (\code{&mgr;} or \code{&mu;}),
  in \code{"hex"} mode (\code{&#x03BC;}) or \code{"dec"} model (\code{&#956;}).
  Plain \code{tth} employs \code{"dec"} mode while plain \code{ttm} employs
  \code{"named"} mode. But setting \code{mode = "hex"} would convert all
  character entity references to hex mode etc.
  See \url{https://www.w3.org/TR/xml-entity-names/bycodes.html} for the list of
  character entity references employed and
  \url{https://html.spec.whatwg.org/multipage/named-characters.html}
  for a somewhat nicer display.
}

\value{ \code{tth}/\code{ttm} return a character vector with HTML
  code. \code{tth.control} returns a character vector with collapsed
  (non-default) control arguments.  }

\references{
  Hutchinson IH (2022). \emph{TtH: The TeX to HTML Translator}, Version 4.16.
  \url{http://silas.psfc.mit.edu/tth/}
}

\examples{
tex <- c("This is \\\\textbf{bold} and this \\\\textit{italic}.",
  "Points on the unit circle: $x^2 + y^2 = 1$.")
tth(tex)
ttm(tex)

h0 <- "$H_0: \\\\mu_0 = 0$"
tth(h0)
tth(h0, mode = "hex")
tth(h0, mode = "named")
ttm(h0)
ttm(h0, mode = "hex")
ttm(h0, mode = "dec")
}

\keyword{utilities}
