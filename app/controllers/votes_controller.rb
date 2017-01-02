class VotesController < ApplicationController

  before_action :load_entry

  def create
    @vote = @entry.votes.build(vote_params)
    @vote.user = current_user

    if @vote.save
      redirect_to entries_path, notice: 'Vote received!'
    else
      render 'entries/show'
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
  end

  private
  def vote_params
    params.permit(:entry_id)
  end

  def load_entry
    @entry = Entry.find(params[:entry_id])
  end
end
