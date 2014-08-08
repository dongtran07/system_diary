class PostMailer < ActionMailer::Base
  default :to => ["dong.tm1212@gmail.com", 
                  "dongtm@vccloud.vn"],
          :from => "noreply.systemlog@gmail.com"

  def new_post_send(post)
    @post = post
    mail(:subject => "New Work Log")
  end
end
