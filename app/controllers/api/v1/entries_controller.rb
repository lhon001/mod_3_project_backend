class Api::V1::EntriesController < ApplicationController
  before_action :find_entry
  def index
    @entries = Entry.all
    render json: @entries
  end

  def update
    @entry.update(entry_params)
    if @entry.save
      render json: @entry, status: :accepted
    else
      render json: {errors: @entry.errors.full_messages}, status: :unproccesible_entity
    end
  end

  def show
    render json: @entry
  end

  def create
    @entry = Entry.create(entry_params)
    render json: @entry, status: :created
  end

  def delete
    # @entry.destroy
    Entry.destroy(entry_params[user_id])
  end

  private

  def entry_params
    params.permit(:title, :content, :user_id)
  end

  def find_note
    @entry = Entry.find(params[:id])
  end
end
