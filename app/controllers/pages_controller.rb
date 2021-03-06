class PagesController < ApplicationController
  def home
    puts "====================================".green
    puts "Ip => #{request.remote_ip()}".red
    puts "#{request.env['HTTP_USER_AGENT']}".red
    puts "====================================".green
  end

  def project
    @project = Project.find(params[:id])
    links = ProjectTechnology.where(:project_id => @project.id)
    @technologies = []
    links.each do |link|
      @technologies.push(Technology.find(link.technology_id))
    end

    # Increase views count
    nbViews = @project.views + 1
    @project.views = nbViews
    @project.save
  end

  def portfolio
    @projects = Project.all
  end

  def contact
    @message = Message.new
  end

  def paye
    if user_signed_in?
    else
      redirect_to '/users/sign_in'
    end
  end

  def addPaye
    if user_signed_in?
      if params[:paye] != ' ' && params[:paye] != ''
        me = User.find(1)
        me.solde = params[:paye].to_f + me.solde.to_f
        if me.save
          flash[:success] = "Account credited (+ #{params[:paye]} €)"
          redirect_to '/depenses'
        else
          flash[:error] = "Sum not save"
          redirect_to '/pages/paye'
        end
      else
        flash[:error] = "Invalid sum"
        redirect_to '/pages/paye'
      end
    else
      redirect_to '/users/sign_in'
    end
  end

  def create
    @message = Message.new nom: params[:name], email: params[:email], content: params[:message], checked: 0
    if @message.save
      UserMailer.contact_form(@message).deliver_later
      flash[:success] = "L'email à bien été envoyé."
      redirect_to '/contact'
    else
      render :contact
    end
  end
end
