'use strict'

const apiBridge = {
    redditData: (updateCallback) => {
        const xhr = new XMLHttpRequest();
        xhr.open('GET', `${window.location.origin}/data` );
        xhr.responseType = 'json';
        xhr.onload = function(e) {
            if (this.status == 200) {
                if ('function' === typeof(updateCallback)) {
                    updateCallback(this.response);
                }
            }
        };
        xhr.send();
    }
}