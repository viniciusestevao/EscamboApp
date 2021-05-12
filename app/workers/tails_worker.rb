class TailsWorker
  include Sidekiq::Worker

  def perform(name)
    # Do something
    sleep(10)
    puts ">>>>>>>>>>> TAILS: Terminei, #{name} ! "
  end
end
