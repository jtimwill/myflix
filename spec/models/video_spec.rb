require 'spec_helper'

 describe Video do
  it { should belong_to(:category)}
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}

  it "cannot find a single video" do
  end

  it "can find find one video" do
  end

  it "can find many videos" do
  end 
  
end


