module Html.Attributes where
{-| Helper functions for HTML attributes. They are organized roughly by
category.

Every attribute is labeled with which HTML tags it can work with according to
the HTML5 specification, so just search for <video> if you are looking for
something like the `src` attribute which can reasonably be considered a part of
many categories and may not appear where you expect.

# Global Attributes
Common attributes that can be attached to any HTML tag.
@docs class, id, title, hidden

# Embedded Content
@docs src, height, width

# Audio and Video
@docs autoplay, controls, loop, preload, poster, default, kind, label, srclang

# Header Stuff
@docs async, charset, content, defer, httpEquiv, language, scoped

# Less Common Global Attributes
Attributes that can be attached to any HTML tag but are less commonly used.
@docs accesskey, contenteditable, contextmenu, dir, draggable, dropzone,
      itemprop, lang, spellcheck, tabindex
-}

import String

-- This library does not include low, high, or optimum because the idea of a
-- <meter> is just too crazy.


-- GLOBAL ATTRIBUTES

{-| Often used with CSS to style elements with common properties. -}
class : String -> Attribute
class name =
    attr "className" name

{-| Indicates the relevance of an element. -}
hidden : Bool -> Attribute
hidden bool =
    toggle "hidden" bool

{-| Often used with CSS to style a specific element. The value of this attribute must be unique. -}
id : String -> Attribute
id name =
    attr "id" name

{-| Text to be displayed in a tooltip when hovering over the element. -}
title : String -> Attribute
title name =
    attr "title" name


-- LESS COMMON GLOBAL ATTRIBUTES

{-| Defines a keyboard shortcut to activate or add focus to the element. -}
accesskey : Char -> Attribute
accesskey char =
    attr "accesskey" (String.cons char String.empty)

