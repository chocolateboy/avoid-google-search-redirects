function rwt () { return true } // same return value as the original

if (window.wrappedJSObject.rwt) {
    // assign it as a read-only property to prevent it being overridden
    Object.defineProperty(window.wrappedJSObject, 'rwt', {
        value: exportFunction(rwt, window),
        writable: false,
        configurable: false,
    })
}
