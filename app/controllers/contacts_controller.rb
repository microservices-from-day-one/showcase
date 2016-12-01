class ContactsController < ApplicationController
  def show
  end

  def create
    render text: 'will send an email'
  end
end
