# Avoid Google Search redirects

[![Firefox Version](https://img.shields.io/amo/v/avoid-google-search-redirects.svg?style=popout&logo=mozilla%20firefox&colorB=green)](https://addons.mozilla.org/firefox/addon/avoid-google-search-redirects/)

## Description

This add-on prevents Google Search tracking you with redirect links. Rather
than detecting and repairing the intercepted links, which can be complex and
fragile, it disables the JavaScript function which Google uses to rewrite the
links.

### Details

When you hover over a Google Search result, the target link seems to be the
right one but when you click on this link, the target is replaced with a link
to a Google tracker, which is used to record the external links you visit.

To achieve this, Google Search uses an `onmousedown` event on result links.
This event rewrites the target link by using a function called `rwt`. This
add-on simply replaces this `rwt` function with an empty function, so nothing
happens on click and you go directly to the result.

The original idea comes from the
[Remove Google Redirect in Google Results](https://chrome.google.com/webstore/detail/remove-google-redirect-in/miaghkkhkjklnijffegcpjlhdjelnkke)
add-on.

This add-on is packaged as a WebExtension and so is compatible with Firefox 57+ (November 2017).

## Report issues, improvements

Source code can be found on GitHub: https://github.com/Trim/avoid-google-search-redirects

You can use this repository to open issues and feature requests.

## See Also

- [google-redirect-rewrite-remove](https://addons.mozilla.org/en-US/firefox/addon/google-redirect-rewrite-remove/) - uses a similar technique to this add-on, but in a less robust way
- [Remove Google Redirect in Google Results](https://chrome.google.com/webstore/detail/remove-google-redirect-in/miaghkkhkjklnijffegcpjlhdjelnkke) - the original inspiration for this add-on
