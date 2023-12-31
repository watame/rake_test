# frozen_string_literal: true

require 'rails_helper'
require 'rake_helper'

RSpec.describe 'test:argument_parse', type: :task do
  subject(:argument_parse){ Rake.application['test:argument_parse'] }

  context "引数が1つ与えられたとき" do
    # extras を利用する都合上、Rake::TaskArgumentsを利用してパラメータを設定する
    # See https://docs.ruby-lang.org/ja/latest/class/Rake=3a=3aTaskArguments.html
    let(:args) { Rake::TaskArguments.new([:first], [1]) }

    it 'firstに設定した値が標準出力に表示される' do
      expected = "\"first: 1, second: , extra: []\"\n"
      expect { argument_parse.execute(args) }.to output(expected).to_stdout
    end
  end

  context "引数が2つ与えられたとき" do
    let(:args) { Rake::TaskArguments.new([:first, :second], [1, 2]) }

    it 'first, secondに設定した値が標準出力に表示される' do
      expected = "\"first: 1, second: 2, extra: []\"\n"
      expect { argument_parse.execute(args) }.to output(expected).to_stdout
    end
  end

  context "引数が2つを超えて与えられたとき" do
    let(:args) { Rake::TaskArguments.new([:first, :second], [1, 2, 3, 4]) }

    it 'first, secondに設定した値、余剰の引数が標準出力に表示される' do
      expected = "\"first: 1, second: 2, extra: [3, 4]\"\n"
      expect { argument_parse.execute(args) }.to output(expected).to_stdout
    end
  end
end
