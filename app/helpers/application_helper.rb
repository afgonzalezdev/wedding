# frozen_string_literal: true

module ApplicationHelper
  def flash_class(key)
    case key
    when :notice then 'alert alert-info'
    when :success then 'alert alert-success'
    when :error then 'alert alert-error'
    when :alert then 'alert alert-error'
    end
  end

  def time_until_wedding(wedding_date)
    wedding_time = DateTime.parse("2023-12-26 20:00:00")

    diff_in_seconds = (wedding_time - DateTime.now) * 24 * 60 * 60 # Convert difference to seconds

    full_days = (diff_in_seconds / (24 * 60 * 60)).to_i
    remaining_seconds_after_days = diff_in_seconds - (full_days * 24 * 60 * 60)
  
    hours = (remaining_seconds_after_days / (60 * 60)).to_i
    remaining_seconds_after_hours = remaining_seconds_after_days - (hours * 60 * 60)
  
    minutes = (remaining_seconds_after_hours / 60).to_i
    seconds = (remaining_seconds_after_hours - (minutes * 60)).to_i
  
    [full_days, hours, minutes, seconds]
    end


  def errors_for(object)
    return unless object.errors.any?

    content_tag(:div, class: 'mb-3 card border-danger') do
      concat(content_tag(:div, class: 'card-header bg-danger text-white') do
        concat "Oops, #{pluralize(object.errors.count, 'problem')}:"
      end)
      concat(content_tag(:ul, class: 'mb-0 list-group list-group-flush') do
        object.errors.full_messages.each do |msg|
          concat content_tag(:li, msg, class: 'list-group-item')
        end
      end)
    end
  end
end
