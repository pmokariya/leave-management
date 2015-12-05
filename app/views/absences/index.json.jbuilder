json.array!(@absences) do |absence|
  json.extract! absence, :id, :reason, :from_date, :to_date
  json.url absence_url(absence, format: :json)
end
