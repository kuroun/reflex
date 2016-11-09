jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

$(document).ready ->
  d = new Date
  # get timezone offset from UTC in minutes
  n = d.getTimezoneOffset()
  set_cookie 'time_zone_offset_utc_mn', n, 30

#set cookie
set_cookie = (cname, cvalue, exdays) ->
  d = new Date
  #getTime() get time in milli seconds
  #setTime() set time to readable format from milli seconds
  d.setTime d.getTime() + exdays*24*60*60*1000
  #setTime to UTC time string
  document.cookie = cname + '=' + cvalue + ';expires=' + d.toUTCString() + ';path=/'

#get cookie
get_cookie = (cname) ->
  name = cname + '='
  ca = document.cookie.split(';')
  i = 0
  while i < ca.length
    c = ca[i]
    #remove all white space at the beginning of the string
    while c.charAt(0) == ' '
      c = c.substring(1)
    # check if the name found at the beginning of the string
    if c.indexOf(name) == 0
      return c.substring(name.length, c.length)
    i++
  ''
