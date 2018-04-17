json.array! @users do |user|
  json.id user.id
  json.nickname user.mickname
  json.email user.email
end