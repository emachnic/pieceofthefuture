class ClassroomsController < ApplicationController
  # GET /classrooms
  # GET /classrooms.xml
  def index
    @classroom_search = Classroom.search(params[:search])
    @classrooms = @classroom_search.order(:class_name).paginate(:page => params[:classrooms_page], :per_page => 30)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @classrooms }
    end
  end

  # GET /classrooms/1
  # GET /classrooms/1.xml
  def show
    @classroom = Classroom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @classroom }
    end
  end

  # GET /classrooms/new
  # GET /classrooms/new.xml
  def new
    @classroom = Classroom.new
    @institutions = Institution.order('name ASC')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @classroom }
    end
  end

  # GET /classrooms/1/edit
  def edit
    @classroom = Classroom.find(params[:id])
    @institutions = Institution.order("name ASC")
  end

  # POST /classrooms
  # POST /classrooms.xml
  def create
    @classroom = Classroom.new(params[:classroom])
    @institutions = Institution.order("name ASC")

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to(@classroom, :notice => 'Classroom was successfully created.') }
        format.xml  { render :xml => @classroom, :status => :created, :location => @classroom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @classroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /classrooms/1
  # PUT /classrooms/1.xml
  def update
    @classroom = Classroom.find(params[:id])
    @institutions = Institution.order("name ASC")

    respond_to do |format|
      if @classroom.update_attributes(params[:classroom])
        format.html { redirect_to(@classroom, :notice => 'Classroom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @classroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.xml
  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to(classrooms_url) }
      format.xml  { head :ok }
    end
  end
end
