module UsersHelper
  def has_grant?(action)
    user = User.find(session[:user_id])
    rule_map = {index: 1, edit: 2, correct: 4, report: 8}
    (user.grants & rule_map.fetch(action,0)) > 0
  end
  def has_fuel?(fuel_type)
    user = User.find(session[:user_id])
    fuel_map = {coil: 512, gaz: 1048, masut: 2048}
    (user.grants & fuel_map.fetch(fuel_type,0)) > 0
  end
end
