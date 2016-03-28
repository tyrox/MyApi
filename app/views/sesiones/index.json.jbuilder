json.array!(@sesiones) do |sesione|
  json.extract! sesione, :id, :user_id, :token_auth
  json.url sesione_url(sesione, format: :json)
end
