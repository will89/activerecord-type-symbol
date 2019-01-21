# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'activerecord-type-symbol'
  spec.version       = '0.2.0'
  spec.authors       = ['Will Leonard']
  spec.email         = ['will.leonard89@gmail.com']

  spec.summary       = 'Adds a symbol attribute type to activerecord'
  spec.homepage      = 'https://github.com/will89/activerecord-type-symbol'
  spec.license       = 'MIT'

  spec.metadata      = {
    'homepage_uri' => 'https://github.com/will89/activerecord-type-symbol',
    'changelog_uri' => 'https://github.com/will89/activerecord-type-symbol/blob/master/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/will89/activerecord-type-symbol/',
    'bug_tracker_uri' => 'https://github.com/will89/activerecord-type-symbol/issues'
  }

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activemodel', '>= 5.0'
  spec.add_dependency 'activerecord', '>= 5.0'

  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'with_model'

  if RUBY_PLATFORM == 'java'
    spec.add_development_dependency 'activerecord-jdbcsqlite3-adapter'
    spec.add_development_dependency 'jdbc-sqlite3'
  else
    spec.add_development_dependency 'sqlite3'
  end
end
