module ApplicationHelper
  ONE_MINUTE = 60
  ONE_HOUR = ONE_MINUTE * 60
  ONE_DAY = ONE_HOUR * 24
  ONE_WEEK = ONE_DAY * 7
  ONE_MONTH = ONE_DAY * 30
  ONE_YEAR = ONE_DAY * 365

  def friendly_timestamp(time)
    # convert time to local time
    # using minute format if less hour
    # using hour format if less than a day
    # using full format otherwise (Thurs, Nov 12th 2016)
    diff = (Time.now - time).to_i.abs
    case diff
    when 0...ONE_MINUTE
      return 'a moment ago'
    when ONE_MINUTE...ONE_HOUR
      return minute_format time
    when ONE_HOUR...ONE_DAY
      return hour_format time
    when ONE_DAY...ONE_WEEK
      return day_format time
    when ONE_WEEK...ONE_MONTH
      return week_format time
    when ONE_MONTH...ONE_YEAR
      return month_format time
    when ONE_YEAR...ONE_YEAR * 5
      return year_format time
    else
      return full_format time
    end
  end

  def local_time_zone_offset
    # multiplle -1 here because js represent time difference varies from how rails represents
    time_zone_offset_utc_sec = -1 * cookies[:time_zone_offset_utc_mn].to_f / 60
    time_zone_offset_utc_sec
  end

  def word_form(num, word)
    word = num.round > 1 ? word.pluralize : word.singularize
    num > num.round ? "more than #{num.round} #{word}" : "less than #{num.round} #{word}"
  end

  def to_local_time(time)
    time.in_time_zone(local_time_zone_offset)
  end

  def minute_format(time)
    in_minutes = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / ONE_MINUTE
    "#{word_form(in_minutes, 'minute')} ago"
  end

  def hour_format(time)
    in_hours = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / ONE_HOUR
    "#{word_form(in_hours, 'hour')} ago"
  end

  def day_format(time)
    in_days = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / ONE_DAY
    "#{word_form(in_days, 'day')} ago"
  end

  def week_format(time)
    in_weeks = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / ONE_WEEK
    "#{word_form(in_weeks, 'week')} ago"
  end

  def month_format(time)
    in_months = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / ONE_MONTH
    "#{word_form(in_months, 'month')} ago"
  end

  def year_format(time)
    in_years = (to_local_time(Time.now) - to_local_time(time)).to_f.abs / ONE_YEAR
    "#{word_form(in_years, 'year')} ago"
  end

  def full_format(time)
    formatted_time = to_local_time time
    formatted_time.strftime("%a, %b #{formatted_time.day.ordinalize} %Y at %H:%M")
  end
end
