async function jsOpenPopup(url) {
    let promise = new Promise(function(resolve, reject) {
        var win = window.open(url, "New Popup Window", "width=800,height=800");
        var timer = setInterval(function() {
            if (win.closed) {
                clearinterval(timer);
                resolve();
            }
        }, 500);
    });

    let result = await promise;
    return result;
}