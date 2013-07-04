class AttachmentsController < ArticlesController
    before_action :set_attachment, only: [:show, :edit, :update, :destroy, :current_user_owner?]
  def show
      send_data @attachment.data, :filename => @attachment.name, :type => @attachment.mime_type, :disposition => "inline"
  end

  def create      
    return if params[:attachment].blank?

    @attachment = @attachments.new
    @attachment.uploaded_file = params[:attachment]
    @attachment.article_id = params[:article_id]

    if @attachment.save
	flash[:notice] = "Thank you for your submission..."
	redirect_to :back
    else
	flash[:error] = "There was a problem submitting your attachment."
	render :action => "new"
    end
  end
  
  def destroy
    @attachment.destroy

    redirect_to :back
  end
  
  def minify_img
      send_data thumb(@attachment.data, 150), :filename => @attachment.name, :type => @attachment.mime_type, :disposition => "inline"
  end
  
  private
  def thumb(image, size)
    img = Magick::Image.from_blob(image).first
    img.resize_to_fill!(size).to_blob
  end
  
  private
  def set_attachment
    @attachment = Attachment.find(params[:id])
  end
  
  def attachment_params
    params.require(:article).permit(:id, :article_id, :name, :mime_type, :data, :thumbnail)
  end
end
