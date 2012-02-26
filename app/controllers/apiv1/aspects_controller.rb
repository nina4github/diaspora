class Apiv1::AspectsController < Apiv1::BaseController
    require 'active_support/core_ext/hash'
	
    # GET a list of all aspects for a user
    def show
        var=params[:id]
        aspects = @user.aspects
        aspects.each do |aspect|
            if aspect.name.downcase == var.downcase
                render :json => aspect 
            end
        end    
        render :json => "false"
    end
    
    #post a new aspect to the current user
    def create
    		if params[:aspectname]
    			params[:aspect]={:name=>params[:aspectname]}
    		end
        @aspect = @user.aspects.create(params[:aspect])
        
        #if @aspect.valid?
         #   render :json=>{:text => I18n.t('aspects.create.success'), :status => 200 }
        #else
         #   render :json=>{:text => I18n.t('aspects.create.failure'), :status => 422 }
        #end
    end
end