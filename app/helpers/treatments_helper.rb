module TreatmentsHelper
  def treatment_types_for_select
    Treatment.treatment_types.map do |k, v|
      [Treatment.human_attribute_name("treatment_type.#{k}"), k]
    end
  end

  def treatment_statuses_for_select
    Treatment.statuses.map do |k, v|
      [Treatment.human_attribute_name("status.#{k}"), k]
    end
  end
end
