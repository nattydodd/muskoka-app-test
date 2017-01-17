class VoteMailer < ActionMailer::Base
    default :from => "nataliedodd89@gmail.com"

  def vote_confirmation(vote)
     @vote = vote
     @entry = @vote.entry
     mail(:to => "#{@vote.email} <#{@vote.email}>", :subject => "Vote Confirmation")
  end

end
