
# Markdown - Extensions

## GitHub and Other Extensions

GitHub markdown extensions are widely used by programmers who publish their code on GitHub. Among others, these extensions enable inclusion of mathematical formulas written i LaTech format. There are also several other extensions that allow writing mathematical formulas.


### Writing Mathematical Formulas with GitHub Extensions

The Section *[Writing mathematical expressions](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions) in GitHub documentation* provides some basic information on how to write mathematical formulas with GitHub markdown. Below are some examples from this document. You will only be able to see them correctly if you have software that can render the Github-extended syntax.

This sentence uses `$` delimiters to show math inline:  $\sqrt{3x-1}+(1+x)^2$


This sentence uses \$\` and \`\$ delimiters to show math inline:  $`\sqrt{3x-1}+(1+x)^2`$

**The Cauchy-Schwarz Inequality**
$$\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)$$

Alternatively, you can use the ```math code block syntax to display a math expression as a block. With this syntax, you don't need to use $$ delimiters.

```math
\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)
```


### Viewing Extended Markdown with Mathematical Formulas in VS Code

There are some ***Visual Studio Code*** extensions that can render markdown documents with various extensions in the *markdown preview window*.

You can check out the *Markdown Preview Github Styling* for viewing markdown documents with GitHub extensions.

Another extension that is particularly useful for writing and viewing mathematical formulas in markdown documents is [Mathpix Markdown](https://marketplace.visualstudio.com/items?itemName=mathpix.vscode-mathpix-markdown). Install this extension in order to view formulas in Virual Studio Code's Markdown preview. Beside mathematical formulas, this extension can also render many other types of LaTex rendering. See the [Syntax reference](https://mathpix.com/docs/mathpix-markdown/syntax-reference) for more information. There are some examples below.

```smiles
OC(=O)c1cc(Cl)cs1
```

$$
x = \frac { - b \pm \sqrt { b ^ { 2 } - 4 a c } } { 2 a }
$$

$$
y = \frac { \sum _ { i } w _ { i } y _ { i } } { \sum _ { i } w _ { i } } , i = 1,2 \ldots k
$$

$$
l ( \theta ) = \sum _ { i = 1 } ^ { m } \log p ( x , \theta )
$$

$$
\int_0^\infty \frac{x^3}{e^x-1}\,dx = \frac{\pi^4}{15}
$$ 
$$
\| x + y \| \geq | \| x | | - \| y \| |
$$


Example LaTeX syntax:

```
\begin{align*}
t _ { 1 } + t _ { 2 } = \frac { ( 2 L / c ) \sqrt { 1 - u ^ { 2 } / c ^ { 2 } } } { 1 - u ^ { 2 } / c ^ { 2 } } = \frac { 2 L / c } { \sqrt { 1 - u ^ { 2 } / c ^ { 2 } } }
\end{align*}
```

renders into:

\begin{align*}
t _ { 1 } + t _ { 2 } = \frac { ( 2 L / c ) \sqrt { 1 - u ^ { 2 } / c ^ { 2 } } } { 1 - u ^ { 2 } / c ^ { 2 } } = \frac { 2 L / c } { \sqrt { 1 - u ^ { 2 } / c ^ { 2 } } }
\end{align*}


$$\begin{array}{c}
\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} &
= \frac{4\pi}{c}\vec{\mathbf{j}}    \nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\

\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\

\nabla \cdot \vec{\mathbf{B}} & = 0
\end{array}$$


# Links to More Information

* [W3Schools Markdown Tutorial](https://www.w3schools.io/file/markdown-introduction/)
* [Markdown Guide - Introduction](https://www.markdownguide.org/getting-started/)
  * [Cheat Sheet](https://www.markdownguide.org/cheat-sheet/)
  * [Basic Syntax](https://www.markdownguide.org/basic-syntax/)
  * [Extended syntax](https://www.markdownguide.org/extended-syntax/) (not supported by all markdown viewers and editors)
* *Extensions - Mathematical Formulas:*
  * [Mathpix Markdown](https://marketplace.visualstudio.com/items?itemName=mathpix.vscode-mathpix-markdown)
  * [Mathematics in R Markdown](https://rpruim.github.io/s341/S19/from-class/MathinRmd.html)
