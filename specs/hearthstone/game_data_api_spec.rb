# hearthstone/game_data_api_spec.rb
# detail documentation located: https://develop.battle.net/documentation/hearthstone/game-data-apis

require_relative '../../spec_helper'
include ApiTestClient

describe "HearthStone Community API Test" do
  before(:all) do
    @client = ApiTestClient
    @access_token = @client.get_access_token
  end

  it "GET All Cards" do
    resp = @client.get_request("/hearthstone/cards", @access_token)
    expect(resp["cards"].count).to eql(40)
    resp["cards"].each do |card|
      expect(card["id"]).not_to be nil
      expect(card["slug"]).not_to be nil
      expect(card["classId"]).not_to be nil
      expect(card["cardTypeId"]).not_to be nil
      expect(card["artistName"]).not_to be nil
      expect(card["name"]).not_to be nil
      expect(card["image"]).not_to be nil
    end
  end

  it "GET one Card: Arch-Villain Rafaam" do
    resp = @client.get_request("/hearthstone/cards/52119-arch-villain-rafaam", @access_token)
    expect(resp["id"]).to eql(52119)
    expect(resp["classId"]).to eql(9)
    expect(resp["cardTypeId"]).to eql(4)
    expect(resp["cardSetId"]).to eql(1130)
    expect(resp["rarityId"]).to eql(5)
    expect(resp["artistName"]).to eql("Alex Horley Orlandelli")
    expect(resp["health"]).to eql(8)
    expect(resp["attack"]).to eql(7)
    expect(resp["name"]).to eql("Arch-Villain Rafaam")
  end

  it "GET Card Backs" do
    resp = @client.get_request("/hearthstone/cardbacks", @access_token)
    expect(resp["cardBacks"].count).to eql(40)
    resp["cardBacks"].each do |card_back|
      expect(card_back["id"]).not_to be nil
      expect(card_back["sortCategory"]).not_to be nil
      expect(card_back["text"]).not_to be nil
      expect(card_back["name"]).not_to be nil
      expect(card_back["image"]).not_to be nil
      expect(card_back["slug"]).not_to be nil
    end
  end

  it "GET one Card Back:" do
    resp = @client.get_request("/hearthstone/cardbacks/155-pizza-stone", @access_token)
    expect(resp["id"]).to eql(155)
    expect(resp["sortCategory"]).to eql(5)
    expect(resp["text"]).to eql("For when you want to build a deck with extra cheese. Acquired from winning five games in Ranked Play, February 2019.")
    expect(resp["name"]).to eql("Pizza Stone")
    expect(resp["image"]).to eql("https://d15f34w2p8l1cc.cloudfront.net/hearthstone/1b7d445383ce6a736c4b1cb6b0301b6aa9c27963267acb8dae29d01e09f586d5.png")
    expect(resp["slug"]).to eql("155-pizza-stone")
  end

end

