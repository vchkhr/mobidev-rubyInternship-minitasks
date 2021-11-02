# Task 4

## Usage

### Create file

1. Execute `ruby app.rb` in the Terminal.
2. Enter file name.
3. Select extension.

Script will generate appropriate file.

`.html` file will have this content:

```html
<h1>Hello title</h1>
<p>Some text</p>
<h1>Section Title<h1>
<p>Section Text</p>
<a href="http://url.com">Link text</a>
<img src="https://raw.githubusercontent.com/adam-p/markdown-here/master/src/common/images/icon48.png" alt="alt text">
```

`.md` file will have this content:

```md
# Hello title
Some text
# Section Title
Section Text
[Link text](http://url.com)
![alt text](https://raw.githubusercontent.com/adam-p/markdown-here/master/src/common/images/icon48.png)
```

### Delete files

Execute `rake cleanup` in the Terminal.

Script will delete all `.html` and `.md` files in the `build/` directory.
