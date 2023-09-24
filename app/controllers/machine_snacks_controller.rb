class MachineSnacksController < ApplicationController
  def update
    MachineSnack.create(machine: Machine.find(params[:machine_id]), snack: Snack.find(params[:snack_id]))

    redirect_to machine_path(Machine.find(params[:machine_id]))
  end
end