class NotificationsMailer < ActionMailer::Base
	
	default from: "noreply@spectrumcameracranes.com.au"
	default to: "lucasdobbins@gmail.com"

	def new_message(message)
		@message = message
		mail(:subject => "[Spectrum Camera Cranes Contact] #{message.subject}")
	end
end
