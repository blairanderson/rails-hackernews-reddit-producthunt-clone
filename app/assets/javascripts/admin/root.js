function fetchStory(id, callback) {
  $.getJSON('https://hacker-news.firebaseio.com/v0/item/' + id + '.json?print=pretty', function(story, status, jqxhr) {
    if (status === "error") {
      return callback(status)
    } else {
      if (story.text) {
        story.content = story.text;
      }

      callback(null, {
        item: story,
        status: status
      });
    }
  });
}


ready(function() {
  $(document).on('click', '#reset-and-load-from-hn', function(e) {
    var apiRoot = $(this).data('api');

    //  use API to fetch all items.
    //  use api to destroy all items?

    //https://github.com/HackerNews/API
    //  use api to fetch the top hackernews stories.
    $.getJSON("https://hacker-news.firebaseio.com/v0/topstories.json", function(stories, status, jqxhr) {

      stories.forEach(function(story_id) {
        fetchStory(story_id, function(error, result) {
          if (error || !result.item ) {
            console.log('rawr', error, result);
            return
          }

          $.ajax({
            type: "POST",
            url: apiRoot + "/items",
            data: result,
            dataType: "JSON",
            headers: {
              "Authorization": "Token token="+window.current_user.token
            }
          }).success(function(e) {
            debugger

          }).error(function(e) {
            debugger
          });

        });
      })
    });
    //  use api to add all the hackernews stories
  })
})
