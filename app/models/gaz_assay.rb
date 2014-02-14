#encoding: utf-8
class GazAssay < ActiveRecord::Base
  validates_presence_of :dttm, :subdivision, :protocol_num, :ncv
  attr_accessible :dttm, :ncv, :subdivision, :protocol_num, :is_suplier_assay

  scope :public_data, -> {where :is_public_info => true}

  def self.za_period(period_rus)
    case period_rus
      when 'За последний месяц'
        where(dttm: Date.today.months_ago(1) .. Date.tomorrow).order('subdivision','dttm', 'protocol_num')
      when 'Текущий месяц'
        where(dttm: Date.today.at_beginning_of_month .. Date.tomorrow).order('subdivision','dttm', 'protocol_num')
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
        where(subdivision: sp_name_rus)
      else
        all
    end
  end
end
