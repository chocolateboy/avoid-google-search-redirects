# Google Direct

[![Firefox Version](https://img.shields.io/amo/v/google-direct.svg?style=popout&logo=mozilla%20firefox&colorB=green)](https://addons.mozilla.org/firefox/addon/google-direct/)

<!-- TOC -->

- [NAME](#name)
- [INSTALLATION](#installation)
- [DESCRIPTION](#description)
  - [Why?](#why)
  - [Screenshots](#screenshots)
    - [Before (Intercepted Link)](#before-intercepted-link)
    - [After (Direct Link)](#after-direct-link)
- [COMPATIBILITY](#compatibility)
- [CREDITS](#credits)
- [SEE ALSO](#see-also)
- [VERSION](#version)
- [AUTHORS](#authors)
- [LICENSE](#license)

<!-- TOC END -->

## NAME

Google Direct - remove tracking links from Google Search results

## INSTALLATION

- [AMO](https://addons.mozilla.org/firefox/addon/google-direct/)

## DESCRIPTION

This is a Firefox addon which removes tracking from Google Search results by
disabling the JavaScript function which rewrites links when clicked.

### Why?

There are many addons which do this, but most do so by detecting links,
disabling their event handlers, and restoring their URLs, which can be fragile
and fiddly. Typically these addons are dozens or even hundreds of lines long
and have to be updated each time the HTML changes.

By contrast, this addon just disables the `window.rwt` function which is used
to hijack external links, so the implementation is much simpler (effectively
just a single line) and the protection is much more reliable as the same
tracking technique has been used unchanged for
[years](https://security.stackexchange.com/a/126403).

### Screenshots

#### Before (Intercepted Link)

[![Intercepted Link](https://i.imgur.com/CDmyLE9.png)](https://i.imgur.com/CDmyLE9.png)

#### After (Direct Link)

[![Direct Link](https://i.imgur.com/ld1NUS6.png)](https://i.imgur.com/ld1NUS6.png)

## COMPATIBILITY

- Firefox 57+ (Desktop)

## CREDITS

This addon is a fork/rewrite of
[Avoid Google Search redirects](https://github.com/Trim/avoid-google-search-redirects)
by [Adrien Dorsaz](https://github.com/Trim), which
[no longer works](https://github.com/Trim/avoid-google-search-redirects/pull/4),
and that addon is a Firefox version of the Chrome addon,
[Remove Google Redirect in Google Results](https://chrome.google.com/webstore/detail/remove-google-redirect-in/miaghkkhkjklnijffegcpjlhdjelnkke)
by [hq6](https://github.com/hq6).

## SEE ALSO

- [anti_rwt](https://github.com/raffaeleflorio/anti_rwt) - a Web Extension which uses the same technique as this addon (not on AMO)
- [DeGoogle For Chrome](https://github.com/hq6/DeGoogle_Chrome) - the original inspiration for Avoid Google Search redirects ([Chrome Web Store version](https://chrome.google.com/webstore/detail/remove-google-redirect-in/miaghkkhkjklnijffegcpjlhdjelnkke))
  - [DeGoogle For Firefox](https://github.com/hq6/DeGoogle_Firefox) - Firefox version (no longer available on AMO)
- [google-redirect-rewrite-remove](https://addons.mozilla.org/en-US/firefox/addon/google-redirect-rewrite-remove/) - uses the same technique as this add-on, but in a less robust way

## VERSION

1.0.0

## AUTHORS

- [Adrien Dorsaz](https://github.com/Trim) (original version)
- [chocolateboy](mailto:chocolate@cpan.org)

## LICENSE

This addon is free software; you can redistribute and/or modify it under the
terms of the [GPL](https://www.gnu.org/copyleft/gpl.html).
