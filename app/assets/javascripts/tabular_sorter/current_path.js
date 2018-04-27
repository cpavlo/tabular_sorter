this.CurrentPath = (function () {
    function CurrentPath(path) {
        if (path == null) {
            path = null;
        }
        this.path = (path || $(location).attr('href')).replace(/https?:\/\/[^\/]+/i, "");
    }

    CurrentPath.prototype.update_param = function (key, value) {
        var re, separator;
        re = new RegExp('([?&])' + key + '=.*?(&|$)', 'i');
        separator = this.path.indexOf('?') !== -1 ? '&' : '?';
        if (this.path.match(re)) {
            this.path = this.path.replace(re, '$1' + key + '=' + value + '$2');
        } else {
            this.path = this.path + separator + key + '=' + value;
        }
        return this;
    };

    CurrentPath.prototype.remove_param = function (param) {
        var newPath, regex;
        regex = new RegExp('([?&])' + param + '[^=]*=[^?&]*&?');
        while ((newPath = this.path.replace(regex, '$1')) !== this.path) {
            this.path = newPath;
        }
        this.path = this.path.replace(/[?&]+$/, '');
        return this;
    };

    CurrentPath.prototype.get_param = function (param) {
        var match, regex;
        regex = new RegExp('[?&]' + param + '[^=]*=([^?&]*)?(&|$)');
        match = this.path.match(regex);
        if (match !== null && match.length > 1) {
            return match[1];
        } else {
            return null;
        }
    };

    CurrentPath.prototype.get_path = function () {
        return this.path;
    };

    CurrentPath.prototype.go = function () {
        return window.location.href = this.path;
    };

    return CurrentPath;

})();
