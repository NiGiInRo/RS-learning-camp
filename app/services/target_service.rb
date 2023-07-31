class TargetService < ApplicationService

    def initialize(target)
      @target = target
    end

    def call
        matched_targets = Target.within(@target.radius, origin: [@target.lat, @target.lng]).where(topic_id: @target.topic_id).where.not(user_id: @target.user_id)
        p "matched_targets #{matched_targets.map{|a| a.id}}"
        if matched_targets
          matched_targets.each do |m|
            Match.create(
              first_user_id: @target.user_id,
              second_user_id: m.user_id,
              target_id: @target.id
            )
          end
        end
    end

end