{-| Indicates whether the element's content is editable. -}
contenteditable : Bool -> Attribute
contenteditable bool =
    attr "contenteditable" (if bool then "true" else "false")

{-| Defines the ID of a <menu> element which will serve as the element's context menu. -}
contextmenu : String -> Attribute
centextmenu value =
    attr "centextmenu" value

{-| Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left) -}
dir : String -> Attribute
dir value =
    attr "dir" value

{-| Defines whether the element can be dragged. -}
draggable : String -> Attribute
draggable value =
    attr "draggable" value

{-| Indicates that the element accept the dropping of content on it. -}
dropzone : String -> Attribute
dropzone value =
    attr "dropzone" value

itemprop : String -> Attribute
itemprop value =
    attr "itemprop" value

{-| Defines the language used in the element. -}
lang : String -> Attribute
lang value =
    attr "lang" value

{-| Indicates whether spell checking is allowed for the element. -}
spellcheck : Bool -> Attribute
spellcheck bool =
    attr "spellcheck" (if bool then "true" else "false")

{-| Overrides the browser's default tab order and follows the one specified instead. -}
tabindex : Int -> Attribute
tabindex n =
    attr "tabindex" (show n)

data <object> Specifies the URL of the resource.
data-* Global attribute Lets you attach custom attributes to an HTML element.


-- HEADER STUFF

{-| Indicates that the script should be executed asynchronously. For <script>.
-}
async : Bool -> Attribute
async bool =
    toggle "async" bool

{-| Declares the character encoding of the page or script. Common values include:

  * UTF-8 - Character encoding for Unicode
  * ISO-8859-1 - Character encoding for the Latin alphabet

For <meta> and <script>.
-}
charset : String -> Attribute
charset value =
    attr "charset" value
{-| A value associated with http-equiv or name depending on the context. For <meta>.
-}
content : String -> Attribute
content value =
    attr "content" value

{-| Indicates that the script should be executed after the page has been parsed.
For <script>.
-}
defer : Bool -> Attribute
defer bool =
    toggle "defer" bool

{-| This attribute is an indicator that is paired with the `content` attribute,
indicating what that content means. `httpEquiv` can take on three different
values: content-type, default-style, or refresh. For <meta>.
-}
httpEquiv : String -> Attribute
httpEquiv value =
    attr "httpEquiv" value

{-| Defines the script language used in the element. For <script>.
-}
language : String -> Attribute
language value =
    attr "language" value

{-| Indicates that a style should only apply to its parent and all of the
parents children. For <style>.
-}
scoped : Bool -> Attribute
scoped bool =
    toggle "scoped" bool


-- EMBEDDED CONTENT

{-| The URL of the embeddable content. For <audio>, <embed>, <iframe>, <img>,
<input>, <script>, <source>, <track>, and <video>.
-}
src : String -> Attribute
src value =
    attr "src" value

{-| Declare the height of a <canvas>, <embed>, <iframe>, <img>, <input>,
<object>, or <video>.
-}
height : String -> Attribute
height value =
    attr "height" value

{-| Declare the width of a <canvas>, <embed>, <iframe>, <img>, <input>,
<object>, or <video>.
-}
width : String -> Attribute
width value =
    attr "width" value

{-| Alternative text in case an image can't be displayed. For <area>, <img>,
and <input>.
-}
alt : String -> Attribute
alt value =
    attr "alt" value


-- AUDIO and VIDEO

{-| The audio or video should play as soon as possible.
For <audio> and <video>.
-}
autoplay : Bool -> Attribute
autoplay bool =
    toggle "autoplay" bool

{-| Indicates whether the browser should show playback controls to the user.
For <audio> and <video>.
-}
controls : Bool -> Attribute
controls bool =
    toggle "controls" bool

{-| Indicates whether the media should start playing from the start when it's finished.
For <audio> and <video>.
-}
loop : Bool -> Attribute
loop bool =
    toggle "loop" bool

{-| Indicates whether the whole resource, parts of it or nothing should be preloaded.
For <audio> and <video>.
-}
preload : Bool -> Attribute
preload bool =
    toggle "preload" bool

{-| A URL indicating a poster frame to show until the user plays or seeks. For <video>.
-}
poster : String -> Attribute
poster value =
    attr "poster" value

{-| Indicates that the track should be enabled unless the user's preferences
indicate something different. For <track>.
-}
default : Bool -> Attribute
default bool =
    toggle "default" bool

{-| Specifies the kind of text track. For <track>. -}
kind : String -> Attribute
kind value =
    attr "kind" value

{-| Specifies a user-readable title of the text track. For <track>.
-}
label : String -> Attribute
label value =
    attr "label" value

{-| A two letter language code indicating the language of the track text data.
For <track>.
-}
srclang : String -> Attribute
srclang value =
    attr "srclang" value


-- IFRAMES

{-| A space separated list of security restrictions you'd like to lift for an
<iframe>.
-}
sandbox : String -> Attribute
sandbox value =
    attr "sandbox" value

{-|  Make an <iframe> look like part of the containing document. -}
seamless : Bool -> Attribute
seamless bool =
    toggle "seamless" bool

{-| An HTML document that will be displayed as the body of an <iframe>. It will
override the content of the `src` attribute if it has been specified.
-}
srcdoc : String -> Attribute
srcdoc value =
    attr "srcdoc" value


-- INPUT

{-| Defines the type of a <button>, <input>, <embed>, <object>, <script>,
<source>, <style>, or <menu>.
-}
type' : String -> Attribute
type' value =
    attr "value" value

{-| Defines a default value which will be displayed in the element on page load.
For <button>, <option>, <input>, <li>, <meter>, <progress>, <param>.
-}
value : String -> Attribute
value value =
    attr "value" value

{-| Indicates whether the element is checked. For <input>.
-}
checked : Bool -> Attribute
checked bool =
    toggle "checked" bool

{-| Provides a hint to the user of what can be entered in the field.
For <input> and <textarea>.
-}
placeholder : String -> Attribute
placeholder value =
    attr "placeholder" value

{-| Defines a value which will be selected on page load.
For <option>.
-}
selected : Bool -> Attribute
selected bool =
    toggle "selected" bool


-- INPUT HELPERS

{-| List of types the server accepts, typically a file type.
For <form>, <input>.
-}
accept : String -> Attribute
accept value =
    attr "accept" value

{-| List of supported charsets. For <form>.
-}
acceptCharset : String -> Attribute
acceptCharset value =
    attr "acceptCharset" value

{-| The URI of a program that processes the information submitted via the form.
For <form>.
-}
action : String -> Attribute
action value =
    attr "action" value

{-| Indicates whether controls in this form can by default have their values
automatically completed by the browser. For <form> and <input>.
-}
autocomplete : Bool -> Attribute
autocomplete bool =
    attr "autocomplete" (if bool then "on" else "off")

{-| The element should be automatically focused after the page loaded.
For <button>, <input>, <keygen>, <select>, and <textarea>.
-}
autofocus : Bool -> Attribute
autofocus bool =
    toggle "autofocus" bool

{-| Specify a unique ID such that previous entries will be persisted across
page loads. The previous entries will be displayed as suggestions. For <input>.
-}
autosave : String -> Attribute
autosave value =
    attr "autosave" value

{-| Indicates whether the user can interact with the element. For <button>,
<fieldset>, <input>, <keygen>, <optgroup>, <option>, <select> and <textarea>.
-}
disabled : Bool -> Attribute
disabled bool =
    toggle "disabled" bool

{-| How the form data should be encoded when submitted with the POST method.
Options include: application/x-www-form-urlencoded, multipart/form-data, and
text/plain. For <form>.
-}
enctype : String -> Attribute
enctype value =
    attr "enctype" value

{-| Indicates the action of the element, overriding the action defined in the <form>.
For <input> and <button>.
-}
formaction : String -> Attribute
formaction value =
    attr "formaction" value

{-| Associates an <input> with a <datalist> tag. The datalist gives some
pre-defined options to suggest to the user as they interact with an input.
The value of the list attribute must match the id of a <datalist> node.
For <input>.
-}
list : String -> Attribute
list value =
    attr "list" value

{-| Defines the maximum number of characters allowed in the element.
For <input> and <textarea>.
-}
maxlength : Int -> Attribute
maxlength n =
    attr "maxlength" (show n)

{-| Defines which HTTP method to use when submitting the form. Can be GET (default) or POST.
For <form>.
-}
method : String -> Attribute
method value =
    attr "method" value

{-| Indicates whether multiple values can be entered in an input of the type email or file.
For <input> and <select>.
-}
multiple : Bool -> Attribute
multiple bool =
    toggle "multiple" bool

{-| Name of the element. For example used by the server to identify the fields
in form submits. For <button>, <form>, <fieldset>, <iframe>, <input>, <keygen>,
<object>, <output>, <select>, <textarea>, <map>, <meta>, and <param>.
-}
name : String -> Attribute
name value =
    attr "name" value

{-| This attribute indicates that the form shouldn't be validated when submitted.
For <form>.
-}
novalidate : Bool -> Attribute
novalidate bool =
    toggle "novalidate" bool

{-| Defines a regular expression which the element's value will be validated against.
For <input>.
-}
pattern : String -> Attribute
pattern value =
    attr "pattern" value

{-| Indicates whether the element can be edited. For <input> and <textarea>.
-}
readonly : Bool -> Attribute
readonly bool =
    toggle "readonly" bool

{-| Indicates whether this element is required to fill out or not.
For <input>, <select>, and <textarea>.
-}
required : Bool -> Attribute
required bool =
    toggle "required" bool

{-| For <input> specifies the width of an input in characters.

For <select> specifies the number of visible options in a drop-down list.
-}
size : Int -> Attribute
size n =
    attr "size" (show n)

{-| The element ID described by this <label> or the element IDs that are used
for an <output>.
-}
for : String -> Attribute
for value =
    attr "for" value

{-| Indicates the element ID of the <form> that owns this particular <button>,
<fieldset>, <input>, <keygen>, <label>, <meter>, <object>, <output>,
<progress>, <select>, or <textarea>.
-}
form : String -> Attribute
form value =
    attr "form" value


-- RANGES

{-| Indicates the maximum value allowed. When using an input of type number or
date, the max value must be a number or date. For <input>, <meter>, and <progress>.
-}
max : String -> Attribute
max value =
    attr "max" value

{-| Indicates the minimum value allowed. When using an input of type number or
date, the min value must be a number or date. For <input>, <meter>.
-}
min : String -> Attribute
min value =
    attr "min" value

{-| Add a step size to an <input>. -}
step : Int -> Attribute
step n =
    attr "step" (show n)


--------------------------


{-| Defines the number of columns in a <textarea>. -}
cols : Int -> Attribute
cols n =
    attr "cols" (show n)

{-| Defines the number of rows in a <textarea>. -}
rows : Int -> Attribute
rows n =
    attr "rows" (show n)

{-| Indicates whether the text should be wrapped in a <textarea>. Possible
values are "hard" and "soft".
-}
wrap : String -> Attribute
wrap value =
    attr "wrap" value


-- MAPS

{-| When an <img> is a descendent of an <a> tag, the `ismap` attribute
indicates that the click location should be added to the parent <a>'s href as
a query string.
-}
ismap : String -> Attribute
ismap value =
    attr "ismap" value

{-| Specify the element ID of a <map> that should be used for an <img>,
<input>, or <object>.
-}
usemap : String -> Attribute
usemap value =
    attr "usemap" value

{-| Declare the shape of the clickable area in an <a> or <area>. Valid values
include: default, rect, circle, poly. This attribute can be paired with
`coords` to create more particular shapes.
-}
shape : String -> Attribute
shape value =
    attr "shape" value

{-| A set of values specifying the coordinates of the hot-spot region in an
<area>. Needs to be paired with a `shape` attribute to be meaningful.
-}
coords : String -> Attribute
coords value =
    attr "coords" value


-- KEY GEN

{-| A challenge string that is submitted along with the public key in a <keygen>.
-}
challenge : String -> Attribute
challenge value =
    attr "challenge" value

{-| Specifies the type of key generated by a <keygen>. Possible values are:
rsa, dsa, and ec.
-}
keytype : String -> Attribute
keytype value =
    attr "keytype" value


-- REAL STUFF

{-| Specifies the horizontal alignment of a <caption>, <col>, <colgroup>,
<hr>, <iframe>, <img>, <table>, <tbody>,  <td>,  <tfoot> , <th>, <thead>, or
<tr>.
-}
align : String -> Attribute
align value =
    attr "align" value

{-| Contains a URI which points to the source of the quote or change in
<blockquote>, <del>, <ins>, <q>.
-}
cite : String -> Attribute
cite value =
    attr "cite" value


-- LINKS AND AREAS

{-| The URL of a linked resource, such as <a>, <area>, <base>, or <link>. -}
href : String -> Attribute
href value =
    attr "href" value

{-| Specify where the results of clicking an <a>, <area>, <base>, or <form>
should appear. Possible special values include:

  * _blank &mdash; a new window or tab
  * _self &mdash; the same frame (this is default)
  * _parent &mdash; the parent frame
  * _top &mdash; the full body of the window

You can also give the name of any <frame> you have created.
-}
target : String -> Attribute
target value =
    attr "target" value

{-| Indicates that clicking an <a> and <area> will download the resource
directly.
-}
download : Bool -> Attribute
download bool =
    toggle "download" bool

{-| Indicates that clicking an <a> and <area> will download the resource
directly, and that the downloaded resource with have the given filename.
-}
downloadAs : String -> Attribute
downloadAs value =
    attr "download" value

{-| Two-letter language code of the linked resource of an <a>, <area>, or <link>.
-}
hreflang : String -> Attribute
hreflang value =
    attr "hreflang" value

{-| Specifies a hint of the target media of a <a>, <area>, <link>, <source>,
or <style>.
-}
media : String -> Attribute
media value =
    attr "media" value

{-| Specify a URL to send a short POST request to when the user clicks on an
<a> or <area>. Useful for monitoring and tracking.
-}
ping : String -> Attribute
ping value =
    attr "ping" value

{-| Specifies the relationship of the target object to the link object.
For <a>, <area>, <link>.
-}
rel : String -> Attribute
rel value =
    attr "rel" value


-- CRAZY STUFF

{-| Indicates the date and time associated with the element.
For <del>, <ins>, <time>.
-}
datetime : String -> Attribute
datetime value =
    attr "datetime" value

{-| Indicates whether this date and time is the date of the nearest <article> ancestor element.
For <time>.
-}
pubdate : String -> Attribute
pubdate value =
    attr "pubdate" value


-- LISTS

{-| Indicates whether an ordered list <ol> should be displayed in a descending
order instead of a ascending.
-}
reversed : Bool -> Attribute
reversed bool =
    toggle "reversed" bool

{-| Defines the first number of an ordered list if you want it to be something
besides 1.
-}
start : Int -> Attribute
start n =
    attr "start" (show n)


-- TABLES

{-| The colspan attribute defines the number of columns a cell should span.
For <td>, <th>.
-}
colspan : String -> Attribute
colspan value =
    attr "colspan" value

{-| IDs of the <th> elements which applies to this element.
For <td>, <th>.
-}
headers : String -> Attribute
headers value =
    attr "headers" value

{-| Defines the number of rows a table cell should span over.
For <td>, <th>.
-}
rowspan : String -> Attribute
rowspan value =
    attr "rowspan" value

{-|  
For <th>.
-}
scope : String -> Attribute
scope value =
    attr "scope" value

{-|  
For <table>.
-}
summary : String -> Attribute
summary value =
    attr "summary" value


{-| Specifies the URL of the document's cache manifest.
For <html>.
-}
manifest : String -> Attribute
manifest value =
    attr "manifest" value

{-|  
For <col>, <colgroup>.
-}
span : String -> Attribute
span value =
    attr "span" value

{-| Indicates whether the details will be shown on page load.
For <details>.
-}
open : String -> Attribute
open value =
    attr "open" value

