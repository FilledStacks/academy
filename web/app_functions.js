function getPlatform() {
    return navigator.platform;
}

async function jsPromiseFunction(message) {
    let msg = message;
    let promise = new Promise(function(resolve, reject) {
        resolve('Hello: ' + message );
    });
    let result = await promise;
    return result;
}


async function jsOpenPopup(url) {
    let promise = new Promise(function(resolve, reject) {
        var win = window.open(url,"New Popup Window","width=800,height=800");
        var timer = setInterval(function() {
                if (win.closed) {
                    clearInterval(timer);
                    resolve();
                }
            }, 500);
        
    });
    let result = await promise;
    return result;
}