module OddsHelper
    def format_time(time)
        time += Time.zone_offset('EST')
        time.strftime('%I:%M%p')
    end
    def format_date(date)
        date.strftime('%m/%d/%Y')
    end

end
