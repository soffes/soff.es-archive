require "maruku"

class CommentsMailer < ActionMailer::Base
  def new_comment(comment)
    recipients    "sam@samsoff.es"
    from          "no-reply@samsoff.es"
    content_type  "text/html"
    subject       "New Comment from #{comment.name}"
    body          :comment => comment
  end
end
