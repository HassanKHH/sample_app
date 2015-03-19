class MicropostsController < ApplicationController
    before_action :logged_in_user, only[:create,:destroy]
    
    def show
        @micropost = Micropost.find(params[:id])
    end
    
    def create
        post = current_user.microposts.build(micropost_params)
        if post.save
            redirect_to user
        else 
            render 'static_pages/home'
        end
        
    end
        
        
        
        
    private

        def microposts_params
            params.require(:micropost).permit(:content)
        end

end
