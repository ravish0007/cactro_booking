class EmailConfirmationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user = args[0]
    ticket = args[1]
    puts "sending mail to", user.email, "confirming booking of", ticket.type 
  end
end
