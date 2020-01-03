class Definition < ApplicationRecord
  def rules_pass?(context)
    rule_def = value&.with_indifferent_access
    return true if rule_def.blank?

    rules = rule_def[:rules]
    return true if rules.blank?

    context_struct = JSON.parse(context.to_json, object_class: OpenStruct)

    rule_level_passes?(rules, context_struct)
  end

  private

  def rule_level_passes?(rule_level, context)
    rule_level.each do |rule|
       result = rule_passes?(rule, context)
       return true if result
    end
    false
  end

  def rule_passes?(rule, context)
    if rule[:children].present?
      result = rule_level_passes?(rule[:children], context)
      return false unless result
    end

    exec_rule(rule, context)
  end

  def exec_rule(rule, context)
    rule_class_string = rule[:class]
    rule_class = rule_class_string.constantize

    args = rule[:args]
    resolved_args = []
    args.each do |arg|
      resolved_args << context.instance_eval(arg)
    end
    rule_class.run(*resolved_args)
  end
end
