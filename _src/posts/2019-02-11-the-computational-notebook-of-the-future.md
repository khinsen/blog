    Title: The computational notebook of the future
    Date: 2019-02-11T14:29:24
    Tags: computational science

Regular readers of this blog may have noticed that I am not very happy with today's state of computational notebooks, such as they were pioneered by Mathematica and popularized by more recent free incarnations such as [Jupyter](https://jupyter.org/), [R markdown](https://rmarkdown.rstudio.com/), or [Emacs/OrgMode](https://orgmode.org/worg/org-contrib/babel/). In this post and the [accompanying screencast](https://peervideo.net/videos/watch/9ed70819-6271-439f-b392-54f34b73c124) (my first one!), I will explain what I dislike about today's notebooks, and how I think we can do better.

<!-- more -->

There are two aspects of notebooks that I consider harmful for scientific communication:

 1. The linear structure of a notebook that forces the narrative to follow the order of the computation.
 2. The impossibility to refer to data and code in a notebook from the outside, and in particular from another notebook, making reuse of code and data impossible.

If you look at a traditional scientific article, or technical report, you will notice that its narrative is structured according to a high-level view of the work. It starts by describing the context of the work, then its goals and a very brief summary of the methods, and right after that it presents results and discusses them. Technical details are only discussed afterwards, once the reader understands why they actually matter. With today's notebooks, the technical details come first: a typical data analysis starts with cleanup and preprocessing steps, and therefore they also come first in the narrative.

An unpleasant side effect of the "narrative follows computation" principle is that some technical details actually cannot be discussed adequately. Scientific methods implemented in software libraries can be summarized in plain English, but the code is elsewhere, managed by a different toolset, and cannot be shown to the reader.

This makes the transition to the second problematic aspect: there is no way to refer to or reuse any specific part of a notebook. Neither the code nor the computed results are accessible from the outside. And that also makes it impossible to build up useful libraries from notebooks.

So far for the criticism - now let's make it constructive. At this point, you should watch the [screencast](https://peervideo.net/videos/watch/9ed70819-6271-439f-b392-54f34b73c124) before reading on. In the screencast, I show a simple data analysis both as a Jupyter notebook and as a demo prototype for what I consider the notebook of the future. This prototype is built using the [Glamorous Toolkit](https://gtoolkit.com/), a very innovative software development environment for [Pharo](https://pharo.org/), which is a modern descendant of [Smalltalk](https://en.wikipedia.org/wiki/Smalltalk). If you want to play with this yourself, the code is [on GitHub](https://github.com/khinsen/computational-documents-with-gtoolkit/). It's really just a demo, because the simplistic approach to organizing the computation that I have used there would not scale to real-life computations (it does a lot of needless recomputation). My plan is to implement the [ActivePapers](https://www.activepapers.org/) approach for managing the computations. GToolkit is alpha software as well. So none of this is ready for prime time, but it does show that better notebooks are possible.

Unlike today's notebooks, which are a sequence of code snippets and documentation paragraphs, the computational documents of my demo are *objects* in the sense of object-oriented programming. Each document contains code, input data, and computed data, which can be accessed from the outside and thus reused in client code. The narrative is merely an additional view into these items, which can present and discuss them in any order that seems suitable for explaining the work. Like with scientific articles, the narrative is typically written in the final stages of the work, once the basic code skeleton is working. In the case of my demo, I started out writing the two Pharo classes, before even installing GToolkit which was a bit unstable at the time.

Note that this "one job, one object, one narrative" approach has a beneficial side effect in encouraging people to do each job well, rather than just well enough for going on with the next job. My Jupyter/Python version of the data analysis only extracts the minimum information required from the input dataset, without even mentioning what else is in there. The GToolkit/Pharo version provides a complete description of the dataset, including the data that is not used at all in the second document that describes the analysis.

Finally, there are other interesting aspects of GToolkit (and Pharo) for computational science, but I will leave them for future posts. I will just mention that the "inspectors" (a term familiar to every Smalltalk developer but probably unknown to anyone else) are easily extensible. Adding a pane that provides yet another view of the document is a matter of writing a couple of lines of Pharo code. It's as if you could implement a new widget for Jupyter in a few lines of Python code right in your notebook.

**Update**: There's a workaround for embedding figures (thanks to Tudor Gîrba for the hint!), which you can find in the current code version on GitHub.
