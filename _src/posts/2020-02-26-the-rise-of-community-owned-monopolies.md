    Title: The rise of community-owned monopolies
    Date: 2020-02-26T16:04:54
    Tags: computational science

One question I have been thinking about in the context of reproducible research is this: Why is all stable software technology old, and all recent technology fragile? Why is it easier to run 40-year-old Fortran code than ten-year-old Python code? A hypothesis that comes to mind immediately is growing code complexity, but I'd expect this to be an amplifier rather than a cause. In this pose, I will look at another candidate: the dominance of Open Source communities in the development of scientific software.

<!-- more -->

## From markets to monopolies

In the 1990s, when I was working on my thesis, the world of scientific computing was very different from what it is now. Innovation was driven by hardware. Processor speeds kept increasing, and new processor architectures appeared on the market in rapid succession. In the course of the 1990s, I did most of my work on Unix workstations based on variety of architectures: [PA-RISC](https://en.wikipedia.org/wiki/PA-RISC), [MIPS](https://en.wikipedia.org/wiki/MIPS_architecture), [PowerPC](https://en.wikipedia.org/wiki/PowerPC), [DEC Alpha](https://en.wikipedia.org/wiki/DEC_Alpha). I also worked on mainframe computers made by IBM, Fujitsu, and Cray, all using proprietary processors. Each manufacturer sold a package of hardware, operating system, and development tools such as compilers. Compilers implemented standardized programming languages, mainly Fortran and C, with manufacturer-specific extensions that most people stayed away from because they expected to be using different machines a few years later. The computing platforms that everybody was developing for were not processors nor operating systems, but Fortran~77 and ANSI-C, each of which had developed its ecosystem of scientific libraries. For an interactive development platform, add Unix and X11. Mixing Fortran and C was somewhat platform-specific, but very doable as well. Every time I changed labs and computers during my postdoc years, I had to spend a day or two to reinstall everything I needed, but I never suffered [software collapse](https://hal.archives-ouvertes.fr/hal-02117588).

Today, hardware innovation in mainstream computing has almost come to a halt. All the processor architectures listed above are gone. The x86 architecture, implemented in chips from Intel and AMD, dominates scientific computing, and in fact all of computing except for mobile devices. Hardware manufacturers therefore no longer supply compilers. For everyday work, most people use the free [GNU Compiler Collection](https://en.wikipedia.org/wiki/GNU_Compiler_Collection) or the equally free [Clang](https://en.wikipedia.org/wiki/Clang) compiler. For performance-critical work, commercial compilers from companies such as [NAG](https://www.nag.com/), [PGI](https://www.pgroup.com/index.htm), or [Intel](https://software.intel.com/en-us/compilers) offer better performance and libraries fine-tuned for high-performance computing. The standards defining Fortran and C have evolved, but have maintained strict backwards compatibility.

However, in the everyday life of computational scientists, these traditional platforms have lost importance. A new breed of languages and scientific ecosystems, such as [Python](https://www.python.org/), [R](https://www.r-project.org/), and [Julia](https://julialang.org/), have become the dominant support for scientific software in many (though not all) domains of research. Their rise has gone hand in hand with software collapse becoming so common that many consider it normal or even inevitable. Scientists are starting to adopt heavy technology with large overheads in terms of complexity and invested effort to work around the problem (if you didn't guess yet, I am referring to containers). I waste a lot more time today with configuration and setup work (including configuration debugging) than I did in the 1990s. How did we get into this sad state of affairs? Is there any hope for getting out of it again?

One reason that immediately comes to mind is increasing software complexity. But that's more of a symptom than a cause. A better explanation would be an increased *problem* complexity that would then *require* more complex software. Problem complexity is much harder to measure, but I don't see much evidence supporting this hypothesis. We certainly do bigger computations, on larger datasets, but if I look at today's commonly used models and methods in computational science, they don't look more complex than what I saw in the 1990s. What has increased, however, is variety. Today's science relies on *more* computational models than it did 30 years ago, and I believe that this contributes to the fragility issue, as I will explain later.

There is another reason that I haven't heard anyone mention so far: the disappearance of technology markets in favor of monopolist players who can count on customer lock-in. This description will probably make you think of Microsoft's grip on the Windows user base, or the "walled gardens" that Google and Apple have created around their mobile platforms. But there is another category of monopoly owner in the tech world that is hardly recognized as such: Open Source communities.

## Open Source monopolists

Consider two recent events: Microsoft killing Windows 7, and the Python community killing Python 2. The story is essentially the same in both cases: the creator of a piece of infrastructure software ends support for an old but still widely used version, forcing its users to move on to a later but not fully backwards compatible version. In both cases, a significant part of the user community would have preferred to stick to the older version, as has been nicely [illustrated by xkcd](https://xkcd.com/2224/). In both cases, the end-of-support decision is a rational one for the producer because supporting old versions is costly. And in both cases, the abandoned users have no other supplier they can turn to, because the producer holds a monopoly on the technology.

Compare this to the diverse market of the 1990s. Producers of infrastructure software could add new functionality and try to win new clients with such improvements, but they could not afford to cause damage to their existing user base because users would simply turn to a competitor. There are many sources for standards-conforming Fortran compilers, but there is only one source for Windows or Python.

I suspect some readers will feel anger at this point. How dare you compare a monopolist business to a community of unpaid volunteers offering their work to the world for free? The crucial point is that I am comparing them as seen from the outside. There is a wide gap between the self-image that Open Source communities have of themselves and the image that they present to the outside world, and I believe that this is a big part of the problem.

Open Source communities tend to see themselves as communities of like-minded people that get organized to work together towards shared objectives. They see themselves much like a sports club that organizes practice sessions for its members, or like a village community that collectively plans its road infrastructure. But this is not at all how Open Source communities present themselves to the outside world. The Web site of a sports club says something like "We are a bunch of people enthusiastic about playing football. If you are as well, come and join us." Now look at the [Python Web site](https://www.python.org/). Its first statement, in big letters, is "Python is a programming language that lets you work quickly and integrate systems more effectively." The site is about a product. Its goal is to convince people to use Python, not to join a community. It is more similar to [Microsoft's Windows site](https://www.microsoft.com/fr-fr/windows/) than to the site of a sports club.

"But..." I hear you say. Open Source. Free Software, as in "free beer" *and* in "free speech". And everybody can join in, the community is so welcoming! Fine, but that's again the insiders' view, just slightly enlarged to the circle of people whose engagement with the technology is sufficiently deep that they consider joining the community. I suspect that most people who download and install Python the product will never know anything about the community, and many will even use Python without being aware of it at all. What they are aware of is an application or utility written in Python, e.g. [Calibre](https://calibre-ebook.com/) for managing their e-books, or [offlineimap](https://www.offlineimap.org/) for downloading e-mail. In contrast, a true community-oriented piece of software would have a splash screen saying "Welcome to the Python community! Before using this software, please become familiar wit how our community works".

Sports clubs and village communities focus on their members' needs, interacting with the outside world by necessity, but only as a side effect. Most Open Source communities are more like political parties or non-government organizations in that they *want* to have an impact on the outside world. They care about the popularity of their products, and make efforts to increase their mind share. The reward they get in return is not money, but that's the only difference from how a company works. Both Open Source communities and software companies have an interest in attracting new clients and keeping existing ones. Both can retain clients more efficiently by generating lock-in, and so they do.

Note that I am not saying that either one creates lock-in intentionally. For Open Source communities such as Python, which I know sufficiently well, I am convinced there is no such intention. For companies such as Microsoft or Google, I can't know for sure. But from the clients' perspective, it doesn't matter if lock-in is intentional or a side effect.

One particularity about computing technology is that lock-in happens by default. It takes a conscious effort (and thus an incentive) to *avoid* lock-in. The reason is the fine-grained complexity of software interfaces coupled with the near-zero cost of modifying them. There are so many details that re-implementing an existing interface exactly requires a precise documentation of that interface, a perfectionist attitude, and a lot of time. The markets of the 1990s were made possible only by lengthy and costly standardization processes. Which in turn the participants accepted only because without the markets defined by those standards, none of them could continue to innovate in the field of processor architectures.

## Lock-in favors software collapse

So far for communities as monopoly holders. Back to my original question: how did software collapse become normal? I believe that this is a near-automatic consequence of infrastructure software being managed by monopoly holders. The monopoly situation prevents existing users from moving elsewhere, significantly reducing the effort that needs to be made to keep them. All effort can thus be concentrated on gaining new users, which leads to the paradoxical situation that the needs of non-users have a larger weight in strategic decisions than the needs of the user base. With backwards compatibility being costly, boring, and irrelevant to the non-users that matter for the future, why care about it? That is, in my opinion, what happened to the Scientific Python ecosystem starting in the 2010s: adoption by the explosively growing data science community drowned the existing user base. The best strategy for SciPy was then to focus on the needs of the data science people, which also became the primary source for recruiting developers and maintainers.

Which brings me back to what I said earlier: the diversification of techniques in computational science is part of the problem. While the various subdomains of computational science have overlapping requirements, they also have divergent needs. The longevity of code is one aspect whose importance varies a lot, but there are others: the size of a typical computational task, the size of the datasets being processed, the nature of the algorithms being applied, the hardware platforms that matter most, and many more. While in theory Open Source is good for supporting diversity ("just fork the code and adapt it to your needs"), the reality of today's major Open Source communities is exactly the opposite: a focus on "let's all work together". Combine this with the chronic lack of funding, and thus also a lack of incentives for developing the structured governance that would administrate funding and create activity reports, and you end up with large number of users depending on the work of a small number of inexperienced developers in precarious positions who cannot reasonably be expected to make an effort to even understand the needs of the user base at large. In a way, software collapse is a consequence of [Conway's law](https://en.wikipedia.org/wiki/Conway's_law) applied to Open Source communities.

## Can we do better?

Given that today's tech world is dominated by software and Open Source communities, rather than by hardware-producing companies, is it possible to return to a market situation with no or weak lock-in? I don't think so. Standards-based markets can only form when there are multiple competing producers right from the start. In contrast, Open Source communities start out small and adventurous, with a few growing big and becoming infrastructure suppliers. In the beginning, they have no competition, and when they are big, new communities cannot possibly start to compete with them in the mindshare market. Which leaves two possibilities: Open Source communities could become more user-oriented, or the maintenance of infrastructure software could be ensured by other types of organizations. Let's start by looking at the first possibility.

An important first step would be Open Source communities recognizing that they are developing and selling products to a user base that extends far beyond the circle of potential community members. A good time for that would be just now. Many Open Source communities have recently realized that the shared idealistic goal of an Open Source world is not sufficient for ensuring respectful collaboration, and have reacted by introducing codes of conduct. What I am suggesting here is a similar approach for making the relation with the user base more explicit. The absence of a legal contract between developers and users is one of the core principles of Open Source, but that doesn't imply the absence of moral obligations. Any organization that wants to have an impact on the outside world must consider how this impact affects the life and work of other people. It should then define moral commitments, in written, even if the license prevents them from being legally enforced. A nice example are the
[Big Data Biology Lab Software Tool Commitments](http://big-data-biology.org/software/commitments/).

Open Source communities could also more actively solicit feedback from the outside. Getting useful feedback from low-engagement users is difficult, but there are proxies, for example the people who package software for various distributions.

But perhaps Open Source communities are just not the right form of organization for infrastructure software. There are other entities that create Open Source software, such as the [Mozilla](https://www.mozilla.org/) and [Apache](https://apache.org/) foundations, or hybrids such as the [Pharo community](https://pharo.org/community) with the [Pharo consortium](https://consortium.pharo.org/) and the [Pharo User Association](https://association.pharo.org/) providing channels for users to influence development. It seems probable that more useful organizational forms are waiting to be discovered. In fact, a good guess is that software should best be managed much like other scientific infrastructure: by specific institutions that ensure long-term funding and provide software as a service to research communities.