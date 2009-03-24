class CommentsMailer < ActionMailer::Base
  def new_comment(comment)
    recipients  'sam@samsoff.es'
    from        'no-reply@samsoff.es'
    subject     'New Comment'
    body        :comment => comment
  end
end
