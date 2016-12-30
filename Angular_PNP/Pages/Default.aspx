<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />

     <link href="../Content/bootstrap.css" rel="stylesheet" />
     <script type="text/javascript" src="../Scripts/angular.js"></script>
     <script type="text/javascript" src="../Scripts/fetch.js"></script>
     <script type="text/javascript" src="../Scripts/es6-promise.min.js"></script>
     <script type="text/javascript" src="../Scripts/pnp.js"></script>
     <script type="text/javascript" src="../Module/Module.js"></script>
     <script type="text/javascript" src="../Service/Service.js"></script>
     <script type="text/javascript" src="../Controller/Controller.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Page Title
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
 <div data-ng-app="projectApp">
         <div data-ng-controller="projectCtrl">
             <table class="table table-bordered">
                 <thead>
                     <tr>
                         <th>Project {{title}}</th><th>Client</th><th>Technology</th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr ng-repeat="project in projects">
                         <td>{{project.Title}}</td><td>{{project.Client}}</td>
                 
                         <td>
                             <div class="col-sm-6">
                                 <input type="text" ng-model="project.Technology" class="form-control" /></div>
                             <button type="button" class="col-sm-2 btn-default" ng-click="updateProject(project)">Update</button>
                             <button type="button" class="col-sm-2 btn-default" ng-click="deleteProject(project.Id)">Delete</button>
                         </td>
                     </tr>
                 </tbody>
                 <tfoot>
                     <tr>
            <td><input type="text" class="form-control" ng-model="project.Title" /></td>
            <td><input type="text" class="form-control" ng-model="project.Client" /></td>
            <td><div class="col-sm-10">
            <input type="text" class="form-control" ng-model="project.Technology" />
                             </div>
          <button type="button" class="col-sm-2 btn-default" ng-click="addProject()">Add</button>
                         </td>
                     </tr>
                 </tfoot>
             </table>
         </div>
     </div>

</asp:Content>
