json.extract! character, :codepoint, :charname
if !character.to_uppercase.nil?
  json.uppercase character_url(character.to_uppercase, format: :json)
end
if !character.to_lowercase.nil?
  json.lowercase character_url(character.to_lowercase, format: :json)
end
json.url character_url(character, format: :json)
