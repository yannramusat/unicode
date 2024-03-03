json.extract! character, :codepoint, :charname
if !decomp.empty?
  json.decomposition do
    json.array! decomp
  end
end
if !character.to_uppercase.nil?
  json.uppercase api_v1_character_url(character.to_uppercase, format: :json)
end
if !character.to_lowercase.nil?
  json.lowercase api_v1_character_url(character.to_lowercase, format: :json)
end
json.url api_v1_character_url(character, format: :json)
