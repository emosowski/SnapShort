get '/prompts/:id/comments' do
  @prompt = Prompt.find(params[:id])
  erb :'comments/index'
end

get '/shorts/:id/comments' do
  @short = Short.find(params[:id])
  erb :'comments/index'
end

post '/prompts/:id/comments' do
  @prompt = Prompt.find(params[:id])
  @comment = Comment.new(params[:comment])
    if @comment.save
      redirect "/prompts/#{@prompt.id}/comments"
    else
      @errors = @comment.errors.full_messages
      redirect "/prompts/#{@prompt.id}/comments"
    end
end

post '/shorts/:id/comments' do
  @short = Short.find(params[:id])
  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect "/shorts/#{@short.id}/comments"
  else
    @errors = @comment.errors.full_messages
    redirect "/shorts/#{@short.id}/comments"
  end
end