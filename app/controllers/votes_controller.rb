class VotesController < ApplicationController

  before_action :load_entry

  def create
    # @vote = @entry.votes.build(vote_params)
    # @vote.user = current_user
    #
    # if @vote.save
    #   redirect_to entries_path, notice: 'Vote received!'
    # else
    #   render 'entries/show'
    # end

    @entry = Entry.find(params[:entry_id])


   if @entry.votes.where(voter_ip: request.remote_ip).empty?
      @vote = @entry.votes.create(params[:entry_vote])

      if @vote.save
        VoteMailer.vote_confirmation(@vote).deliver
      else
        @vote.errors.full_messages
        render "entries/show"
      end
    end



    #
    # respond_to do |format|
    #   format.html {redirect_to root_url}
    # end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    @entries = Entry.all
    redirect_to entries_path
  end


  def confirm_email
    vote = Vote.find_by_confirm_token(params[:id])
    if vote
      vote.email_activate
      flash[:success] = "Thank You for voting!"
      redirect_to root_url
    else
      flash[:error] = "Sorry. There was an error"
      redirect_to root_url
    end
  end

  private
  def vote_params
    params.permit(:entry_id, :email)
  end

  def load_entry
    @entry = Entry.find(params[:entry_id])
  end
end
