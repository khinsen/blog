    Title: The computational notebook of the future (part 2)
    Date: 2019-05-09T14:07:39
    Tags: computational science

A while ago I [wrote about my ideas for a successor of today's
computational
notebooks.](http://blog.khinsen.net/posts/2019/02/11/the-computational-notebook-of-the-future/)
Since then I have made some progress on a prototype implementation,
which is the topic of this post. Again I have made a companion
[screencast](https://vimeo.com/339361206) so that you can get a better idea of how all this works in practice.

<!-- more -->

As a reminder, the two aspects of today's notebooks
([Mathematica](https://www.wolfram.com/mathematica/),
[Jupyter](https://jupyter.org/), [R
markdown](https://rmarkdown.rstudio.com/),
[Emacs/OrgMode](https://orgmode.org/worg/org-contrib/babel/)) that I
consider harmful for scientific communication are:

1. The linear structure of a notebook that forces the narrative to
   follow the order of the computation.

2. The impossibility to refer to data and code in a notebook from the
   outside, and in particular from another notebook, making reuse of
   code and data impossible.

Like the demo that I made last time, and which is best qualified as a
quick hack, the computational document that I am presenting today is
implemented in [Pharo](https://pharo.org/) and builds on the
[Glamorous Toolkit](https://gtoolkit.com/), which is an innovative
development environment designed around the notion of "moldable
development", which means that developers should be able to adapt
their tools to their specific needs with little effort. This is
precisely what I have done. The code is [on
GitHub](https://github.com/activepapers/activepapers-pharo) and
includes the example document from the demo.

Contrary to today's notebooks, my computational documents consist of
two distinct layers, which I show for an example in the screencast. A
*workflow layer* consists of *scripts* (short pieces of code) that
compute *datasets* keep track of the data dependencies. The workflow
layer can be visualized as a graph. Scripts and datasets make up a
standard Pharo object that can be used as a building block in
subsequent work, unlike the code and data in today's notebooks. For
example, the Pharo expression `InfluenzaLikeIllnessInFrance data
absoluteIncidence` yields one of the data frames from my example
document and can be used in any type of Pharo code, including code in
another document.

On top of that workflow layer, there is a documentation layer
consisting of a Wiki-style multi-page document in which each page can
contain code snippets. These code snippets are intended for data
presentation (plotting etc.) and for demonstrations (examples,
verifications, etc.) They are not accessible from outside their pages,
and they cannot change the datasets computed by the workflow. The
documentation pages can refer to and include the datasets, the
scripts, but also arbitrary other Pharo code. In particular, this
allows including library code used by the workflow scripts in the
documentation layer, as opposed to today's notebooks for which library
code is undocumentable black-box code.

A third essential element is the *playground* attached to the
workflow. This is where interactive exploration takes place. Code
snippets in the playground can access datasets just like scripts, but
they cannot modify them. The playground is meant both for authors and
for readers. Authors develop scripts incrementally in the playground,
and turn them into scripts (at the click of a button) when they are
satisfied. Readers can write code snippets for exploring the data in
more detail.

The code is currently "demo quality", so please don't rely on it for
your own research. Even the underlying GToolkit library is still
advertised as alpha level. There is a reason for calling this the
future rather than the present! However, there are a few conclusions
that I am already willing to draw from this work:

 1. An authoring environment for computational documents should also
    be a more general software development environment.  If you have
    to change tools for switching from library code to a computational
    document or back, you have a technological barrier to overcome
    that creates a mental separation between "inside" and "outside",
    whereas the science that you want to communicate is on both sides
    of your barrier.

 2. The emphasis on making all code and data explorable that has been
    part of Smalltalk culture from the start is highly beneficial for
    computational science as well.  Notebook environments such as
    Jupyter or RStudio feel extremely limited compared to the standard
    Pharo environment, let alone the more advanced GToolkit.

 3. Decomposing the computation into smaller independent scripts
    with well-defined interfaces makes it more understandable.
    In the traditional linear notebooks, you never know how far
    further down a temporary variable will be used. You must
    read the code from top to bottom to be sure not to miss
    something. Likewise, separating "essential" computations
    on the data from "superficial" computations such as plotting
    makes the overall scientific logic stand out better.

4. A good authoring environment must support the full lifecycle of
    computer-aided research, starting with interactive exploration and
    iterating towards a computational document optimized for the
    reader rather than the author. Today's notebooks do not provide
    this support by sticking to a linear structure that is
    satisfactory only in the initial stages of the lifecycle.
