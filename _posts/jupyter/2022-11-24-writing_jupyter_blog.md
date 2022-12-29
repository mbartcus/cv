---
layout: single
title:  "Learn how to blog using Jupyter notebooks"
date:   2022-11-24 15:38:07 +0100
categories: functional programming, python, loop, map(), filter(), reduce()
permalink: "/:categories:title"
toc: true
toc_label: "My Table of Contents"
toc_sticky: true
---


```python
from IPython.core.display import Image
Image('https://www.python.org/static/community_logos/python-logo-master-v3-TM-flattened.png')
```




    
![png](./index_1_0.png)
    




```python
print("Welcome to Academic!")
```

    Welcome to Academic!


## Install Python and JupyterLab

[Install Anaconda](https://www.anaconda.com/distribution/#download-section) which includes Python 3 and JupyterLab.

Alternatively, install JupyterLab with `pip3 install jupyterlab`.

## Create or upload a Jupyter notebook

Run the following commands in your Terminal, substituting `<MY-WEBSITE-FOLDER>` and `<SHORT-POST-TITLE>` with the file path to your Academic website folder and a short title for your blog post (use hyphens instead of spaces), respectively:

```bash
mkdir -p <MY-WEBSITE-FOLDER>/content/post/<SHORT-POST-TITLE>/
cd <MY-WEBSITE-FOLDER>/content/post/<SHORT-POST-TITLE>/
jupyter lab index.ipynb
```

The `jupyter` command above will launch the JupyterLab editor, allowing us to add Academic metadata and write the content.

## Edit your post metadata

The first cell of your Jupter notebook will contain your post metadata ([front matter](https://sourcethemes.com/academic/docs/front-matter/)).

In Jupter, choose _Markdown_ as the type of the first cell and wrap your Academic metadata in three dashes, indicating that it is YAML front matter: 

```
---
layout: single
title:  "Learn how to blog using Jupyter notebooks"
date:   2022-11-24 15:38:07 +0100
categories: functional programming, python, loop, map(), filter(), reduce()
permalink: "/:categories:title"
toc: true
toc_label: "My Table of Contents"
toc_sticky: true
---
```

Edit the metadata of your post

## Convert notebook to Markdown

```bash
jupyter nbconvert index.ipynb --to markdown --NbConvertApp.output_files_dir=.
```

## Example

This post was created with Jupyter.


```python

```
