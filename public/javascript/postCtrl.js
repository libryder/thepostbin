function PostsController($scope) {
  
  $scope.newPost = "";

  $scope.posts = [
    {"text": "Get milk"},
    {"text": "Do Yoga"},
    {"text": "Eat delicious sushi"}
  ];

  $scope.addPost = function() {
    $scope.posts.push({ "text": $scope.newPost })
    $scope.newPost = ''
  };

  $scope.deletePost = function(post) {
    $scope.posts.splice($scope.posts.indexOf(post), 1)
  }
};