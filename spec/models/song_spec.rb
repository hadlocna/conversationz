require 'spec_helper'

describe Song do
  let(:song_params) { { :title => "White Christmas", :artist => "Bing Crosby", :album => "Holiday Inn", :year => 1941, :short_url => "http://www.placeholder.com"  } }
  let(:song) { Song.new(song_params) }

  context "#initialize" do
    it "instantiates a song" do
      song.should be_an_instance_of(Song)
    end
  end

  context "#save" do

    it "valid songs can be saved successfully" do
      song.save!

      Song.find(song.id).should be_an_instance_of Song
    end

    it "will not allow a null title" do
      song.title = nil
      expect { song.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "will not allow a null short_url" do
      song.short_url = nil
      expect { song.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it "will allow a null artist" do
      song.artist = nil
      expect { song.save! }.to_not raise_error(ActiveRecord::StatementInvalid)
    end

    it "will allow a null album" do
      song.album = nil
      expect { song.save! }.to_not raise_error(ActiveRecord::StatementInvalid)
    end

    it "will allow a null year" do
      song.year = nil
      expect { song.save! }.to_not raise_error(ActiveRecord::StatementInvalid)
    end

  end

  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:artist) }
  it { should allow_mass_assignment_of(:album) }
  it { should allow_mass_assignment_of(:year) }
  it { should allow_mass_assignment_of(:short_url) }

end
