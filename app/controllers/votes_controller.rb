class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
    @candidates = Candidate.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @candidates = Candidate.all
    @voters = Voter.all
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        @votes = Vote.all
        @candidates = Candidate.all
        format.html { redirect_to :index, notice: 'Vote was successfully created.' }
      else
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
