module ReporterHelper
  def get_docs_count_per_route(coil_assays_sql_res)
    h = {}
    coil_assays_sql_res.each {|ca|h.has_key?(ca.route) ? h[ca.route]+=1 : h[ca.route]=1}
    h
  end
end
