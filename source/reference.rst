

##########################
Parts
##########################

**************************
Chapters
**************************

Sections
==========================

Subsections
--------------------------

Subsubsections
^^^^^^^^^^^^^^^^^^^^^^^^^^

Paragraphs
""""""""""""""""""""""""""


inline markup
=============

The standard reST inline markup is quite simple: use

* one asterisk: *text* for emphasis (italics),
* two asterisks: **text** for strong emphasis (boldface), and
* backquotes: ``text`` for code samples.



lists
=================


#. automatically numered list
#. automatically numered list
#. automatically numered list
#. automatically numered list
#. automatically numered list


* This is a bulleted list.
* It has two items, the second
  item uses two lines.

1. This is a numbered list.
2. It has two items too.


* this is
* a list

  * with a nested list
  * and some subitems

* and here the parent list continues



Definitions lists
=================

term (up to a line of text)
   Definition of the term, which must be indented

   and can even consist of multiple paragraphs

next term
   Description.




Field list
=================

:Date: 2001-08-16
:Version: 1
:Authors: - Me
          - Myself
          - I
:Indentation: Since the field marker may be quite long, the second
  and subsequent lines of the field body do not have to line up
  with the first line, but they must be indented relative to the
  field name marker, and they must line up with each other.
:Parameter i: integer


Option list
=================

-a         Output all.
-b         Output both (this description is
           quite long).
-c arg     Output just arg.
--long     Output all day long.

-p         This option has two paragraphs in the description.
           This is the first.

           This is the second.  Blank lines may be omitted between
           options (as above) or left in (as here and below).

--very-long-option  A VMS-style option.  Note the adjustment for
                    the required two spaces.

--an-even-longer-option
           The description can also start on the next line.

-2, --two  This option has two variants.

-f FILE, --file=FILE  These two options are synonyms; both have
                      arguments.

/V         A VMS/DOS-style option.



.. _label-quoting:

Quoting
=================

Literal code blocks are introduced by ending a paragraph with the special marker ::.

Quoted literal blocks::

> Quoted literal blocks are unindented contiguous blocks of text where each line begins
> with the same non-alphanumeric printable 7-bit ASCII character [12].
> A blank line ends a quoted literal block.
> The quoting characters are preserved in the processed document.
> Valid quoting characters are:
> ! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ` { | } ~


Quoted paragraphs

This is an ordinary paragraph, introducing a block quote.

    "It is my business to know things.  That is my trade."

    -- Sherlock Holmes


Line blocks

| These lines are
| broken exactly like in
| the source file.

    | A one, two, a one two three four
    |
    | Half a bee, philosophically,
    |     must, *ipso facto*, half not be.
    | But half the bee has got to be,
    |     *vis a vis* its entity.  D'you see?
    |
    | But can a bee be said to be
    |     or not to be an entire bee,
    |         when half the bee is not a bee,
    |             due to some ancient injury?
    |
    | Singing...


Doctest blocks

Doctest blocks are text blocks which begin with ">>> ", the Python interactive interpreter main prompt, and end with a blank line.

This is an ordinary paragraph.

>>> print 'this is a Doctest block'
this is a Doctest block

The following is a literal block::

    >>> This is not recognized as a doctest block by
    reStructuredText.  It *will* be recognized by the doctest
    module, though!


Code blocks with special highlightning (console):

.. code-block:: console
   :caption: myscript.sh
   :name: myscript

   $ ls -lsa .
   $ make file


Code blocks with special highlightning (perl):

.. code-block:: perl

   use strict;
   use warnings;

   print "This is an example of printf\n";




Supported languages:

* sql
* postgresql
* plpgsql
* psql
* rst
* latex
* bat
* powershell
* bash
* console
* css
* html
* xml
* xslt
* xquery
* javascript
* json
* php
* html+php
* python
* pytb
* pycon
* java
* jproperties
* apacheconf
* r
* rout
* matlab
* matlabsession
* numpy



Tables
=================

+------------------------+------------+----------+----------+
| Header row, column 1   | Header 2   | Header 3 | Header 4 |
| (header rows optional) |            |          |          |
+========================+============+==========+==========+
| body row 1, column 1   | column 2   | column 3 | column 4 |
+------------------------+------------+----------+----------+
| body row 2             | ...        | ...      |          |
+------------------------+------------+----------+----------+



Hyperlinks
=================

This is an `external link <https://domain.com/page/index.htm>`_ of course.

And another one: `<https://domain.com/page/index.htm>`_

Internal links: :ref:`label-quoting`. (works also for references in other documents)

References another document:

- :doc:`My document <reference>`

Download role:

See :download:`this image <images/synchro.jpg>`.



Roles
=================

* emphasis: :emphasis:`text`
* strong: :strong:`text`
* literal: :literal:`text`
* subscript: :subscript:`text`
* superscript: :superscript:`text`
* title-reference: :title-reference:`text`

Directives
==========

Admonitions
-----------

A directive is a generic block of ``explicit markup``

.. DANGER::
   This is a danger!

.. NOTE::
   This is a note

.. WARNING::
   This is a warning!

.. TIP::
   This is a tip

functions
---------

.. function:: foo(x)
              foo(y, z)
   :module: some.module.name

   Return a line of text input from the user.

images
------

.. image:: images/synchro.jpg
   :scale: 30 %
   :alt: this is an alternative text
   :align: center


footnotes
---------

Lorem ipsum [#f1]_ dolor sit amet ... [#f2]_

citations
---------

Standard reST citations are supported, with the additional feature that they are "global", i.e. all citations can be referenced from all files. Use them like so:

This is a pointer to a citation: [MyRef]_.

.. [MyRef] This is a citation
           on two lines


substitutions
-------------

The |synchro| symbol is going to be replaced by the corresponding replacement.

.. |synchro| image:: images/synchro.jpg
                     :scale: 10 %



comments
--------

This is a comment:

.. This is a comment.


This is a multiline comment:

..
   This whole indented block
   is a comment.

   Still in the comment.





HTML metadata
-------------

.. meta::
   :keywords: sphinx, openldap-ltb




.. rubric:: Footnotes

.. [#f1] Text of the first footnote.
.. [#f2] Text of the second footnote.

