# diablo3/community_api_spec.rb
# detail documentation located: https://develop.battle.net/documentation/diablo-3/community-apis

require_relative '../../spec_helper'
include ApiTestClient

describe "Diablo 3 Community API Test" do
  before(:all) do
    @client = ApiTestClient
    @access_token = @client.get_access_token
  end

  it "GET All Diablo 3 Act List" do
    resp = @client.get_request("/d3/data/act", @access_token)
    expect(resp["acts"]).not_to be nil
    expect(resp["acts"].count).to eql 5
  end

  it "GET the first Act" do
    resp = @client.get_request("/d3/data/act/1", @access_token)
    expect(resp["slug"]).to eql("act-i")
    expect(resp["name"]).to eql("Act I")
    expect(resp["number"]).to eql(1)
    expect(resp["quests"].count).to eql(10)
  end

  it "GET the Blacksmith Artisan data" do
    resp = @client.get_request("/d3/data/artisan/blacksmith", @access_token)
    expect(resp["slug"]).to eql("blacksmith")
    expect(resp["name"]).to eql("Blacksmith")
    expect(resp["portrait"]).to eql("pt_blacksmith")
    expect(resp["training"]).not_to be nil
  end

  it "GET the Flamberge of the Blacksmith data" do
    resp = @client.get_request("/d3/data/artisan/blacksmith/recipe/apprentice-flamberge", @access_token)
    expect(resp["id"]).to eql("Sword_2H_003")
    expect(resp["slug"]).to eql("apprentice-flamberge")
    expect(resp["name"]).to eql("Apprentice Flamberge")
    expect(resp["cost"]).to eql(1000)
    expect(resp["reagents"]).not_to be nil
    expect(resp["itemProduced"]).not_to be nil
  end

  it "GET the Templar Follower data" do
    resp = @client.get_request("/d3/data/follower/templar", @access_token)
    expect(resp["slug"]).to eql("templar")
    expect(resp["name"]).to eql("Templar")
    expect(resp["realName"]).to eql("Kormac")
    expect(resp["portrait"]).to eql("templar")
    expect(resp["skills"]).not_to be nil
  end

  it "GET the Crusader Class data" do
    resp = @client.get_request("/d3/data/hero/crusader", @access_token)
    expect(resp["slug"]).to eql("crusader")
    expect(resp["name"]).to eql("Crusader")
    expect(resp["maleName"]).to eql("Crusader")
    expect(resp["femaleName"]).to eql("Crusader")
    expect(resp["icon"]).to eql("x1_crusader_male")
    expect(resp["skillCategories"]).not_to be nil
    expect(resp["skills"]).not_to be nil
  end

  it "GET the Barbarian Bash skill data" do
    resp = @client.get_request("/d3/data/hero/barbarian/skill/bash", @access_token)
    expect(resp["skill"]["slug"]).to eql("bash")
    expect(resp["skill"]["name"]).to eql("Bash")
    expect(resp["skill"]["icon"]).to eql("barbarian_bash")
    expect(resp["skill"]["level"]).to eql(1)
    expect(resp["skill"]["tooltipUrl"]).to eql("/class/barbarian/active/bash")
    expect(resp["skill"]["description"]).to eql("Generate: 6 Fury per attack\n\nBrutally smash an enemy for 320% weapon damage.")
    expect(resp["runes"]).not_to be nil
  end

  it "GET the all the 2 Handed Sword Item Type data" do
    resp = @client.get_request("/d3/data/item-type/sword2h", @access_token)
    expect(resp.count).to eql(37)
    resp.each do |sword|
      expect(sword["id"]).not_to be nil
      expect(sword["slug"]).not_to be nil
      expect(sword["name"]).not_to be nil
      expect(sword["icon"]).not_to be nil
      expect(sword["path"]).not_to be nil
    end
  end

  it "GET the item Corrupted Ashbringer Sword data" do
    resp = @client.get_request("/d3/data/item/corrupted-ashbringer-Unique_Sword_2H_104_x1", @access_token)
    expect(resp["id"]).to eql("Unique_Sword_2H_104_x1")
    expect(resp["slug"]).to eql("corrupted-ashbringer")
    expect(resp["name"]).to eql("Corrupted Ashbringer")
    expect(resp["icon"]).to eql("unique_sword_2h_104_x1_demonhunter_male")
    expect(resp["tooltipParams"]).to eql("/item/corrupted-ashbringer-Unique_Sword_2H_104_x1")
    expect(resp["requiredLevel"]).to eql(70)
    expect(resp["stackSizeMax"]).to eql(0)
    expect(resp["accountBound"]).to be true
    expect(resp["attributes"]).not_to be nil
  end

end
