(function () {
    app.service('appService', ['$http', '$q', function ($http, $q) {
        function getUrlParamByName(name) {
            name = name.replace("/[\[]/", "\\[").replace("/[\]]/", "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
            var results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace("/\+/g", " "));
        }
        var appWebUrl = getUrlParamByName("SPAppWebUrl");
        var hostWebUrl = getUrlParamByName("SPHostUrl");

        this.getProjects = function () {
            var d = $q.defer();
            $pnp.sp.crossDomainWeb(appWebUrl, hostWebUrl).lists.getByTitle('Projects').items.get().then(function (response) {
                d.resolve(response);
            });
            return d.promise;
        }


        this.addProject = function (project) {
            var d = $q.defer();
            $pnp.sp.crossDomainWeb(appWebUrl, hostWebUrl).lists.getByTitle('Projects').items.add(project).then(function (response) {
                d.resolve(response);
            });
            return d.promise;
        }

        this.deleteProject = function (id) {
            var d = $q.defer();
            $pnp.sp.crossDomainWeb(appWebUrl, hostWebUrl).lists.getByTitle('Projects').items.getById(id).delete().then(function (response) {
                d.resolve(response);
            });
            return d.promise;

        }

        this.updateProject = function (project) {
            var d = $q.defer();
            $pnp.sp.crossDomainWeb(appWebUrl, hostWebUrl).lists.getByTitle('Projects').items.getById(project.Id).update({ Technology: project.Technology }).then(function (response) {
                d.resolve(response);
            });
            return d.promise;
        };
    }]);
})();