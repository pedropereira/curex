# frozen_string_literal: true

class ProjectsController < ApplicationController
  def create
    form = CreateProjectForm.new(contract: CreateProjectContract.new, params: permitted_params).call

    if form.success?
      render(json: serialize(form.result))
    else
      render(json: { errors: form.errors }, status: :bad_request)
    end
  end

  private

  def permitted_params
    params.require(:project).permit(:name).to_h
  end

  def serialize(project)
    ProjectSerializer.new(project: project).call
  end
end
