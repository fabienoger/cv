class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    technologies = ProjectTechnology.where(:project_id => @project.id)
    @technologies = []
    technologies.each do |technology|
      techno = Technology.find(technology.technology_id)
      @technologies.push(techno)
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
    @technologies = Technology.all
  end

  # GET /projects/1/edit
  def edit
    @technologies = Technology.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    puts "===============================".red
    puts "#{params[:technologies]}".red
    puts "===============================".red
    @technologies = params[:technologies]

    respond_to do |format|
      if @project.save
        @technologies.each do |t|
          linked = ProjectTechnology.new
          linked.project_id = @project.id
          linked.technology_id = t
          puts "===============================".yellow
          if linked.save
            puts "Link saved with project_id => #{@project.id}, technology_id => #{t}".green
          else
            puts "Link don't save with project_id => #{@project.id}, technology_id => #{t}".red
          end
          puts "===============================".yellow
        end
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @technologies = params[:technologies]
    respond_to do |format|
      if @project.update(project_params)
        links = ProjectTechnology.where(:project_id => @project.id)
        technologies = []
        puts "========================".yellow
        links.each do |l|
          puts "#{l.technology_id}".green
          technologies.push(l.technology_id)
        end
        if @technologies != nil
          @technologies.each do |technology|
            request = ProjectTechnology.where("project_id = ? AND technology_id = ?", @project.id, technology).first
            puts "#{request}".light_blue
            if request == nil
              linked = ProjectTechnology.new
              linked.project_id = @project.id
              linked.technology_id = technology
              if linked.save
                puts "Save : #{linked}".green
              else
                puts "Can't save : #{linked}".red
              end
            else
              puts "Nil : #{request}".red
            end
          end
        end
        puts "========================".yellow
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    links = ProjectTechnology.where(:project_id => @project.id)
    puts "========================".yellow
    links.each do |l|
      puts "Destroy : #{l}".red
      l.destroy
    end
    puts "========================".yellow
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :github, :twitter, :url, :startdate, :enddate, :abstract, :picture)
    end
end
