class Apiv1::AspectsController < Apiv1::BaseController
    require 'active_support/core_ext/hash'
	
    # GET a list of all aspects for a user
    def index
        render :json => {
              :aspects => @user.aspects       
        }
    end
    
    #post a new aspect to the current user
    def create
        @aspect = @user.aspects.create(params[:aspect])
        
        #if @aspect.valid?
         #   render :json=>{:text => I18n.t('aspects.create.success'), :status => 200 }
        #else
         #   render :json=>{:text => I18n.t('aspects.create.failure'), :status => 422 }
        #end
    end
end