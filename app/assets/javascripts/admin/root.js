var ready = function() {
  $('#reset-and-load-from-hn').click(function(e) {
    var apiRoot = $(this).data('api');

    //  use API to fetch all items.
    //  use api to destroy all items?

    debugger

    //https://github.com/HackerNews/API
    //  use api to fetch the top hackernews stories.
    $.getJSON("https://hacker-news.firebaseio.com/v0/topstories.json", function(stories, status, jqxhr){
      debugger
      stories.forEach(function(story) {
        var data = {
          title: story.title
        };

        if (story.url){
          data.url = story.url;
        }
        if (story.content){
          data.content = story.content;
        }

        $.ajax({
          type: "POST",
          url: apiRoot+"/items",
          data: data,
          success: function(e){
            debugger
          },
          dataType: "JSON"
        });
      })
    });
    //  use api to add all the hackernews stories
  })
};

$(document).ready(ready);
$(document).on('page:load', ready);
