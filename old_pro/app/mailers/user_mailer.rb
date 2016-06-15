class UserMailer < ActionMailer::Base
  default from: "kishanptl.kp@gmail.com"
  def welcome(tomail,username,msg)
  	@user = username
  	@msg = msg
  	# @txt = params[:name]
	mail(:to=>tomail,
		:subject=>"welcome")
	end
	# def send_mail(tomail,username,msg)
	#   	@user = username
	#   	@msg = msg
	#   	# @txt = params[:name]
	# 	mail(:to=>tomail,
	# 	:subject=>"welcome")
	# end
end
