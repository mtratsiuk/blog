# The One Where I Create a Blog About Nothing

Still not sure whether I _really_ wanted to start a blog or just hack something together over the weekend, but here we are. How many TV show references did you spot in the title by the way?

## A blog in 2024. Really?

Back in the early 2010s instagram, facebook, twitter and the likes were places where you could follow your two-and-a-half friends and just check once in a while if they did something fun without inviting you.

Today, all of those places are being run by _The Algorithm_, throwing hundreds of mostly quite useless, but incredibly addictive threads and posts right in your face the second you open up an app. Without you ever asking for any of it.

Getting tired of all the "content", I was sort of trying to keep my distance from those platforms lately. However, I am a mortal too and also want to leave my trail on the Internet from time to time like everyone else. Therefore - a blog.

## OK, you wanted a blog. But rolling your own site generator for it?

I've written a tiny little CLI app in [Go](https://go.dev/) to render this blog from markdown pages - [b3](https://github.com/mtratsiuk/b3). I know, I know. [Jekyll](https://jekyllrb.com/), [Gatsby](https://www.gatsbyjs.com/), [Eleventy](https://www.11ty.dev/), etc... A lot of open-source tools to choose from. Nevertheless, I can still think of multiple reasons to build my own thing.

### Because I can

Some people build their own houses, some fix their cars, some [DIY](https://en.wikipedia.org/wiki/Do_it_yourself) many other things. I can slap some `if`s and `else`s together to make computers do things - so why not put this skill to use?

### To practice, learn and have fun

Daily software engineering job is not _always_ fun and exciting. And it shouldn't be really - it takes a fair share of discipline and routine to keep complex things running. However, if you enjoy programming itself as a process - hacking something together over a weekend could be a great recreational activity. No metrics, no alerts, no test coverage thresholds, no "best practices" - pure joy and creative freedom.

I've previously followed this logic a few years ago when decided to revamp my [personal home page](https://misha.spris.dev/). Instead of simply changing existing css and page content, I ended up (re)[inventing](https://github.com/mtratsiuk/mtratsiuk.github.io/commit/02e6f01e2eb928a6e37745e0cc008fe93f430fcf#diff-7ae45ad102eab3b6d7e7896acd08c427a9b25b346470d7bc6507b6481575d519) html templating engine ("rustache" - named after [mustache](https://mustache.github.io/)) and custom JSON-like file format parser ("ron" - rustache object notation) in [Rust](https://www.rust-lang.org/). It has definitely been fun - _rustache_ converts input into html in a single pass, while _ron_ ended up being a more traditional implementation with [lexer](https://en.wikipedia.org/wiki/Lexical_analysis#Lexical_token_and_lexical_tokenization) and [recursive-descent](https://en.wikipedia.org/wiki/Recursive_descent_parser) parser.

Rust is an amazing and ambitious language, but I've learned that I probably shouldn't use it unless there is a really good reason to. I understand that most of my struggles were driven by skill issues - but the amount of effort it takes to gain those skills and then employ them in almost every line of code you write?.. Sometimes it just feels like you're solving a clever Rust puzzle and when done, you're so proud of yourself - you don't even remember what brought you here in the first place. It's a roller coaster really - it seems so good to write all these enum types and pattern matchings, only to realize an hour later that to avoid `.clone()` here you have to go back and pass those annoying little `'a` lifetime annotations through the whole module.

I didn't back down easily of course and used it again for some of the [advent of code 2022](https://github.com/mtratsiuk/adventofcode/tree/master/aoc-2022/src/bin) problems. And then [added "pipes" support](https://github.com/mtratsiuk/mtratsiuk.github.io/compare/f9e0603f80aaf2ba520751b987dd91965893ca68...080649da724d36e267ccc3736a96ff4dfa376118) to the _rustache_ using [parser combinators](https://en.wikipedia.org/wiki/Parser_combinator) approach. But enough is enough and I'm _going with go_ this time - less of fun, more of getting things done.

### To minimize dependencies

Alright, this was not supposed to be yet another programming language rant.

The real reason I think it's worth writing some things yourself - is because I want those tools to just work over a long time. If 3 years from now I'd like to add RSS generation to my blog, I don't want to see a full screen of security warnings pointing at the endless list of indirect npm dependencies. I don't want to migrate to a new major release every few years to stay up-to-date. If I come back to this thing in 10, 20 or 40 years - I don't want to see more than one dependency that I need to figure out how to install and get running, and it's better just be some reasonably sane language compiler.

Now, I didn't write a markdown parser myself this time (at least not yet), so there is a third-party dependency in b3. However I used [goldmark](https://github.com/yuin/goldmark), which itself only uses the standard library, and I've also [go vendored](https://go.dev/ref/mod#vendoring) it into my repo - so it's still kind of fits into my box of thinking.

## One neat go feature for content

To wrap this one up I'll just leave a reference to a pretty cool `go:embed` feature that is available out of the box - <https://pkg.go.dev/embed>. Essentially, you can use a comment directive in your go source code like so:

```go
//go:embed *.html
var viewsFs embed.FS

//go:embed player.png
var Player []byte
```

and go compiler will embed those static assets right into the binary. So far it was a really quick and simple way to work with html templates or game assets and not worry about how to deploy/distribute and then load them at runtime correctly.

🫡
