$(document).ready(function(){

var appeditor = angular.module("appeditor",[], function ($interpolateProvider) {
               $interpolateProvider.startSymbol('[[');
               $interpolateProvider.endSymbol(']]');
});

appeditor.filter('escapeHtml', function($sce) {
   return function(val) {
       return $sce.trustAsHtml(val);
   };
});


appeditor.controller("global-controller",["$scope","$http",function($scope,$http){
$scope.plantillas = null;
$scope.vista = null;
$scope.placeholders = null;
$scope.preview = null;
$scope.rpalce = [];
$scope.id =null;
$scope.titulo =null;

$http.get('/cargaplantillas.json',{}).
success(function(data, status, headers, config) {
  $scope.plantillas= data;
  console.log(data);
});


$scope.showDetail = function(event)
{
  $scope.id = $(event.target).attr("data-id")

  $http.get('/plantilla/'+$scope.id+'.json',{}).
success(function(data, status, headers, config) {
  $scope.vista = data.plantilla;
  $scope.titulo = data.titulo
  console.log(data);
  $scope.changed();
  $scope.rplace = [];
});
};


$scope.salvar = function(event)
{
  
  $http.post('/plantillasave/'+$scope.id,{ 'vista': $scope.vista }).
success(function(data, status, headers, config) {
  $scope.vista = data.vista;
  console.log(data);
});
};

$scope.pdf = function(event){
html2canvas(document.getElementById('pdf'), {
           onrendered: function (canvas) {
               var data = canvas.toDataURL();
               var docDefinition = {
                   content: [{
                       image: data,
                       width: 500,
                   }]
               };
               pdfMake.createPdf(docDefinition).download($scope.id+ $scope.titulo+".pdf");
           }
       });
    }

   $scope.rlplchanged = function(){
   	
   	$scope.preview = $scope.vista;
   	var cont = 0;
   	for(cont = 0; cont < $scope.rplace.length; cont++){
   	$scope.preview= $scope.preview.replace($scope.placeholders[cont] ,$scope.rplace[cont] )
   	console.log( $scope.preview );
   	}
   }

$scope.changed = function()
{	
function verificate (element, index, array){
var re = /__%%+[a-zA-Z0-9]+%%__/gm; 
if(re.test(element)){
if($scope.placeholders.length<10){
if($scope.placeholders.indexOf(element) >= 0){
alert('placeholder repetido');
}else{
$scope.placeholders.push(element);
}


}else{
alert('no puedes ingresar mas de 10 placeholders');
}
}
}
if($scope.vista){
$scope.placeholders = [];

palabras = $scope.vista.split(" ");

palabras.forEach(verificate);

console.log($scope.placeholders)

} 
}




}]);

})