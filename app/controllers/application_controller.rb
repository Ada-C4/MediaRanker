class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def list(media)
    a=[]
    count = 0
    @media.each do |medium|
      if count < 11
        a.push(medium)
      end
      count += 1
    end
    return a
  end

end
