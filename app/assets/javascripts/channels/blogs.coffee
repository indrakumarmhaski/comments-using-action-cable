jQuery(document).on 'turbolinks:load', ->
    comments = $('#comments')
    if comments.length > 0
        App.global_chat = App.cable.subscriptions.create {
            channel: "BlogsChannel"
            Blog_id: comments.data('blog-id')
        },
        connected: ->
        disconnected: ->
        received: (data) ->
            comments.append data['comment']
        send_comment: (comment, blog_id) ->
            @perform 'send_comment', comment: comment, blog_id: blog_id
    $('#new_comment').submit (e) ->
        $this = $(this)
        textrea =$this.find('#comment_content')
        if $.trim(textrea.val()).length > 1
            App.global_chat.send_comment textrea.val(),
            comment.data('blog-id')
            textrea.val('')
        e.preventDefault()
        return false