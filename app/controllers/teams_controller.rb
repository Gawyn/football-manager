class TeamsController < ApplicationController
  def show
    @team = Team.find params[:id]
    @players = @team.players.decorate
  end

  def create
    @team = Team.new(name: params[:team_name])
    @team.user = current_user

    if @team.save
      redirect_to @team
    else
      redirect_to root_path
    end
  end
end
