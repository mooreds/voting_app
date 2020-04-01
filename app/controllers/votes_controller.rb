class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
    @candidates = Candidate.all
  end

  # GET /votes/new
  def new
    @candidates = Candidate.all
    @voters = Voter.all
    @vote = Vote.new
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to votes_path, notice: 'Vote was successfully tallied.' }
      else
        # need to load it up so that we can render new on error correctly
        @candidates = Candidate.all
        @voters = Voter.all
        format.html { render :new }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def vote_params
      params.require(:vote).permit(:candidate_id, :voter_id)
    end
end
