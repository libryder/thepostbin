function PostsController($scope) {
  
  $scope.newPost = "";

  $scope.posts = [
    {"text": "Nexus S"},
    {"text": "Motorola XOOM™ with Wi-Fi"},
    {"text": "MOTOROLA XOOM™"}
  ];

  $scope.addPost = function() {
    $scope.posts.push({ "text": $scope.newPost })
    $scope.newPost = ''
  };

  $scope.deletePost = function(post) {
    $scope.posts.splice($scope.posts.indexOf(post), 1)
  }
};