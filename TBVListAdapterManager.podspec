Pod::Spec.new do |s|
  s.name = 'TBVListAdapterManager'
  s.version = '0.1.0'
  s.summary = 'TBVListAdapterManager.'
  s.homepage = 'https://github.com/tobevoid/TBVListAdapterManager'
  s.documentation_url = 'https://github.com/tobevoid/TBVListAdapterManager'

  s.license =  { :type => 'MIT' }
  s.authors = 'tripleCC'
  s.source = {
    :git => 'https://github.com/tobevoid/TBVListAdapterManager.git',
    :tag => s.version.to_s,
  }

  s.source_files = 'TBVListAdapterManager/Classes/*'

  s.ios.deployment_target     = "8.0"

  s.dependency 'IGListKit', '~> 3.0'
end
