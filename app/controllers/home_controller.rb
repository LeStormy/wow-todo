class HomeController < ApplicationController
  def index
    @main_acts = MainAct.order(:name)
    @completions = {}
    @sub_acts_count = @main_acts.map(&:sub_acts).flatten.count

    @main_acts.map(&:sub_acts).flatten.each do |sub_act|
      if sub_act.metadata["reset"] == "weekly"
        completion = Completion.where(sub_act: sub_act).where("created_at > ?", Time.now.prev_occurring(:wednesday).change({hour: 9, minute: 0})).first
        if completion.present?
          @completions[sub_act.id] = completion
        end
      elsif sub_act.metadata["reset"] == "half"
        wed_reset = Time.now.prev_occurring(:wednesday).change({hour: 9, minute: 0})
        sat_reset = Time.now.prev_occurring(:saturday).change({hour: 9, minute: 0})

        if sat_reset < wed_reset
          completion = Completion.where(sub_act: sub_act).where("created_at > ?", wed_reset).first
          if completion.present? 
            @completions[sub_act.id] = completion
          end
        else
          completion = Completion.where(sub_act: sub_act).where("created_at > ?", sat_reset).first
          if completion.present? 
            @completions[sub_act.id] = completion
          end
        end
      elsif sub_act.metadata["reset"] == "daily"
        completion = Completion.where(sub_act: sub_act).where("created_at > ?", Date.yesterday.change({hour: 9, minute: 0})).first
        if Time.now.hour < 9 && completion.present?
          @completions[sub_act.id] = completion
        end
        completion = Completion.where(sub_act: sub_act).where("created_at > ?", Time.now.change({hour: 9, minute: 0})).first
        if Time.now.hour > 9 && completion.present?
          @completions[sub_act.id] = completion
        end
      end
    end

    @meta_completion = 0
    @main_acts.map do |main_act|
      if (main_act.sub_acts.pluck(:id) - @completions.keys).empty?
        @meta_completion += 1
      end
    end

  end
end