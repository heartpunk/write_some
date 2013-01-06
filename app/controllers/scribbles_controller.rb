class ScribblesController < ApplicationController
  before_action :set_scribble, only: [:show, :edit, :update, :destroy]

  # GET /scribbles
  # GET /scribbles.json
  def index
    @scribbles = Scribble.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scribbles }
    end
  end

  # GET /scribbles/1
  # GET /scribbles/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scribble }
    end
  end

  # GET /scribbles/new
  # GET /scribbles/new.json
  def new
    @scribble = Scribble.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scribble }
    end
  end

  # GET /scribbles/1/edit
  def edit
  end

  # POST /scribbles
  # POST /scribbles.json
  def create
    scribble_params ||= {text: ''}
    @scribble = Scribble.new(scribble_params)

    respond_to do |format|
      if @scribble.save
        format.html { redirect_to edit_scribble_url(@scribble), notice: 'Scribble was successfully created.' }
        format.json { render json: @scribble, status: :created, location: @scribble }
      else
        format.html { render action: "new" }
        format.json { render json: @scribble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scribbles/1
  # PATCH/PUT /scribbles/1.json
  def update
    respond_to do |format|
      if @scribble.update(scribble_params)
        format.html { redirect_to @scribble, notice: 'Scribble was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scribble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scribbles/1
  # DELETE /scribbles/1.json
  def destroy
    @scribble.destroy

    respond_to do |format|
      format.html { redirect_to scribbles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scribble
      @scribble = Scribble.find(params[:id])
    end

    # Use this method to whitelist the permissible parameters. Example:
    #   params.require(:person).permit(:name, :age)
    #
    # Also, you can specialize this method with per-user checking of permissible
    # attributes.
    def scribble_params
      params.require(:scribble).permit(:text)
    end
end
