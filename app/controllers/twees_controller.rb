class TweesController < ApplicationController
   before_action :set_twee,only: [:show, :edit, :update, :destroy] 
   def index
       @twees = Twee.all
   end
   
   def new
     if params[:back]
       @twee = Twee.new(twee_params)
     else
       @twee = Twee.new
     end
   end
   
   def create
       @twee = Twee.new(twee_params)
       if @twee.save
           redirect_to twees_path,notice:"つぶやきを作成しました！"
       else
          render"new"
       end
   end
   
   def show
   end
   
   def edit
   end
   
   def update
      if @twee.update(twee_params)
         redirect_to twees_path,notice: "つぶやきを編集しました！"
      else
         render"edit"
      end   
   end
   
   def destroy
      @twee.destroy
      redirect_to twees_path,notice:"つぶやきを削除しました！"
   end
   
   def confirm
      @twee = Twee.new(twee_params)
      render :new if @twee.invalid?
   end
   
   private
   def twee_params
       params.require(:twee).permit(:content)
   end
   
   def set_twee
      @twee = Twee.find(params[:id])
   end
end
