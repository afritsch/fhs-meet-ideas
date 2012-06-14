Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.max_attempts = 5
Delayed::Worker.max_run_time = 30.minutes
# im Test-Environment alle Jobs direkt ausführen
Delayed::Worker.delay_jobs = !Rails.env.test?