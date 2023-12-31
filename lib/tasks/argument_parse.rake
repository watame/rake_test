namespace :test do
  desc "引数の挙動確認用rakeタスク"
  # :environment でRailsのアプリケーションコードを読み込んでいる
  # See https://qiita.com/FumiyaShibusawa/items/11035fc640bb36a615ad
  task "argument_parse", [:first, :second] => :environment do |_task, args|
    # argsは Rake::TaskArguments で取得でき、設定したシンボルで値を「文字列」として取得できる
    first = args[:first]
    second = args[:second]
    # シンボルで指定していない余剰の引数については extras で配列形式で取得できる
    extra = args.extras

    p "first: #{first}, second: #{second}, extra: #{extra}"
  end
end
