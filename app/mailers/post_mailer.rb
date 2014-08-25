class PostMailer < ActionMailer::Base
  default from: "noreply.systemlog@gmail.com"

  def new_post_send(mail,name,url)
    @mail = mail
    @name= name
    @url  = url
    mail(to:  @mail, subject: "System log")
  end
end
