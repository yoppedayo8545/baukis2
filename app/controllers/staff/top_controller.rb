class Staff::TopController < staff::Base
  def index
    render action: "index"
  end
end
