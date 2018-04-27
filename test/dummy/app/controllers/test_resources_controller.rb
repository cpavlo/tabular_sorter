class TestResourcesController < ApplicationController
  before_action :set_test_resource, only: [:show, :edit, :update, :destroy]

  # GET /test_resources
  def index
    @test_resources = tabular_sorter.apply(TestResource.all)
  end

  # GET /test_resources/1
  def show
  end

  # GET /test_resources/new
  def new
    @test_resource = TestResource.new
  end

  # GET /test_resources/1/edit
  def edit
  end

  # POST /test_resources
  def create
    @test_resource = TestResource.new(test_resource_params)

    if @test_resource.save
      redirect_to @test_resource, notice: 'Test resource was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /test_resources/1
  def update
    if @test_resource.update(test_resource_params)
      redirect_to @test_resource, notice: 'Test resource was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /test_resources/1
  def destroy
    @test_resource.destroy
    redirect_to test_resources_url, notice: 'Test resource was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test_resource
    @test_resource = TestResource.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def test_resource_params
    params.require(:test_resource).permit(:name, :age, :kind)
  end
end
