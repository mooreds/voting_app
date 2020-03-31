require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  def setup
    @candidate = Candidate.create(name: 'dan')
    @voter = Voter.create(name: 'boris')
  end
  test "can create vote" do
    assert_not_nil Vote.new
  end
  test "can create vote with values" do
    #assert Vote.create(candidate_id: @candidate.id, voter_id: @voter.id)
  end
  test "can't create duplicate vote" do
    Vote.create(candidate_id: @candidate.id, voter_id: @voter.id)
    new_vote = Vote.create(candidate_id: @candidate.id, voter_id: @voter.id)
    assert_equal false, new_vote.save
    assert_equal 1, Vote.count 
  end
end
