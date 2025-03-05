class EmailEventUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    event = args[0]
    puts "notifying all users with tickets"
  end
end
