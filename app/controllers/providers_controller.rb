class ProvidersController < ApplicationController

def index
  @provider in Provider.all
end

