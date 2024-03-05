
# Markdown

Markdown is a simple syntax for creating formatted text document.

## Basics

Paragraphs have one empty line between them.
Just a newline does not introduce a new paragraph. This text is not in a new paragraph.

There must be an empty line between the first and the second paragraph. This text is placed in a new paragraph because there is an empty ine between the previous text and this text.

# Headings

Main headings are introduced with the hash signs (#) followed by space in the beginning of a new line.
There is a main heading above this paragraph and there is also one in the beginning of this document.

Headings of different levels are introduced with multiple hash signs in the beginning of a line.

## This is a heading level 2

### This is a heading level 3

#### This is a heading level 4

# Emphasis

Italic text is *enclosed between a pair of single asterisks* or between _single underscores_.

Bold text is **enclosed between double asterisks** or between __double underscores__.

Bold and italic text is ***eclosed between tripple asterisks*** or between ___tripple underscores___. 

Highlighted text is enclosed ==between double equal signs==. Visal Studio Code does not show highlighted text by default.

# Code Blocks

Fenced code blocks should appear between a pair of tripple backticks (inverted apostrophes, `) or a pair of tripple tildes (~), which must appear in separate lines before and after the block:

```
{
  "Name": "Anka",
  "Surname": "Smith",
  "Country": "Austria",
  "City": "Viena",
  "Courses": 4
}
```

Syntax highlighting is provided in some viewers. In order to provide syntax highlighting, the first tripple backticks or tildes must be followed by language specification:

```json
{
  "Name": "Anka",
  "Surname": "Smith",
  "Country": "Austria",
  "City": "Viena",
  "Courses": 4
}
```

~~~csharp
{
  int Square(int param)
  {
    return param*param;
  }
}
~~~

# Markdown Extensions

## GitHub Extensions, Mathematical Formulas

There are several markdown extensions that extend the markdown syntax with additional possibilities. A well known is GitGub's extension, which is widely used by programmers that publish their code on GitHub.

More information about this extension is in [markdown_github_extensions.md](markdown_github_extensions.md)


# Links to More Information

* [W3Schools Markdown Tutorial](https://www.w3schools.io/file/markdown-introduction/)
* [Markdown Guide - Introduction](https://www.markdownguide.org/getting-started/)
  * [Cheat Sheet](https://www.markdownguide.org/cheat-sheet/)
  * [Basic Syntax](https://www.markdownguide.org/basic-syntax/)
  * [Extended syntax](https://www.markdownguide.org/extended-syntax/) (not supported by all markdown viewers and editors)

