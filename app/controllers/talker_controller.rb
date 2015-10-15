class TalkerController < ApplicationController
    def index
        @chats = Chat.all
    end
    
    def create
        talk = Talk.where(ask: params[:ask]).sample

        unless talk.nil?
        Chat.create(talker: "user", content: talk.ask)
        Chat.create(talker: "bot", content: talk.answer)
        redirect_to '/'
        else
        redirect_to '/learn'
        end
        
    end
end
