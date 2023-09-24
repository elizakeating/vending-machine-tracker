class MachineSnacksController < ApplicationController
  def update
    MachineSnack.create(machine: Machine.find(params[:machine_id]), snack: Snack.find(params[:snack_id]))

    redirect_to machine_path(Machine.find(params[:machine_id]))
  end

  def destroy
    machine_snack = MachineSnack.where("machine_id = ? AND snack_id = ?", params[:machine_id], params[:snack_id])
    machine_snack.first.destroy

    redirect_to machine_path(Machine.find(params[:machine_id]))
  end
end