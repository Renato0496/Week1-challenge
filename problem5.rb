require 'csv'

valid_est_dates = []
invalid_formats = []

data = CSV.read("events.csv")

data.each_with_index do |date, index|
  splitted_date = date[1].split(/[ \/\:]/).map { |num| num.to_i}
  begin
    formated_time = Time.new(splitted_date[2], splitted_date[1], splitted_date[0], splitted_date[3], splitted_date[4], splitted_date[5], "utc")
    est_time = formated_time.to_datetime.new_offset("est").strftime('%d/%m/%Y %H:%M:%S')
    date[1] = est_time
    valid_est_dates << date
  rescue ArgumentError
    STDERR.puts "Invalid date at line #{index + 1}: #{$!}."
    new_line = date << "Invalid date at line: #{index + 1}"
    invalid_formats << new_line
  end
end

File.write("est_valid_dates.csv", valid_est_dates.map(&:to_csv).join)
File.write("invalid_dates.csv", invalid_formats.map(&:to_csv).join)