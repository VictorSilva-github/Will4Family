namespace :checkin do
  desc "TODO"
  task daily: :environment do
    LastCheckingAtJob.perform_later
    ToleranceDaysJob.perform_later
    UltimateDateJob.perform_later
  end
end
