class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to entries_url
    else
      render :new
    end

  end

  def show
    @entry = Entry.find(params[:id])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])

    if @entry.update_attributes(entry_params)
      redirect_to product_url(@entry)
    else
      render :edit
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entry_url
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :story, :user_id, :avatar)
  end


end
