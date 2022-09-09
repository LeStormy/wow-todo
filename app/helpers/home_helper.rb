module HomeHelper
  def kind_span_tag(sub_act)
    case sub_act.metadata["kind"]
    when "rare_kill"
      content_tag(:span, "Rare", class: ["span-tag", "rare-kill"])
    when "count"
      content_tag(:span, "Collect", class: ["span-tag", "collect"])
    when "action"
      content_tag(:span, "Action", class: ["span-tag", "action"])
    when "quest_check"
      content_tag(:span, "Quest", class: ["span-tag", "quest"])
    when "raid_boss"
      content_tag(:span, "Raid", class: ["span-tag", "raid-boss"])
    end  
  end

  def reset_span_tag(sub_act)
    case sub_act.metadata["reset"]
    when "daily"
      content_tag(:span, "D", class: ["span-tag", "daily"])
    when "weekly"
      content_tag(:span, "W", class: ["span-tag", "weekly"])
    when "half"
      content_tag(:span, "H", class: ["span-tag", "half-week"])
    end  
  end

  def hint_tag(sub_act)
    metadata = sub_act.metadata
    case metadata["kind"]
    when "rare_kill"
      content_tag(:p, metadata["hint"] || "Kill the rare", class: ["describe-action"])
    when "raid_boss"
      content_tag(:p, metadata["hint"] || "Kill the raid boss", class: ["describe-action"])
    when "count"
      have = metadata["have"] || 1
      need = metadata["need"] || 1
      get = metadata["get"] || 1
      [
        content_tag(:p, "#{have} / #{need}", class: ["count-action"]),
        content_tag(:p, "Get #{get}", class: ["count-action"]),
        content_tag(:p, "Times left: #{((need - have) / get.to_f)}", class: ["count-action"])
      ].join.html_safe
    when "action"
      content_tag(:p, metadata["hint"] || "Do something", class: ["describe-action"])
    when "quest_check"
      content_tag(:p, metadata["hint"] || "Check for quest", class: ["describe-action"])
    end  
  end

  def completion_button(sub_act)
    metadata = sub_act.metadata
    case metadata["kind"]
    when "rare_kill"
      render "completion/simple", sub_act: sub_act
    when "count"
      render "completion/count", sub_act: sub_act
    when "action"
      render "completion/simple", sub_act: sub_act
    when "quest_check"
      render "completion/simple", sub_act: sub_act
    when "raid_boss"
      render "completion/simple", sub_act: sub_act
    end
  end

  def done_button(sub_act)
    metadata = sub_act.metadata
    case metadata["kind"]
    when "rare_kill"
      button_to "Done", do_completions_path, class: "button"
    when "count"
      button_to "Done", do_completions_path, class: "button"
    when "action"
      button_to "Done", do_completions_path, class: "button"
    when "quest_check"
      button_to "Done", do_completions_path, class: "button"
    when "raid_boss"
      button_to "Done", do_completions_path, class: "button"
    end
  end
end
