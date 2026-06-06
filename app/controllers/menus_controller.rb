class MenusController < ApplicationController
    def index
    end

    def new
        @menu = Menu.new
    end

    def show
        @menu = Menu.find_by(id: params[:id])
    end

    def create
        menu = Menu.new(menu_params)
        if menu.save
            flash[:notice] = "診断が完了しました"
            redirect_to menu_path(menu.id)
        else
            redirect_to :action => "new"
        end
    end
  
  private
    def menu_params
        params.require(:menu).permit(:question1, :question2, :question3, :question4)
    end
end
