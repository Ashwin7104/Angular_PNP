(function () {
    app.controller('projectCtrl', ['$scope', 'appService', function ($scope, appService) {
        $scope.title = "test";

        $scope.getProjects = function () {
            appService.getProjects().then(function (response) {
                $scope.title = "welcome";
                $scope.projects = response;
            });
        };

        $scope.addProject = function () {
            appService.addProject($scope.project).then(function (response) {
                $scope.getProjects();
                $scope.project = {};
            });
        };

        $scope.deleteProject = function (id) {
            appService.deleteProject(id).then(function (response) {
                $scope.getProjects();
            });
        }

        $scope.updateProject = function (project) {
            appService.updateProject(project).then(function (response) {
                $scope.getProjects();
            });
        };

        $scope.getProjects();

    }]);
})();