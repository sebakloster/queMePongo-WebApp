class ErrorsController < ApplicationController
    def error_404
      render 'errores/not_found'
    end
  end