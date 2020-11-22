    Title: The four possibilities of reproducible scientific computations
    Date: 2020-11-20T17:57:22
    Tags: reproducible research, scientific computing

Computational reproducibility has become a topic of much debate in recent years. Often that debate is fueled by misunderstandings between scientists from different disciplines, each having different needs and priorities. Moreover, the debate is often framed in terms of specific tools and techniques, in spite of the fact that tools and techniques in computing are often short-lived. In the following, I propose to approach the question from the scientists' point of view rather than from the engineering point of view. My hope is that this point of view will lead to a more constructive discussion, and ultimately to better computational reproducibility.

<!-- more -->

The format of my proposal is inspired by the well-known ["four freedoms" that define Free Software](https://www.gnu.org/philosophy/free-sw.en.html). The focus of reproducibility is not on legal aspects, but on technical ones, and therefore my proposal is framed in terms of *possibilities* rather than freedoms.

## The four essential possibilities

A computation is reproducible if it offers the four essential possibilities:

1. The possibility to inspect all the input data and all the source code that can possibly have an impact on the results.
2. The possibility to run the code on a suitable computer of one's own choice in order to verify that it indeed produces the claimed results.
3. The possibility to explore the behavior of the code, by inspecting intermediate results, by running the code with small modifications, or by subjecting it to code analysis tools.
4. The possibility to verify that published executable versions of the computation, proposed as binary files or as services, do indeed correspond to the available source code.

All of these possibilities come in degrees, measured in terms of the effort required to actually do what is supposed to be possible. For example, inspecting the source code of a computation is much easier for a notebook containing the top-level code, with links to repositories of all dependencies, than for a script available from the authors on request. Moreover, the degree to which each possibility exists can strongly vary over time. A piece of software made available on an institutional Web site is easily inspectable while that site exists, but inspectability drops to zero if the Web site closes down.

The reproducibility profile of a computation therefore consists of four time series, each representing one of the possibilities expressed on a suitable scale with its estimated time evolution. The minimum requirement for the label "reproducible" is a non-zero degree for all four possibilities for an estimated duration of a few months, the time it takes for new work to be carefully examined by peers.

## Rationale

The possibility to inspect all the source code is required to allow independent verification of the software's correctness, and in particular to check that it does what its documentation claims it does.

The possibility to run the code is required to allow independent verification of the results.

The possibility to explore the behavior of the code is a *de facto* requirement to fully accomplish the goals of the first possibility. For all but the most trivial pieces of software, inspection of the source code is not enough to convince oneself that it does what it is claimed to do.

The possibility of verifying the correspondence of source code and executable versions is motivated by the complexity of today's software build procedures. Mistakes can as easily be introduced in the build process as in the source code itself. This point is well made by Ken Thompson's Turing Award speech [Reflections on Trusting Trust](https://www.cs.cmu.edu/~rdriley/487/papers/Thompson_1984_ReflectionsonTrustingTrust.pdf), if you replace mischief by mistake in his arguments.

## Discussion in the context of the state of the art

The possibility to inspect all the source code is a criterion that is in principle widely accepted, although many people fail to realize its wide-ranging consequences. "All the source code that can possibly have an impact on the results" actually means a *lot* of software. It includes many libraries, but also language implementations such as compilers and interpreters. Moreover, inspecting a dependency first of all requires precisely identifying it. This remains a difficult task today, and therefore most published computations today do not offer the first essential possibility, no matter how much effort a reader is willing to invest.

It is tempting to introduce another degree of compliance by requiring that only the most relevant parts of the total source code be inspectable. However, that defies the whole purpose of independent verification. Who decides what it relevant? Usually the author of the computation. But if the code declared to be irrelevant by the author is not inspectable, we have to take the author's word for its irrelevance.

The possibility to run the code is also a widely accepted criterion, though not everyone accepts the additional requirement of executability "on a suitable computer of one's own choice". Software made available as a service (e.g. in the cloud) is considered sufficient for reproducibility by some researchers. Executability is much more susceptible to decay over time than inspectability of the source code, and this is one of the main topics of debate today. Is long-term reproducibility needed? Is it achievable? The answers vary across disciplines. There is unfortunately a strong tendency to auto-censoring here: many scientists believe that long-term reproducibility is not realistic and *therefore* should not be asked for. This is definitely not true and it is better to frame the question as a trade-off: what is a reasonable price to pay for long-term reproducibility, in a given discipline?

The possibility to explore the behavior of the code is rarely mentioned in discussions of reproducibility. And in fact, exploring the behavior of non-trivial code written by someone else is such a difficult task that many scientists prefer not to require anyone to do it. I am not aware of any scientific journal that expects reviewers of submitted work to check the code of any computation for correctness or at least plausible correctness, which in practice requires examining its behavior. And yet, the scientific method requires *everything* to be inquirable. It may not be a realistic expectation today, but it should at least be a goal for the future.

Since code explorability is rarely required or even discussed, there is no clear profile of practical implementations either. It's a criterion that requires expert judgement, the expert being a fellow researcher from the same discipline as the author of a computation. It is the software analog of a "well-written" paper, which is a paper that a reader can easily "get into".

The possibility of verifying the correspondence of source code and executable versions is also rarely mentioned. It is also the least fundamental one of the four essential possibilities, because in principle it can be abandoned if a computation is fully reproducible from source code. In practice, however, that is rarely a realistic option. The size and complexity of today's software assemblies makes it impractical to re-build everything from source code, a process that can take many hours. Nearly all software assemblies we run in scientific computing contain some components obtained in pre-built binary form. While it is perfectly OK for most people, most of the time, to use such pre-built binaries, inquirability requires the possibility to check that these binaries really correspond to the source code that the authors of a computation claim to have used. This is a possibility where a low degree can be quite acceptable.

## Please comment!

As I said, the goal of this blog post is to start a discussion. Your comments are valuable, possibly more so than the post itself. How important are the four possibilities in your own discipline? How well can they be realized within the current state of the art? Are there additional possibilities you consider important for reproducibility?

Check also the comments on Twitter by exploring the replies to [this tweet](https://twitter.com/khinsen/status/1329832546474061824).


## Notes added after publication

### 2020-11-22

[Jeremy Leipzig](https://twitter.com/jermdemo/status/1329866889867059200) points out 
[the 2012 ICERM workshop document](https://icerm.brown.edu/topical_workshops/tw12-5-rcem/icerm_report.pdf), whose appendix A discusses several levels of reproducibility. Its last level ("open or reproducible research") covers in a general way the four possibilities I discuss above. The lower levels describe research output in which at least one of the four possibilities is not provided.
