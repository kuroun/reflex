module ApplicationHelper
  def friendly_timestamp time
    #convert time to local time
    #using minute format if less hour
    #using hour format if less than a day
    #using full format otherwise (Thurs, Nov 12th 2016)
    diff = (Time.now - time).to_i.abs
    case diff
    when 0...60*60
      return minute_format time
    when 60*60...60*60*24
      return hour_format time
    when 60*60*24...60*60*24*7
      return day_format time
    when 60*60*24*7...60*60*24*7*30
      return week_format time
    when 60*60*24*7*30...60*60*24*7*30*12
      return month_format time
    when 60*60*24*7*30*12...60*60*24*7*30*12*10
      return year_format time
    else
      return full_format time
    end
  end

  def local_time_zone_offset
    # multiplle -1 here because js represent time difference varies from how rails represents
    time_zone_offset_utc_sec = -1 * cookies[:time_zone_offset_utc_mn].to_f / 60
  end

  def word_form num, word
    word = (num > 1) ? word.pluralize : word.singularize
    if num > num.round
      return "more than #{num.round} #{word}"
    else
      return "less than #{num.round} #{word}"
    end
  end

  def to_local_time time
    time.in_time_zone(local_time_zone_offset)
  end

  def minute_format time
    in_minutes = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / 60
    (in_minutes < 1) ? 'a moment ago' : "#{word_form(in_minutes,'minute')} ago"
  end

  def hour_format time
    in_hours = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / 3600
    "#{word_form(in_hours,'hour')} ago"
  end

  def day_format time
    in_days = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / (3600*24)
    "#{word_form(in_days,'day')} ago"
  end

  def week_format time
    in_weeks = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / (3600*24*7)
    "#{word_form(in_weeks,'week')} ago"
  end

  def month_format time
    in_months = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / (3600*24*7*30)
    "#{word_form(in_months,'month')} ago"
  end

  def year_format time
    in_years = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / (3600*24*7*30*12)
    "#{word_form(in_years,'year')} ago"
  end

  def full_format time
    formatted_time = to_local_time time
    formatted_time.strftime("%a, %b #{formatted_time.day.ordinalize} %Y at %H:%M")
  end
end
