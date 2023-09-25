class TargetService < ApplicationService

    def initialize(target)
      @target = target
    end

    def call
        matched_targets = Target.within(@target.radius, origin: [@target.lat, @target.lng]).where(topic_id: @target.topic_id).where.not(user_id: @target.user_id)
        p "matched_targets #{matched_targets.map{|a| a.id}}"
        if matched_targets
          matched_targets.each do |m|
            match = Match.create(first_user_id: @target.user_id, second_user_id: m.user_id, target_id: @target.id)
            match
            p "match #{match.id}"
            conversation = Conversation.create(first_user_id: @target.user_id, second_user_id: m.user_id, match_id: match.id)
            conversation
            Message.create(conversation_id: conversation.id, sender_id: @target.user_id, receiver_id: m.user_id, content: "hi!, we have a common Topic: '#{@target.topic.name}' and we are almost close, lets talk! ")
          end
        end
    end
end