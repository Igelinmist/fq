#encoding: utf-8
module UsersHelper
  def has_grant?(action,user = User.find(session[:user_id]))
    rule_map = {index: 1, edit: 2, correct: 4, report: 8, index_filial: 16, edit_filial: 32,correct_filial: 64,report_filial: 128}
    (user.grants & rule_map.fetch(action,0)) > 0
  end

  def has_fuel?(fuel_type)
    user = User.find(session[:user_id])
    fuel_map = {coil: 512, gaz: 1048, masut: 2048}
    (user.grants & fuel_map.fetch(fuel_type,0)) > 0
  end

  def grant_for_action(suplier_data)
    user = User.find(session[:user_id])
    act = {:can_edit => false, :can_delete => false}
    if suplier_data && (has_grant?(:edit_filial,user) || has_grant?(:correct_filial,user))
      act[:can_edit] = true
      if has_grant?(:edit_filial,user)
        act[:can_delete] = true
      end
    else
      if !suplier_data && (has_grant?(:edit,user) || has_grant?(:correct,user))
        act[:can_edit] = true
        if has_grant?(:edit,user)
          act[:can_delete] = true
        end
      end

    end
    act
  end

  def grant_for_new_assay?
    result = false
    user = User.find(session[:user_id])
    if (user.subdivision == 'ТЭЦ-2' || user.subdivision == 'ТЭЦ-3' || user.subdivision == 'ТЭЦ-4' || user.subdivision == 'ТЭЦ-5' || user.subdivision == 'КРК')&&has_grant?(:edit,user)
      result = true
    else
      if has_grant?(:edit_filial,user)
        result = true
      end
    end
    result
  end

end
