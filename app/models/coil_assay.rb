#encoding: utf-8
class CoilAssay < ActiveRecord::Base
  validates_presence_of :dttm, :subdivision, :route, :protocol_num
  attr_accessible :dttm,:subdivision,:is_suplier_assay,:is_public_info,:route,:w_r_t,:a_r,:a_d,:v_daf,:s_a,:q_r_i,:w_a,
                  :a_a,:q_a_b,:q_d_s,:q_daf_s,:v_a,:h_a, :protocol_num, :coil_class, :supplier

  scope :public_data, -> {where :is_public_info => true}

  scope :get_routes_set, ->(subdivision) {select('distinct route').where(subdivision: subdivision, dttm: ((Date.today-60.days)..Date.today)).order('route DESC')}

  def self.za_period(period_rus)
    case period_rus
      when 'За последний месяц'
        where(dttm: Date.today.months_ago(1) .. Date.tomorrow).order('subdivision','dttm', 'protocol_num')
      when 'Текущий месяц'
        where(dttm: Date.today.at_beginning_of_month .. Date.tomorrow).
            order('subdivision','dttm', 'protocol_num')
      when 'Прошлый месяц'
        where(dttm: Date.today.months_ago(1).at_beginning_of_month .. Date.today.at_beginning_of_month).order('subdivision','dttm', 'protocol_num')
      when 'Текущий квартал'
        where(dttm: Date.today.at_beginning_of_quarter .. Date.tomorrow).order('subdivision','dttm', 'protocol_num')
      when 'Текущий год'
        where(dttm: Date.today.at_beginning_of_year .. Date.tomorrow).order('subdivision','dttm', 'protocol_num')
      else
        where(dttm: Date.today .. Time.now).order('subdivision','dttm', 'protocol_num')
    end
  end

  def self.filter_sp(sp_name_rus)
    case sp_name_rus
      when 'ТЭЦ-2','ТЭЦ-3','ТЭЦ-4','ТЭЦ-5','КРК'
        where(subdivision: sp_name_rus).order(:dttm, :is_suplier_assay)
      else
        order(:subdivision, :is_suplier_assay,:dttm)
    end
  end

end
