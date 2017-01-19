require "app/models/config/base"
require "app/models/config/parser"
require "app/models/config/parser_error"
require "app/models/config/python"
require "app/models/config/serializer"
require "app/models/config_content"
require "app/models/missing_owner"
require "inifile"

describe Config::Python do
  describe "#content" do
    context "when an owner is provided" do
      it "merges the parsed config with the owner's" do
        raw_config = <<~EOS
          [flake8]
          max-line-length = 160
        EOS
        owner_config_content = {
          "flake8" => {
            "max-complexity" => 10,
          },
        }
        owner = instance_double("Owner", config_content: owner_config_content)
        config = build_config(raw_config, owner)

        expect(config.content).to eq(
          "flake8" => {
            "max-complexity" => 10,
            "max-line-length" => 160,
          },
        )
      end
    end

    context "when there is no owner" do
      it "returns the parsed configuration" do
        raw_config = <<~EOS
          [flake8]
          max-line-length = 160
        EOS
        config = build_config(raw_config)

        expect(config.content).to eq("flake8" => { "max-line-length" => 160 })
      end
    end

    context "when there is no config content for the given linter" do
      it "is an empty hash" do
        hound_config = double(
          "HoundConfig",
          commit: double("Commit"),
          content: {},
        )
        config = Config::Python.new(hound_config)

        expect(config.content).to eq({})
      end
    end
  end

  describe "#serialize" do
    it "returns the parsed content back to INI" do
      raw_config = <<~EOS
        [flake8]
        max-line-length = 160
      EOS
      config = build_config(raw_config)

      expect(config.serialize).to eq raw_config
    end
  end
end
