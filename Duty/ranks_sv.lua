AddEventHandler('chatMessage', function(s, n, m)
  local message = string.lower(m)
  if message == "/rank" then
    CancelEvent()
    TriggerClientEvent('pd5m:duty:openrankmenu', s)
  end
end)
